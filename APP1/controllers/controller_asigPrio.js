const Tickets = require('../models/tickets');
const Prioridad = require('../models/prioridad');

exports.get_tic = (request, response, next) => {
    // console.log(request.params.id);
    // console.log('Entrando a Asignar Prioridad');
    Tickets.fetchticket_prioridad(request.params.id)
        .then(([rows, fieldData]) => {
            // console.log(rows[0]);
            response.render('APrioridad', {
                id: request.params.id ? request.params.id : 1,
                username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
                rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                ticket: rows[0],
            });
        })
        .catch(error => { console.log(error) });
};

exports.post_prio = (request, response, next) => {
    console.log(request.body);
    console.log(request.params.id);
    //const prioridad = new Prioridad(request.body.prioridad, request.params.id);
    Prioridad.update(request.body.prioridad, request.params.id);
    //console.log(request.body);
    //prioridad.updatenuevo();
    response.redirect('/home');
};


exports.root = (req, res, next) => {
    res.redirect('/asignar_prioridad');
}