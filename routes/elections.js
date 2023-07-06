const express = require('express');
const bodyParser = require('body-parser');
const electionsController = require('../controllers/elections');
const { route } = require('./pages');
const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());


//router.get('/' , electionsController._elections)
router.post('/add-elections' , electionsController.add_elections)
router.post('/add-party' , electionsController.add_party)
router.post('/votefo' , electionsController.votefor)

module.exports = router;