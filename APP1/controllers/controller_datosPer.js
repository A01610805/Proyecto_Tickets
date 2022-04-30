const Usuario = require('../models/usuario');

exports.get_usuario = (request, response, next) => {
    console.log(request.cookies.id_usuario);
    console.log('Entrando al render de datos personales');
    Usuario.getusuariobyid(request.cookies.id_usuario)
        .then(([rows, fieldData]) => {
            console.log(rows[0]);
            response.render('Personal', {
                id: request.params.id ? request.params.id : 1,
                username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
                rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                user: rows[0],
            });
        })
        .catch(error => { console.log(error) });  
}

/*exports.post_pass = (request, response, next) => {
    Tickets.asignarusuario(request.body.asignacion, request.params.id);
    response.redirect('/home'); 
}*/

exports.root = (request, response, next) => {
    res.redirect('/personal');
}
