const express = require('express');
const router = express.Router();

const AP = require('../controllers/controller_asigPrio');

router.get('/get_usti', AP.get_pant);
// router.get('/get_preg/', AP.get_preguntas);
// router.post('/camb_cat/', AP.post_mod);
// // router.post('/n_preg/:id', AP.post_npreg);
// // router.post('/de_preg/:id', AP.delete_preguntas);
router.get('/', AP.root);

module.exports = router; 