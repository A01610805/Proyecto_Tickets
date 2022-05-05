const Ticket = require('../models/tickets');
const Asignado = require('../models/resuelve_ticket');

exports.get_ticket = (request, response, next) => {;
    // console.log(request.params.id);
    // console.log('Entrando al render de asignar estado');
    Ticket.fetchticket_estado(request.params.id)
        .then(([rows, fieldData]) => {
            // console.log(rows);
            response.render('AEstado', {
                id: request.params.id ? request.params.id : 1,
                username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
                rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                ticket: rows[0],
            });
        })
        .catch(error => { console.log(error) });
};

exports.post_estado = async (request, response, next) => {
    // console.log('Entrando a la asignación de estado');   
    const ea = await Ticket.estado_actual(request.params.id); 
    let en = request.body.estado_nuevo;
    // console.log(ea[0][0].ID_estado,en,'Iniciando update');
    // console.log(request.cookies.id_usuario, request.params.id);
    if (ea[0][0].ID_estado == 1){
        if (en == 2 || en == 3 || en == 4){
            Ticket.update_estado(request.body.estado_nuevo, request.params.id);
            Asignado.encargado_inicial_234(request.cookies.id_usuario, request.params.id);
        }
        else if (en == 5 || en == 6){
            Ticket.update_estado(request.body.estado_nuevo, request.params.id);
            Asignado.encargado_inicial_56(request.cookies.id_usuario, request.params.id);
        }
    } else {
        if (en == 1){
            Ticket.update_estado(request.body.estado_nuevo, request.params.id);
            Asignado.estado_1(request.params.id);
        }
        else if (en == 2 || en == 3 || en == 4){
            Ticket.update_estado(request.body.estado_nuevo, request.params.id);
        }
        else if (en == 5 || en == 6){
            Ticket.update_estado(request.body.estado_nuevo, request.params.id);
            Asignado.estado_56(request.params.id);
        }
    }
    // console.log('Terminando update');
    response.redirect('/home')
};

exports.root = (req, res, next) => {
    // console.log('Ruta por defecto de buscar usuario');
    res.redirect('/asignar_estado');
}