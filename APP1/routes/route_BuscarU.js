const express = require('express');
const router = express.Router();

const bUser = require('../controllers/controller_login');

router.get('/b_Usuario', bUser.get_Usuarios);
router.get('/Busqueda', bUser.get_Busqueda);
