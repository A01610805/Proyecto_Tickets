const express = require('express');
const router = express.Router();

const AP = require('../controllers/controller_asigPrio');

router.get('/get_tic/:id', AP.get_tic);
router.get('/post_prio/:id', AP.post_prioridad);

router.get('/', AP.root);

module.exports = router;  