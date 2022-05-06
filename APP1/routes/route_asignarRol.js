const express = require('express');
const router = express.Router();

const AR = require('../controllers/controller_asigRol');
const isAuth = require('../util/is-auth.js');

router.get('/get_usuario/:id', isAuth, AR.get_usuario);
router.post('/post_rol/:id', AR.post_rol);

router.get('/', isAuth, AR.root);

module.exports = router;  
