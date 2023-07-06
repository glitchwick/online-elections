const mysql = require("mysql");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");
const path = require('path');
const { compare } = require("bcrypt");
const async = require('hbs/lib/async');
const { Console } = require('console');
var cookieParser = require('cookie-parser')

const db = mysql.createConnection({
    host     : process.env.DATABASE_HOST,
    user     : process.env.DATABASE_USER,
    password : process.env.DATABASE_PASSWORD,
    database : process.env.DATABASE
});

exports.admin_login = async(res,req)=>{
    console.log(req.body);
    const admin_id = req.body.admin_id;
    db.query('SELECT admin_id FROM admin WHERE admin_id = ?' , [admin_id] , (error , results) => {

        if(error){
            console.log(error);
            return res.render('admin-login' , {
            message: 'some unexpeced error'
        })
        }

        if(results.length === 0){
            return res.render('admin-login' , {
            message: 'Admin ID does not exist'
            });
        }else {  db.query('SELECT admin_password FROM admin WHERE admin_id = ?' , [admin_id] , (error , results) => {
             
            if(error){
                console.log(error);
                return res.render('admin-login' , {
                    message: 'some unexpeced error'
                });
            }

            if(compare(req.body.admin_password,results[0].admin_password)){

                res.cookie("admin_id", admin_id);
                return res.render('admin-dashboard');

            }
            else{ 
                return res.render('login' , {
                    message: 'wrong password'
                  });
                }
        });
        }
    });   
};

exports.register = async(req , res) => {
    console.log(req.body);

   const voter_id = req.body.voter_id;    
   const name = req.body.name;
   const surname = req.body.surname;
   const password = req.body.password;
   const passwordConfirm = req.body.passwordConfirm;
   const values = { voter_id: voter_id , name: name , surname: surname , password: password}

    db.query('SELECT voter_id FROM voter WHERE voter_id = ?' , [voter_id] , (error , results) => {

        if(error){
            console.log(error);
        }

        if(results.length !== 0){
            return res.render('register' , {
            message: 'Voter ID already registered'
            })
        }else if(password !== passwordConfirm){
            return res.render('register', {
            message: 'Passwords Dont Match'  
         } ) 
         }else{
            db.query( 'INSERT INTO voter SET ?', values , (error , results) => {
                if(error){
                    console.log(error);
                }else{
                    console.log(results);
                    return res.render('register' , {
                        message: ' Dear Voter You Are Registered'
                    } );
                }
    
            })
        }
    })
    }
        

    exports.login = async(req,res)=> {
        const voter_id = req.body.voter_id;   
        db.query('SELECT voter_id FROM voter WHERE voter_id = ?' , [voter_id] , (error , results) => {
    
            if(error){
                console.log(error);
                return res.render('login' , {
                message: 'some unexpeced error'
            })
            }
    
            if(results.length === 0){
                return res.render('login' , {
                message: 'Voter ID does not exist'
                });
            }else {  db.query('SELECT password FROM voter WHERE voter_id = ?' , [voter_id] , (error , results) => {
                 
                if(error){
                    console.log(error);
                    return res.render('login' , {
                        message: 'some unexpeced error'
                    });
                }
    
                if( req.body.password===results[0].password ){
                    
                        res.cookie("voter_id", voter_id);
                        console.log(req.cookies)
                        return res.redirect('/vote');
                }else{ 
                    return res.render('login' , {
                        message: 'wrong password'
                      });
                    }
                   
             
            }
                
        )}
                
            }
    
    
            
        );}
    
            
        


        
    

