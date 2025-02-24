
const express = require('express');
const router = express.Router();
const Rendezveny = require('../controllers/rendezveny.controller.js');

router.get('/kervenyek', Rendezveny.getAllKerveny);


module.exports = router;

    
