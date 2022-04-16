
const Tickets = require('../models/tickets');



exports.get_tic = (request, response, next) => {
    console.log('Entrando a Asignar Prioridad');
    Tickets.fetchticketSeleccionado(request.params.id)
        .then(([rows, fieldData]) => {
            Tickets.fetchresTiseleccionado(request.params.id)
                .then(([rows2, fieldData]) => {
                    response.render('Asignar_Prioridad', {
                        username: request.session.name ? request.session.name : '',
                        respuestas: rows,
                        tickets: rows2,
                    });
                })
        })
}
exports.post_prioridad = (req, res, next) => {


};

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
}