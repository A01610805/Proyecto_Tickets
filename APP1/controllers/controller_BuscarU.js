const { response } = require('express');
const User = require('../models/model_login');
const Rol = require('../models/rol');

exports.get_Busqueda = (req,res,next) => {
    console.log('Entrando a Buscar Usuario');
    User.fetchAll()
        .then(([rows, fielData])=>{
            Rol.findOne()
                .then(([rows2, fielData]) => {
                    response.render('BuscarUsuarios',{
                        model_login: rows,
                        rol: rows2,
                    });
                })
            .catch(error => {console.log(error)});
        })
     .catch(error => {console.log(error)});
}

exports.root = (req,res,next) => {
    console.log('Ruta por defecto de buscar usuario');
    response.redirect('/home'); 
}