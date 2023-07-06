
var path = require('path');
const mysql = require("mysql");
const jwt = require("jsonwebtoken");
const async = require('hbs/lib/async');
const { Console } = require('console');
var cookieParser = require('cookie-parser');
var url = require('url');

const db = mysql.createConnection({
    host     : process.env.DATABASE_HOST,
    user     : process.env.DATABASE_USER,
    password : process.env.DATABASE_PASSWORD,
    database : process.env.DATABASE
});

exports.add_elections = async (req,res)=>
{
    console.log(req.body)
    const value = {election_id: req.body.election_id , election_name: req.body.election_name};
    db.query('INSERT INTO elections SET ?', value , (error , results) =>{
        
        if(error){
            console.log(error);
        }
        else{
           return res.redirect('/admin-dashboard');
        }
    }
    );

    db.query("ALTER TABLE vote ADD (`?` INT);" , `${req.body.election_id}`.replace(/\'/gi,'') , (error , result) =>{

        if(error){
            console.log(error);
        }
        else{
           console.log("column added");
        }

    }
    );
 };

 exports.display_elections = async (req,res)=>
 {
     
     db.query('SELECT * FROM elections' , (error, results) =>{

        if(error){
            console.log(error);
        }
        else{
            res.render('admin-dashboard', { results });
        }

     }
     );


 };


 exports.display_parties = async (req,res)=>
 {
    console.log(req.params.election_id)
     db.query('SELECT * FROM parties WHERE election_id = ?' , [req.params.election_id] , (error, results) =>{

        if(error){
            console.log(error);
        }
        else{
            res.render('parties', { results });
        }

     }
     );


 };

 exports.add_party = async (req,res)=>
 {
     console.log(req.body)
     const value = {party_id: req.body.party_id , party_name: req.body.party_name , election_id: req.body.election_id} ;
     db.query('INSERT INTO parties SET ?', value , (error , results) =>{
         
         if(error){
             console.log(error);
         }
         else{
            return res.redirect(`/parties/${req.body.election_id}`);
         }
     }
     );
  };

  exports.get_elections = async (req,res)=>
  {
    if(req.cookies.voter_id != null){
      
      db.query('SELECT * FROM elections' , (error, results) =>{
 
         if(error){
             console.log(error);
         }
         else{
             res.render('vote', { results });
         }
 
      }
      );
 
    }
  };

  exports.get_parties = async (req,res)=>
 {
    console.log(req.params.election_id)

    res.clearCookie("election_id")
    res.cookie("election_id" , req.params.election_id);
    console.log(req.cookies.election_id)

     console.log(req.originalUrl)
     var path = req.originalUrl
     console.log(path)
     var pathsplit = path.split('/')
     console.log(pathsplit)
     console.log(pathsplit[2])

     var election_ID = pathsplit[2]
     console.log(election_ID)

     //res.clearCookie("election_ID");

     res.cookie("election_ID", pathsplit[2]);
     console.log(req.cookies.election_ID);



    // var pathsplit2 = pathsplit[1].split('/')
    // console.log(pathsplit2[1])

    // console.log(req.params.election_id)
    if(req.cookies.voter_id != null){
    
    
     db.query('SELECT party_id , party_name FROM parties WHERE election_id = ?' , [req.params.election_id] , (error, results) =>{

        if(error){
            console.log(error);
        }
        else{
            console.log(results);
            res.render(`votefo`, { results });
        }
        console.log(req.cookies.voter_id)

     }
     );
}}

exports.votefor = (req,res)=>{

    console.log(req.cookies.election_ID)
   // var urlParams = new URLSearchParams(window.location.search);
    if(req.cookies.voter_id!=null){
    party_id = req.body.btnradio;
    db.query('SELECT vote_count FROM parties WHERE party_id = ?' , [party_id] , (error , results) => {
        if(error){
            console.log(error);
            return res.render('votefo' , {
            message: 'some unexpeced error'
        });
        }

        if(results.length === 0){
            return res.render('votefo' , {
            message: 'Party does not exist'
            });
        }else {  
            var vote_count = results[0].vote_count+1;
            db.query('UPDATE parties SET vote_count=? WHERE party_id = ? ' , [vote_count , party_id] , (error , results) => {
                if(error){
                    console.log(error);
                }else{
                    db.query('UPDATE vote SET `?` = ? WHERE voter_id = ? ' , [req.cookies.election_ID , party_id , req.cookies.voter_id] , (error , results) => {
                        if(error){
                            console.log(error);
                        }else{
                         res.clearCookie("voter_id");
                            return res.render('index' , {
                                message: 'Your vote is noted.. '
                            } );
                        }
            
                    });
                }
    
            })
             }
        });
    }
    else{
        return res.render('index' , {
            message: 'Please login in before voting'
    
            });
    }
}