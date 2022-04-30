const express = require('express');
const router = express.Router();

const personal = require('../controllers/controller_datosPer');
const isAuth = require('../util/is-auth.js');

router.get('/personal', isAuth, personal.get_usuario);
//router.post('/personal', personal.post_pass);
router.get('/', isAuth, personal.root);

module.exports = router;
