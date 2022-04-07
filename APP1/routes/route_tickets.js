const express = require('express');
const router = express.Router();

const tilogin = require('../controllers/t_controllers');

//Prueba con ajax
router.get('/activos/:valor',tilogin.buscar_activos);
router.get('/start/:start', tilogin.get_activos);
router.get('/activos', tilogin.get_activos);
router.post('/activos', tilogin.post_activos);

//Prueba con ajax
router.get('/archivo/:valor', tilogin.buscar_archivo);
router.get('/start/:start', tilogin.get_activos);
router.get('/archivo', tilogin.get_archivo);
router.post('/archivo', tilogin.post_archivo);

//Prueba con ajax
router.get('/propio/:valor', tilogin.buscar_propios);
router.get('/start/:start', tilogin.get_activos);
router.get('/propio', tilogin.get_ticketspropios);

router.post('/propio', tilogin.borrarpropios);

router.post('/', tilogin.root);

module.exports = router;
