const express = require('express');
const router = express.Router();

const bUser = require('../controllers/controller_BuscarU');
const isAuth = require('../util/is-auth.js');

router.get('/busqueda', isAuth, bUser.get_busqueda);
router.get('/buscar/:valor', isAuth, bUser.buscar);
router.get('/', isAuth, bUser.root);

module.exports = router; 