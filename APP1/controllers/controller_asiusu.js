const Usuario = require('../models/usuario');
const Tickets = require('../models/tickets');

exports.get_usuario = (request, response, next) => {
    console.log(request.params.id);
    console.log('Entrando al render de asignar ticket a usuario');
    Usuario.fetchAllSoporte()
        .then(([rows, fieldData]) => {
            console.log(rows);
            response.render('asiusu', {
                id: request.params.id ? request.params.id : 1,
                username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
                rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                users: rows,
            });
        })
        .catch(error => { console.log(error) });  
}
exports.post_asiusu = (request, response, next) => {
    Tickets.asignarusuario(request.body.asignacion, request.params.id);
    Tickets.actualizarestado(request.params.id);
    response.redirect('/home')    
}
exports.root = (request, response, next) => {
res.redirect('/asignar');}