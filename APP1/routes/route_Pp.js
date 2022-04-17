const express = require('express');
const router = express.Router();

const PPController = require('../controllers/controller_pp');

router.get('/', PPController.get_principal);
router.post('/', PPController.post_principal);
router.post('/', PPController.post_comentario);
// router.get('/', PPController.get_mistickets);


module.exports = router;