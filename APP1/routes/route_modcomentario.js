const express = require('express');
const router = express.Router();

const comentariocont = require('../controllers/controller_modcomentario');
const isAuth = require('../util/is-auth.js');

router.get('/get_comentario/:id', isAuth, comentariocont.get_comentario);
router.post('/post_comentario/:id', comentariocont.post_comentario);

router.get('/', isAuth, comentariocont.root);


// router
// .route('/get_comentario/:id')
// .get(comentariocont.get_comentario)
// .post(comentariocont.post_comentario)
module.exports = router;