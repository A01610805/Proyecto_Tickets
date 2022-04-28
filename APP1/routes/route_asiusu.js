const express = require('express');
const router = express.Router();

const asiusu = require('../controllers/controller_asiusu');
const isAuth = require('../util/is-auth.js');

router.get('/asignar/:id', isAuth, asiusu.get_usuario);
router.post('/asignar/:id', asiusu.post_asiusu);
router.get('/', isAuth, asiusu.root);

module.exports = router;  