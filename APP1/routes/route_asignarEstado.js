const express = require('express');
const router = express.Router();

const AE = require('../controllers/controller_asigEstado');

router.get('/get_ticket/:id', AE.get_ticket);
router.post('/post_estado/:id', AE.post_estado);

router.get('/', AE.root);

module.exports = router;  
