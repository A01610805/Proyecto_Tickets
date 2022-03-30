const User = require('../models/ticket');

exports.get_login = (request, response, next) => {
    response.render('GenerarT', {
        username: request.session.usuario ? request.session.usuario : '',
    }); 
};

exports.login = (request, response, next) => {
    console.log('Entrando a fetchOne');
    console.log(request.body);
    User.findOne(request.body.nombre)
        .then(([rows, fielData])=>{
            
        //Si no existe el usuario, redirige a la pantalla de login
        if (rows.length < 1) {
            return response.redirect('/users/login');
        }
        const user = new User(rows[0].ID_rol, rows[0].nombre, rows[0].apellido_paterno, rows[0].apellido_materno, rows[0].correo, rows[0].password);
        console.log(request.body.password);
        console.log(user.password);
        bcrypt.compare(request .body.password, user.password)
            .then(doMatch => {
                if (doMatch) {
                    console.log('Pass coinciden');
                    request.session.isLoggedIn = true;
                    request.session.user = user;
                    request.session.username = user.nombre;
                    return request.session.save(err => {
                        response.redirect('/home');
                    });
                }
                response.redirect('/users/login');
            }).catch(err => {
                response.redirect('/users/login');
            });
    }).catch((error)=>{
        console.log(error)
    });

};

exports.get_signup = (request, response, next) => {
    response.render('signup', {
        username: request.session.usuario ? request.session.usuario : '',
        info: ''
    }); 
};

exports.post_signup = (request, response, next) => {
    console.log(request.body);
    const user = new User(request.body.rol, request.body.nombre, request.body.ApellidoP, request.body.ApellidoM, request.body.Email, request.body.password);
    user.save()
        .then(()=>{
            response.redirect('Primer_pantalla'); 
        }).catch((error)=>{
            console.log(error);
            console.log('Aqui esta el error');
        });
};

exports.logout = (request, response, next) => {
    request.session.destroy(() => {
        response.redirect('Primer_pantalla'); //Este código se ejecuta cuando la sesión se elimina.
    });
};

exports.root = (request, response, next) => {
    response.redirect('/users/login'); 
};