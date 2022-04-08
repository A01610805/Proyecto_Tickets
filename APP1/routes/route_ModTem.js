const express = require('express');
const router = express.Router();

const MTem = require('../controllers/controller_ModTem');

router.get('/get_template', MTem.get_ticket);
router.get('/get_preg/:id', MTem.get_preguntas);
router.post('/camb_cat/:id', MTem.post_mod);
// router.post('/n_preg/:id', MTem.post_npreg);
// router.post('/de_preg/:id', MTem.delete_preguntas);
router.get('/', MTem.root);

module.exports = router; 