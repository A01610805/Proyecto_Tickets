const Busqueda = require('../models/usuario');
const BusquedaR = require('../models/rol');

exports.get_busqueda = (request, response, next) => {
    console.log('Entrando a Buscar Usuario');
    Busqueda.fetchAll()
        .then(([rows, fielData]) => {
            console.log( request.cookies.rolusuario);
            response.render('BuscarUsuarios', {
                usuario: rows,
                rol: request.cookies.rolusuario ? request.cookies.rolusuario: 3, 
            });
        })
        .catch(error => { console.log(error) });
}

exports.buscar = (request, response, next) => {
    Busqueda.fetch(request.params.valor)
        .then(([rows, fieldData]) => {
            console.log(rows);
            response.status(200).json(rows);
        })
        .catch(error => { console.log(error) });

}

// exports.buscarR = (req,res,next) =>{
//     BusquedaR.fetchAll(req.params.valor)
//         .then(([rows, fieldData]) => {
//             console.log(rows);
//             res.status(200).json(rows);
//         })
//         .catch(error => {console.log(error)});  

// }

exports.root = (req, res, next) => {
    console.log('Ruta por defecto de buscar usuario');
    res.redirect('/home');
};