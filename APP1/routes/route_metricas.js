const express = require('express');
const router = express.Router();

const metricas = require('../controllers/controller_metricas');

router.get('/', metricas.getmetricas);

module.exports = router;