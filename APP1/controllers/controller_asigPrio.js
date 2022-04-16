const Usuarios = require('../models/usuario');
const Tickets = require('../models/tickets');



exports.get_pant = (req, res, next) => {
    console.log('Entrando a Buscar Usuario');
    Usuarios.fetchEm()
        .then(([rows, fielData]) => {
            Usuarios.fetchAd()
                .then(([rows2, fiellData]) => {
                    Tickets.fetchticketsactivos()
                        .then(([rows3, fiellData]) => {
                            res.render('Asignar_Prioridad', {
                                usuario: rows,
                                usuario: rows2,
                                tickets: rows3,
        
                            });
                        })
                })
                .catch(error => { console.log(error) });
        })
        .catch(error => { console.log(error) });
};

exports.buscar = (req, res, next) => {
    Usuarios.fetch(req.params.valor)
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
    res.redirect('/asignar_prioridad');
};