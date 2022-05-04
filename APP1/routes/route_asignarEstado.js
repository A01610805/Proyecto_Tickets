const express = require('express');
const router = express.Router();

const AE = require('../controllers/controller_asigEstado');
const isAuth = require('../util/is-auth.js');

router.get('/get_ticket/:id', isAuth, AE.get_ticket);
router.post('/post_estado/:id', AE.post_estado);

router.get('/', isAuth, AE.root);

module.exports = router;  
