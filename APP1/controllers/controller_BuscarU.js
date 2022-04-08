const Busqueda = require('../models/usuario');
const BusquedaR = require('../models/rol');


exports.get_busqueda = (req, res, next) => {
    console.log('Entrando a Buscar Usuario');
    Busqueda.fetchAll()
        .then(([rows, fielData]) => {
            res.render('BuscarUsuarios', {
                usuario: rows,
            });
        })
        .catch(error => { console.log(error) });
}

exports.buscar = (req, res, next) => {
    Busqueda.fetch(req.params.valor)
        .then(([rows, fieldData]) => {
            console.log(rows);
            res.status(200).json(rows);
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