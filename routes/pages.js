const express = require('express');
const electionsController = require('../controllers/elections');
const router = express.Router();

router.get('/' , (req , res) =>{
    res.render('index');
});


router.get('/admin-login' , (req , res) =>{
    res.render('admin-login');
});

router.get('/admin-dashboard' , electionsController.display_elections)
//router.get('/edit-elections/:election_id' , electionsController.display_parties)

//router.get('/admin-dashboard' , (req , res) =>{
//   res.render('admin-dashboard');
//});

router.get('/add-elections' , (req , res) =>{
    res.render('add-elections');
});

router.get('/add-party' , (req , res) =>{
    res.render('add-party');
});

router.get('/parties' , (req , res) =>{
    res.render('parties');
});

router.get('/parties/:election_id' , electionsController.display_parties)
router.get('/vote' , electionsController.get_elections)
router.get('/vote/:election_id' , electionsController.get_parties)

//router.get('/vote/:election_id' , (req , res) =>{
 //   res.render('vote/:election_id');
//});

router.get('/login' , (req , res) =>{
    res.render('login');
});

router.get('/register' , (req , res) =>{
    res.render('register');
});


module.exports = router;