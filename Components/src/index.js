// importing the dependencies
const express = require('express');
const bodyParser = require('body-parser');
const { as } = require('pg-promise');

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
    // TO DO
});


/* LOGIN */

app.get('/login', (req, res)=>{
    res.render('pages/login.ejs');
});


/* HOME */

app.get('/home', (req, res)=>{
    res.render('pages/home.ejs');
});


/* LOGOUT */

// Destroy user session and redirect to a new page
app.get('/logout', (req, res) => {
    req.session.destroy();

    // login.ejs can be changed to a landing page later
    res.render('pages/login.ejs') 
    console.log('Logged out!')
});
