// importing the dependencies
const express = require('express');
const bodyParser = require('body-parser');
const { as } = require('pg-promise');

// Added from Lab 9
const bcrypt = require('bcryptjs'); // Changed bcrypt to bcryptjs to avoid errors
const axios = require('axios');
const session = require('express-session');
const { query } = require('express');

// defining the Express app
const app = express();

// using bodyParser to parse JSON in the request body into JS objects
app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

const pgp = require('pg-promise')();

// database configuration
const dbConfig = {
  host: 'db',
  port: 5432,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
};
  
const db = pgp(dbConfig);

// test your database
db.connect()
.then(obj => {
  console.log('Database connection successful'); // you can view this message in the docker compose logs
  obj.done(); // success, release the connection;
})
.catch(error => {
  console.log('ERROR:', error.message || error);
});

// From Lab 8
// set the view engine to ejs
app.set("view engine", "ejs");
app.use(bodyParser.json());

// From Piazza (get req.session.user to work)
// TODO - learn what these values mean
// set session
app.use(
  session({ 
    secret: "XASDASDA",
    saveUninitialized: false, 
    resave: false, 
  }) 
);

app.listen(3000);
console.log('Server is listening on port 3000');


// Redirect to login if no page specified
app.get('/', (req, res)=>{
  res.redirect('/login');
});


/* REGISTER */

app.get('/register', (req, res) => {
  res.render('pages/register.ejs');
});

app.post('/register', async (req, res)=>{

  // Take the optional user input data and either make it a correct value or null
  var twitter = req.body.twitter ? req.body.twitter.replace('@','') : null;
  var phoneNum = req.body.phonenum ? req.body.phonenum : null;
  var facebook = req.body.facebook ? req.body.facebook : null;

  var i = req.body.profilePic;
  var profilePic = i || 'https://static1.housesforsale.com/v2.4.5/assets/img/unknown_user.png';
  
  // Hash the password before inserting
  var hash = await bcrypt.hash(req.body.password, 10);
  
  // Make the location a lowercase string
  var location = `${req.body.location}`.toLowerCase()

  // Execute multiple db requests at once
  db.task(t => {

    // Get the location_id from the input param first
    return t.one(`SELECT location_id FROM locations WHERE loc_name = $1;`, [location])

      // If the location_id pull was a success
      .then(data => {

        // Input the new user data into the db
        var location_id = data.location_id
        return t.any(`INSERT INTO users (username, password, firstname, lastname, 
          email, profile_pic, phone_num, twitter, facebook_url, location_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);`,
          [req.body.username, hash, req.body.firstname, req.body.lastname, 
          req.body.email, profilePic, phoneNum, twitter, facebook, location_id])

          // Inserting wasn't successful
          .catch(err => {
            res.render('pages/register.ejs', {
              message: 'Something went wrong. Please check that the data you inserted was correct and isn\'t too long.',
              error: true
            });
            return console.log(err);
          })
      })
  })

  // All db commands went through
  .then(data => {
    res.status(200)
    console.log("Successfully Added Data!")
    res.redirect('/login')
  })

  // Something went wrong somewhere
  .catch(err => {
    res.status(400)
    res.render('pages/register.ejs', {
      message: 'Please enter a valid location (one of the 50 US states).',
      error: true
    });
    return console.log(err);
  })
});


/* LOGIN */

app.get('/login', (req, res)=>{
  res.render('pages/login.ejs');
});

app.post('/login', async (req, res)=>{

  const query = `SELECT * FROM users WHERE username = $1;`
  db.any(query, [req.body.username])

  // Successfully found a matching username
  .then(async (data)=>{

    // Get the information from the first element of the db return
    data = data[0]

    // req.body.password is straight from the EJS file, data.password stores the hashed password in the db
    const match = await bcrypt.compare(req.body.password, `${data.password}`);

    if(match == true){
      console.log("Successfully matched password!");

      // Store the user data in the sessions.user variable
      req.session.user = {
        user_id: data.user_id,
        username: data.username,
        email: data.email,
        location: data.location_id,
        firstname: data.firstname,
        lastname: data.lastname,
        phone_num: data.phone_num,
        twitter: data.twitter,
        facebook_url: data.facebook_url,
        profile_pic: data.profile_pic
      };
      req.session.save();

      res.render('pages/home.ejs', {curUserID: req.session.user.user_id}); // Redirect to the home page upon match
      return
    }
    else{
      console.log('Incorrect username or password')
      res.render('pages/login', {
        message: 'Incorrect username or password. Please try again.',
        error: true
      }); // Redirect to the login page if credentials are wrong
    }

  })

  // If the query failed redirect back to the login
  .catch(function (err){
    res.render('pages/login', {
      message: 'Incorrect username or password. Please try again.',
      error: true
    });
    console.log('Incorrect username or password');
  });
});


/* DEBUG CODE */
app.get('/debug', (req, res)=>{
  db.any("SELECT * FROM users;")
  .then(function(data){
    console.log(data);
    res.send(data);
  })
});


/* AUTHENTICATION MIDDLEWARE */

const auth = (req, res, next) => {
  if (!req.session.user) {
    // Default to register page.
    return res.redirect('/login');
  }
  next();
};

// Authentication Required
app.use(auth);



/* HOME */

app.get('/home', async (req, res)=>{
  const query = "SELECT * FROM users WHERE location_id = (SELECT location_id FROM locations WHERE loc_name = $1);";
  const query2 = "SELECT * FROM posts WHERE location_id = (SELECT location_id FROM locations WHERE loc_name = $1);";
  console.log(req.query.location);

  if(req.query.location != undefined) {
    db.task("get all", data => {
      return data.batch([
        data.any(query, req.query.location.toLowerCase()),
        data.any(query2, req.query.location.toLowerCase())
      ])
    })
    //db.any(query, query2, [req.query.location.toLowerCase()]) // lowercase the input since the db only has lowercase and we want Kansas = kansas
    .then((data) => {
      console.log("trying to get data");
      console.log(data[0]); // the results will be displayed on the terminal if the docker containers are running
      console.log(data[1]);
      // Send some parameters
      res.render("pages/home.ejs", {
        data, 
        curUserID: req.session.user.user_id
      });
    })
    .catch(error => {
      // Handle errors
      res.send("Error retrieving data"+ error);
      console.log("Failed to get data");
    })
  }
  else
  {
    res.render('pages/home.ejs', {curUserID: req.session.user.user_id})
  }


});

app.get('/search', async (req, res)=>{
  const query = "SELECT * FROM users WHERE location_id = (SELECT location_id FROM locations WHERE loc_name = $1)";
  console.log(req.query.location);
  if(req.query.location != undefined) {
    db.one(query, [
      req.query.location
    ])
    .then(async (users) => {
      console.log("trying to get data");
      console.log(users); // the results will be displayed on the terminal if the docker containers are running
      // Send some parameters
      res.render("pages/search.ejs", {users});
    })
    .catch(error => {
      // Handle errors
      res.send("Error retrieving data");
      console.log("Failed to get data");
    })
  }
});


/* USER */

app.get('/user/:user_id', (req, res) => {
  var curUserID = req.params.user_id ? req.params.user_id:req.session.user.user_id;

  db.any(`SELECT * FROM users WHERE username = (SELECT username FROM users WHERE user_id = $1);`, [curUserID])
  .then(returnUser => {
    returnUser = returnUser[0]

    res.render("pages/users.ejs", {
      returnUser,
      match: returnUser.user_id==req.session.user.user_id,
      noData: false,
      curUserID: req.session.user.user_id
    });
    
  })
  .catch(err =>{
    res.render("pages/users.ejs", {noData: true, curUserID: req.session.user.user_id})
  })
})

app.post('/user/', (req, res) => {
  
  // Take the optional user input data and either make it a correct value or null
  var twitter = req.body.twitter ? req.body.twitter.replace('@','') : null;
  var phoneNum = req.body.phonenum ? req.body.phonenum : null;
  var facebook = req.body.facebook ? req.body.facebook : null;
  var profile = req.body.pfp ? req.body.pfp : 'https://static1.housesforsale.com/v2.4.5/assets/img/unknown_user.png';

  const query = `UPDATE users SET 
  username = $1, firstname = $2, lastname = $3, email = $4, phone_num = $5, twitter = $6, facebook_url = $7, profile_pic = $8
  WHERE user_id = $9;`

  db.any(query, [
    req.body.username, req.body.firstname, req.body.lastname, req.body.email, phoneNum, twitter, facebook, profile, req.session.user.user_id
  ])

  .then(data => {
    res.render('pages/home.ejs', {curUserID: req.session.user.user_id})
    return
  })

  .catch(err => {
    console.log(err);
    res.render('pages/users.ejs', {
      message: 'Bad Data Inserted',
      error: true,
      curUserID: req.session.user.user_id,
      returnUser: req.session.user,
      noData: false,
      match: true
    })
    return
  })

})



app.get('/new_post', (req, res) => {
  res.render('pages/new_post.ejs', {curUserID: req.session.user.user_id});
});

app.post('/new_post', (req, res) => {
  var post_data = {
    user_id: req.session.user.user_id,
    title: req.body.title,
    description: req.body.description ? req.body.description : null,
    image_url: req.body.image_url ? req.body.image_url : null,
    rating: (req.body.rating !== '0') ? parseInt(req.body.rating) : null,
    location_id: req.session.user.location
  };

  const query = `INSERT INTO posts (user_id, title, description, image_url, rating, location_id)
                        VALUES ($1, $2, $3, $4, $5, $6);`;

  db.any(query, [
      post_data.user_id, post_data.title, post_data.description,
      post_data.image_url, post_data.rating, post_data.location_id
    ])
    .then(data => {
      res.render('pages/home', {
        message: 'Posted successfully!',
        curUserID: req.session.user.user_id
      });
    })
    .catch(err => {
      res.render('pages/home', {
        message: 'Failed to post. Please try again.',
        error: true,
        curUserID: req.session.user.user_id
      });
      console.log(err);
    });
});

/* LOGOUT */

// Destroy user session and redirect to a new page
app.get('/logout', (req, res) => {
  req.session.destroy();

  // login.ejs can be changed to a landing page later
  res.render('pages/login.ejs');
  console.log('Logged out!');
});
