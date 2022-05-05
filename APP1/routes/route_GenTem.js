const express = require('express');
const router = express.Router();
const cgenticket = require('../controllers/controller_GenTem');
const isAuth = require('../util/is-auth.js');
const {authPage} = require('../util/rbac.js');

router.get('/gen_template', isAuth, authPage(['1']), cgenticket.get_gentem);
router.post('/enviar_template', cgenticket.post_gentem);
router.get('/', authPage(['1']), isAuth ,cgenticket.root); 

module.exports = router;
