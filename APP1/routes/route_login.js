const express = require('express');
const router = express.Router();

const clogin = require('../controllers/controller_login');
const isAuth = require('../util/is-auth.js');

router.get('/login',  clogin.get_login);
router.post('/login', clogin.login);
router.get('/logout', clogin.logout);
router.get('/signup',  clogin.get_signup);
router.post('/signup', clogin.post_signup);
<<<<<<< HEAD
router.get('/tickets', isAuth, clogin.get_ticketspropios);
=======
router.get('/tickets', clogin.get_ticketspropios);
>>>>>>> 307171d521586ba6900f349b0ef4600271bab660
router.post('/tickets', clogin.borrarpropios);
router.get('/', clogin.root);

module.exports = router;
