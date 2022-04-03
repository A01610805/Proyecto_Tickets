const express = require('express');
const router = express.Router();
const cgenticket = require('../controllers/controller_GenT');

router.get('/enviar_ticket', cgenticket.get_genticket);
router.get('/categoria/:id', cgenticket.get_preguntas);
router.post('/categoria/:id', cgenticket.post_genticket);
router.get('/', cgenticket.root); 

module.exports = router;
