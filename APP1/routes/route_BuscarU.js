const express = require('express');
const router = express.Router();

const bUser = require('../controllers/controller_BuscarU');

router.get('/busqueda', bUser.get_Busqueda);
router.get('/', bUser.root);

module.exports = router; 