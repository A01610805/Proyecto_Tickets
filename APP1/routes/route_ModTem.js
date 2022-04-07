const express = require('express');
const router = express.Router();

const MTem = require('../controllers/controller_ModTem');

router.get('/mod_template', MTem.get_ticket);
router.get('/mod_preg/:id', MTem.get_preguntas);
router.get('/', MTem.root);

module.exports = router; 