const Usuario = require('../models/tickets');

exports.get_ticket = (request, response, next) => {;
    console.log(request.params.id);
    console.log('Entrando al render de asignar estado');
    Usuario.fetchticket_estado(request.params.id)
        .then(([rows, fieldData]) => {
            console.log(rows);
            response.render('AEstado', {
                id: request.params.id ? request.params.id : 1,
                username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
                rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                ticket: rows[0],
            });
        })
        .catch(error => { console.log(error) });
};

exports.post_estado = (request, response, next) => {
    console.log('Entrando a la asignación de estado');
    const asignacion_rol = new Usuario(request.body.estado_nuevo, request.params.id);
    console.log(asignacion_rol);
    console.log('Iniciando update');
    asignacion_rol.update_rol()
    console.log('Terminando update');
    response.redirect('/buscar_usuario/busqueda')
};

exports.root = (req, res, next) => {
    // console.log('Ruta por defecto de buscar usuario');
    res.redirect('/asignar_rol');
}