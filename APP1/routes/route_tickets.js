const express = require('express');
const router = express.Router();

const tilogin = require('../controllers/t_controllers');
const isAuth = require('../util/is-auth.js');

//Prueba con ajax
router.get('/activos/:valor', isAuth, tilogin.buscar_activos);
router.get('/start1/:start1', isAuth, tilogin.get_activos);
router.get('/activos', isAuth, tilogin.get_activos);
router.post('/activos', tilogin.post_activos);

//Prueba con ajax
router.get('/archivo/:valor', isAuth, tilogin.buscar_archivo);
router.get('/start2/:start2', isAuth, tilogin.get_archivo);
router.get('/archivo', isAuth, tilogin.get_archivo);
router.post('/archivo', tilogin.post_archivo);

//Prueba con ajax
router.get('/propio/:valor', isAuth, tilogin.buscar_propios);
router.get('/start3/:start3', isAuth, tilogin.get_ticketspropios);
router.get('/propio', isAuth, tilogin.get_ticketspropios);
//router.post('/propio', tilogin.post_propio);
router.post('/propio', tilogin.borrarpropios);

router.post('/', tilogin.root);

module.exports = router;
