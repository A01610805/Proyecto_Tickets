const info = require('../models/info_gentickets');

exports.get_genticket = (request, response, next) => {
    response.render('GenerarT', {
        Tiname: request.session.usuario ? request.session.usuario : '',
    }); 
};

exports.enviar_ticket = (request, response, next) => {
    console.log('Entrando a fetchOne');
    console.log(request.body);
    Ti.findOne(request.body.nombre)
        .then(([rows, fielData])=>{
            
        //Si no existe el usuario, redirige a la pantalla de login
        if (rows.length < 1) {
            return response.redirect('/Tis/login');
        }
        const Ti = new Ti(rows[0].ID_rol, rows[0].nombre, rows[0].apellido_paterno, rows[0].apellido_materno, rows[0].correo, rows[0].password);
        console.log(request.body.password);
        console.log(Ti.password);
        bcrypt.compare(request .body.password, Ti.password)
            .then(doMatch => {
                if (doMatch) {
                    console.log('Pass coinciden');
                    request.session.isLoggedIn = true;
                    request.session.Ti = Ti;
                    request.session.Tiname = Ti.nombre;
                    return request.session.save(err => {
                        response.redirect('/home');
                    });
                }
                response.redirect('/Tis/login');
            }).catch(err => {
                response.redirect('/Tis/login');
            });
    }).catch((error)=>{
        console.log(error)
    });

};

exports.get_signup = (request, response, next) => {
    response.render('signup', {
        Tiname: request.session.usuario ? request.session.usuario : '',
        info: ''
    }); 
};

exports.root = (request, response, next) => {
    response.redirect('/generar_ticket'); 
};