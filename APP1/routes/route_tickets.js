const express = require('express');
const router = express.Router();

const tilogin = require('../controllers/t_controllers');

router.get('/activos', tilogin.get_activos);
router.post('/activos', tilogin.post_activos);
router.get('/archivo', tilogin.get_archivo);
router.post('/archivo', tilogin.post_archivo);
router.get('/tickets/usuario_Actual', tilogin.get_tickusuario);
router.post('/tickets/usuario_Actual', tilogin.post_tickusuario);
router.post('/', tilogin.root);

module.exports = router;