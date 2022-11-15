// importing the dependencies
const express = require('express');
const bodyParser = require('body-parser');
const { as } = require('pg-promise');

// Added from Lab 9
// const bcrypt = require('bcrypt');
const axios = require('axios');
const session = require('express-session');
const { query } = require('express');

// defining the Express app
const app = express();

// using bodyParser to parse JSON in the request body into JS objects
app.use(bodyParser.json());

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
  // Hash the password -- Can this be done before being sent to server?
  var hash = await bcrypt.hash(req.body.password, 10);

  const query = `INSERT INTO users (username, password) VALUES ($1, $2);`
  db.any(query, [req.body.username, hash])

  // Username/Password were successfully input into the tables
  .then(function(data){
    res.redirect('/login')
  })

  // The information failed to be input into the SQL file
  .catch(function(err){
    res.redirect('/register');
    return console.log(err);
  })
});


/* LOGIN */

app.get('/login', (req, res)=>{
  res.render('pages/login.ejs');
});

app.post('/login', async (req, res)=>{

  const query = `SELECT * FROM users WHERE username = $1;`
  db.any(query, [username])

  // Successfully found a matching username
  .then(async function(data){

    // Hash the new password and see if they match
    // req.body.password is straight from the EJS file, data[0].password stores the hashed password in the db
    const match = await bcrypt.compare(req.body.password, `${data[0].password}`);

    if(match == true){
      req.session.user = {
        api_key: process.env.API_KEY,
      };
      req.session.save();
      res.redirect('/home'); // Redirect to the home page upon match
    }
    else{
      console.log('Incorrect username or password')
      res.redirect('/login'); // Redirect to the login page if credentials are wrong
    }

  })

  // If the query failed redirect back to the login
  .catch(function (err){
    res.redirect('/login');
    return console.log(err);
  });
});


/* AUTHENTICATION MIDDLEWARE */

// const auth = (req, res, next) => {
//   if (!req.session.user) {
//     // Default to register page.
//     return res.redirect('/register');
//   }
//   next();
// };

// Authentication Required
// app.use(auth);


/* HOME */

app.get('/home', (req, res)=>{
  res.render('pages/home.ejs');
});

app.get('/new_post', (req, res) => {
  res.render('pages/new_post.ejs');
});

/* LOGOUT */

// Destroy user session and redirect to a new page
app.get('/logout', (req, res) => {
  req.session.destroy();

  // login.ejs can be changed to a landing page later
  res.render('pages/login.ejs') 
  console.log('Logged out!')
});
