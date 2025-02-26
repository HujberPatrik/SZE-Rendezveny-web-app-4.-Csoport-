
const express = require('express');
const router = express.Router();
const Rendezveny = require('../controllers/rendezveny.controller.js');

router.get('/kervenyek', Rendezveny.getAllKerveny);
router.post('/kervenyHozzaad',Rendezveny.insertKerveny);
router.patch('/kervenyModosit',Rendezveny.updateKerveny);
module.exports = router;

    
