const express = require('express');
const router = express.Router();

const MTem = require('../controllers/controller_ModTem');
const isAuth = require('../util/is-auth.js');

router.get('/get_template', isAuth, MTem.get_ticket);
router.get('/get_preg/:id', isAuth, MTem.get_preguntas);
router.post('/camb_cat/:id', MTem.post_mod);
// router.post('/n_preg/:id', MTem.post_npreg);
// router.post('/de_preg/:id', MTem.delete_preguntas);
router.get('/', isAuth, MTem.root);

module.exports = router; 