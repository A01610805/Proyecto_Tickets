const express = require('express');
const router = express.Router();

const tilogin = require('../controllers/t_controllers');
<<<<<<< HEAD
const isAuth = require('../util/is-auth.js');
const {authPage} = require('../util/rbac.js');

//Prueba con ajax
router.get('/activos/:valor', isAuth, authPage(['1','2']), tilogin.buscar_activos);
router.get('/start1/:start1', isAuth, authPage(['1','2']),tilogin.get_activos);
router.get('/activos', isAuth, authPage(['1','2']), tilogin.get_activos);
router.post('/activos', tilogin.post_activos);

//Prueba con ajax
router.get('/archivo/:valor', isAuth, authPage(['1','2']), tilogin.buscar_archivo);
router.get('/start2/:start2', isAuth, authPage(['1','2']), tilogin.get_archivo);
router.get('/archivo', isAuth, authPage(['1','2']), tilogin.get_archivo);
router.post('/archivo', tilogin.post_archivo);

//Prueba con ajax
router.get('/propio/:valor', isAuth, tilogin.buscar_propios);
router.get('/start3/:start3', isAuth, tilogin.get_ticketspropios);
router.get('/propio', isAuth, tilogin.get_ticketspropios);
//router.post('/propio', tilogin.post_propio);
router.post('/propio', tilogin.borrarpropios);

router.post('/', tilogin.root);

module.exports = router;
=======

router.get('/activos', tilogin.get_activos);
router.post('/activos', tilogin.post_activos);
router.get('/archivo', tilogin.get_archivo);
router.post('/archivo', tilogin.post_archivo);
router.get('/propio', tilogin.get_ticketspropios);
router.post('/propio', tilogin.borrarpropios);
router.post('/', tilogin.root);

module.exports = router;
>>>>>>> 307171d521586ba6900f349b0ef4600271bab660
