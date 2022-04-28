const Usuario = require('../models/usuario');

exports.get_usuario = (request, response, next) => {
    console.log(request.params.id);
    console.log('Entrando al render de asignar ticket a usuario');
    Usuario.fetchAll()
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
    console.log(request.body.asignacion)
    
    response.redirect('/home')    
}
exports.root = (request, response, next) => {
res.redirect('/asignar');}