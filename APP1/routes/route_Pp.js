const express = require('express');
const router = express.Router();

const PPController = require('../controllers/controller_pp');

router.get('/', PPController.get_principal);

module.exports = router;