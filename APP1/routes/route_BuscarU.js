const express = require('express');
const router = express.Router();

const bUser = require('../controllers/controller_BuscarU');
const isAuth = require('../util/is-auth.js');
const {authPage} = require('../util/rbac.js');

router.get('/busqueda', isAuth, authPage(['1','2']), bUser.get_busqueda);
router.get('/buscar/:valor', isAuth, authPage(['1','2']), bUser.buscar);
router.get('/', isAuth, authPage([1,2]), bUser.root);

module.exports = router; 