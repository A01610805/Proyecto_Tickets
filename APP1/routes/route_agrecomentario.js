const express = require('express');
const router = express.Router();

const comentarioagre = require('../controllers/controller_agrecomentario');
const isAuth = require('../util/is-auth.js');

router.get('/get_agregarcomentario/:id', isAuth, comentarioagre.get_agregarcomentario);
router.post('/post_agregarcomentario/:id', comentarioagre.post_agregarcomentario);

router.get('/', isAuth, comentarioagre.root);


// router
// .route('/get_comentario/:id')
// .get(comentariocont.get_comentario)
// .post(comentariocont.post_comentario)
module.exports = router;