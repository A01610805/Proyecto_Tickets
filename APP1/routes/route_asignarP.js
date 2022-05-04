const express = require('express');
const router = express.Router();

const AP = require('../controllers/controller_asigPrio');
const isAuth = require('../util/is-auth.js');

router.get('/get_tic/:id', isAuth, AP.get_tic);
router.post('/post_prio/:id', AP.post_prio);

router.get('/', isAuth, AP.root);

module.exports = router;  