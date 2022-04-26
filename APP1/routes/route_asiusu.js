const express = require('express');
const router = express.Router();

const asiusu = require('../controllers/controller_asiusu');

router.get('/get_usuario/:id', asiusu.get_usuario);
router.post('/post_asiusu/:id', asiusu.post_asiusu);
router.get('/', asiusu.root);

module.exports = router;  