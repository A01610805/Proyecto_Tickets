const express = require('express');
const router = express.Router();

const cgenticket = require('../controllers/controller_GenT');

router.get('/enviar_ticket', cgenticket.get_genticket);
router.post('/enviar_ticket', cgenticket.genticket);
router.get('/', cgenticket.root);

module.exports = router;