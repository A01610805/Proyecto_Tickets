const { response } = require('express');
const User = require('../models/model_login');


exports.get_Usuarios = (req, res, next) => {
    response.render('BuscarUsuarios', {
        username: request.session.usuario ? request.session.usuario : '',
    }); 
}

exports.get_Busqueda = (req,res,next) => {
    console.log('Entrando a Buscar Usuario');
    User.fetchAll()
        .then(([rows, fielData])=>{
            response.render('BuscarUsuarios',{
                model_login: rows,
            });
        })
     .catch(error => {console.log(error)});
}