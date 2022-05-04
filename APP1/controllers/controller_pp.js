const Categoria = require('../models/categorias');
const Pregunta = require('../models/preguntas');
const Gen_Tickets = require('../models/gen_ticket');
const Respuesta = require('../models/respuestas');
const Tickets = require('../models/tickets');

exports.get_principal = (request, response, next) => {
    // console.log('Pantalla principal');
    Tickets.obtenercomentarios()
        .then(([rows, fielData]) => {
            Tickets.fetchticketsnuevos()
                .then(([rows2, fielData]) => {
                    Tickets.fetchrespuestas()
                        .then(([rows3, fieldData]) => {
                            Tickets.fetchticketsusuario(request.cookies.correo_usuario)
                                .then(([rows4, fieldData]) => {
                                    Tickets.fetchticketsencargado(request.cookies.correo_usuario)
                                        .then(([rows5, fieldData]) => {
                                            Tickets.fetchticketsnuevosu(request.cookies.id_usuario)
                                                .then(([rows6, fieldData]) => {
                                            // console.log(request.cookies.nombre_usuario);
                                            let numrol = request.cookies.rolusuario;
                                            if (numrol == 3) {
                                                response.render('Primer_pantalla3', {
                                                    username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
                                                    comentario: rows,
                                                    ticketss: rows2,
                                                    ticketsss: rows6,
                                                    respuestas: rows3,
                                                    ticketsusuario: rows4,
                                                    ticketobtenido: rows5,
                                                    rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                                                });
                                            } else {
                                                response.render('Primer_pantalla', {
                                                    username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
                                                    comentario: rows,
                                                    ticketss: rows2,
                                                    ticketsss: rows6,
                                                    respuestas: rows3,
                                                    ticketsusuario: rows4,
                                                    ticketobtenido: rows5,
                                                    rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                                                });
                                            }
                                        })
                                })
                            })
                        })
                })
        })
};
exports.post_principal = (request, response, next) => {
    // console.log('Pantalla principal');

    Tickets.cancelar_ticket_1(request.body.idticket);
    Tickets.cancelar_ticket_2(request.body.idticket);

    Tickets.borrarticketnuevo1(request.body.idticket);
    Tickets.borrarticketnuevo2(request.cookies.id_usuario,request.body.idticket);

    response.redirect('/home');
};
