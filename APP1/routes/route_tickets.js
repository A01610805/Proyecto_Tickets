const express = require('express');
const router = express.Router();

const tilogin = require('../controllers/t_controllers');

router.get('/activos', tilogin.get_activos);
router.post('/activos', tilogin.post_activos);
//Prueba con ajax
router.get('/activos', tilogin.buscar_activos);

router.get('/archivo', tilogin.get_archivo);
router.post('/archivo', tilogin.post_archivo);
//Prueba con ajax
router.get('/archivo', tilogin.buscar_archivo);

router.get('/propio', tilogin.get_ticketspropios);
router.post('/propio', tilogin.borrarpropios);
//Prueba con ajax
router.get('/archivo', tilogin.buscar_propios);

router.post('/', tilogin.root);

module.exports = router;