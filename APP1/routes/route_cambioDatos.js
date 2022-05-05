const express = require('express');
const router = express.Router();

const personal = require('../controllers/controller_datosPer');
const isAuth = require('../util/is-auth.js');

router.get('/personal/cambio_pass', isAuth, personal.get_cpass);
router.post('/personal/cambio_pass', personal.post_cpass);
router.get('/personal', isAuth, personal.get_usuario);
router.get('/', isAuth, personal.root);

module.exports = router;
