const express = require('express');
const router = express.Router();

const cgenticket = require('../controllers/controller_GenT');

router.get('/enviar-ticket', cgenticket.get_genticket);
router.post('/enviar-ticket', cgenticket.genticket);
router.get('/', clogin.root);

module.exports = router;