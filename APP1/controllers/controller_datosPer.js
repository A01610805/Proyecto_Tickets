const Usuario = require('../models/usuario');

exports.get_cpass = (request, response, next) => {
    console.log(request.cookies.id_usuario);
    console.log('Entrando al render de cambio de contraseña');
    Usuario.getusuariobyid(request.cookies.id_usuario)
        .then(([rows, fieldData]) => {
            console.log(rows[0]);
            console.log(rows[0].password);
            response.render('CPass', {
                id: request.params.id ? request.params.id : 1,
                username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
                rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                user: rows[0],
                pass_actual: rows[0].password,
            });
        })
        .catch(error => { console.log(error) });  
}

exports.post_cpass = (request, response, next) => {
    Usuario.actualizar_password(request.body.password_nueva_1, request.cookies.id_usuario);
    response.redirect('/home'); 
}

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

exports.root = (request, response, next) => {
    res.redirect('/personal');
}
