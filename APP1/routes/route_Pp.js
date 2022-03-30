const express = require('express');
const router = express.Router();

const PPController = require('../controllers/controller_pp');

router.use('/', PPController.principal);

module.exports = router;