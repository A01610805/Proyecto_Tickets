const express = require('express');
const router = express.Router();

const metricas = require('../controllers/controller_metricas');
const isAuth = require('../util/is-auth.js');
const {authPage} = require('../util/rbac.js');

router.get('/', isAuth, authPage(['1','2']), metricas.getmetricas);

module.exports = router;