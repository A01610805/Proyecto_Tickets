const Busqueda = require('../models/usuario');
const Rol = require('../models/rol');

exports.get_busqueda = (req, res, next) => {
    console.log('Entrando a Buscar Usuario');
    Busqueda.fetchAll()
        .then(([rows, fielData]) => {
            Rol.findOne()
                .then(([rows2, fielData]) => {
                    res.render('BuscarUsuarios', {
                        model_login: rows,
                        rol: rows2,
                    });
                })
                .catch(error => { console.log(error) });
        })
        .catch(error => { console.log(error) });
};

exports.root = (req, res, next) => {
    console.log('Ruta por defecto de buscar usuario');
    res.redirect('/home');
};