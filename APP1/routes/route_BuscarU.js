const express = require('express');
const router = express.Router();

const bUser = require('../controllers/controller_BuscarU');
<<<<<<< HEAD
const isAuth = require('../util/is-auth.js');
const {authPage} = require('../util/rbac.js');

router.get('/busqueda', isAuth, authPage(['1','2']), bUser.get_busqueda);
router.get('/buscar/:valor', isAuth, authPage(['1','2']), bUser.buscar);
router.get('/', isAuth, authPage([1,2]), bUser.root);
=======

router.get('/busqueda', bUser.get_busqueda);
router.get('/', bUser.root);
>>>>>>> 307171d521586ba6900f349b0ef4600271bab660

module.exports = router; 