const express = require('express');
const router = express.Router();
const path = require('path');
const mysql = require("mysql");
const dotenv = require("dotenv");
const bodyParser = require('body-parser');
const engines = require('consolidate');
//const connect = require('connect');
var cookieParser = require('cookie-parser');



dotenv.config({path: "./.env"});

const app = new express();
app.use(cookieParser());

const db = mysql.createConnection({
    host     : process.env.DATABASE_HOST,
    user     : process.env.DATABASE_USER,
    password : process.env.DATABASE_PASSWORD,
    database : process.env.DATABASE
});
//app.use(bodyParser.urlencoded({
 //   extended: true
 // }));

const publicDirectory = path.join(__dirname, './public');
app.use(express.static(publicDirectory));


//app.use(require('connect').bodyParser());

// parse application/x-www-form-urlencoded
//app.use(connect.bodyParser());
app.use(bodyParser.urlencoded({ extended: true }));
//app.use(bodyParser.urlencoded({
  //  extended: true
 // }));

// parse application/json
app.use(bodyParser.json());

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

// create application/json parser
//var jsonParser = bodyParser.json()
 
// create application/x-www-form-urlencoded parser
//var urlencodedParser = bodyParser.urlencoded({ extended: false })
// parse application/x-www-form-urlencoded
//app.use(bodyParser.urlencoded({ extended: false }))
//app.use(bodyParser.urlencoded({
 //   extended: true
 // }));

// parse application/json
//app.use(bodyParser.json())

//app.configure(function(){
 //   app.use(express.bodyParser());
 // });
 app.use(express.urlencoded({extended: true}));
//parse url encoded bodies( as sent by html forms)
app.use(express.urlencoded({extended: false}));
//app.use(
 //   express.urlencoded({
   //   extended: false
  //  })
 // )
// app.use(express.bodyParser());

//parse json bodies (as sent by API clients)
app.use(express.json());



console.log(__dirname);
app.set('views', __dirname + '/views');
app.engine('html', engines.mustache);
app.set('view engine', 'html');
app.set('view engine' , 'hbs');



db.connect((err) => {
    if(err){
        throw err;
    }
    console.log('MySql Connected...');
});

//Define Routes
app.use('/' , require('./routes/pages.js'));
app.use('/auth' , require('./routes/auth.js'));
app.use('/elections' , require('./routes/elections.js'));


app.listen('5001' , () => {
    console.log('Server started on port 5001');
});

module.exports = app;
