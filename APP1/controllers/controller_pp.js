const Categoria = require('../models/categorias');
const Pregunta = require('../models/preguntas');
const Gen_Tickets = require('../models/gen_ticket');
const Respuesta = require('../models/respuestas');
const Tickets = require('../models/tickets');

exports.get_principal = (request, response, next) => {
    console.log('Pantalla principal');
    Tickets.fetchticketsactivos()
        .then(([rows, fielData]) => {
            response.render('Primer_pantalla', {
                username: request.session.name ? request.session.name : '',
                ticketss: rows
            });

        })
};
exports.post_principal = (request, response, next) => {
    console.log('Pantalla principal');
    Tickets.borrarticket(request.body.idticket);
    response.redirect('/home');
};

// exports.get_mistickets = (request, response, next) => {
//     console.log('Pantalla principal');
//     Tickets.fetchmistickets()
//         .then(([rows, fielData]) => {
//             response.render('Primer_pantalla', {
//                 username: request.session.name ? request.session.name : '',
//                 ticketss: rows
//             });

//         })
// };

// exports.get_principal1 = (request, response, next) => {
//     console.log('Pantalla principal');
//     Tickets.fetchticketsactivos()
//         .then(([rows, fielData]) => {
//             response.render('Primer_pantalla', {
//                 username: request.session.name ? request.session.name : '',
//                 ticketsss: rows
//             });

//         })
//         .catch(error => { console.log(error) });
// };
// exports.get_genticket = (request, response, next) => {
//     Categoria.fetchAll()
//         .then(([rows, fielData]) => {
//             response.render('GenerarTicket', {
//                 Tiname: request.session.usuario ? request.session.usuario : '',
//                 categrias: rows,
//             });
//         })
//         .catch(error => { console.log(error) });
// };