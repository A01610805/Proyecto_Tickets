const path = require('path');
const user = require('../models/model_login');
const bcrypt = require('bcryptjs');

exports.get_login = (request, response, next) => {
    response.render('Log_in', {
        username: request.session.usuario ? request.session.usuario : '',
    }); 
};

exports.login = (request, response, next) => {
    console.log('Entrando a fetchOne');
    console.log(request.body);
    user.findOne(request.body.nombre)
        .then(([rows, fielData])=>{
            
        //Si no existe el usuario, redirige a la pantalla de login
        if (rows.length < 1) {
            return response.redirect('/users/login');
        }
        else{
            return response.render('Primer_Pantalla');
        }
        
        const user = new User(rows[0].nombre, rows[0].username, rows[0].password);
        bcrypt.compare(request.body.password, user.password)
            .then(doMatch => {
                if (doMatch) {
                    request.session.isLoggedIn = true;
                    request.session.user = user;
                    request.session.username = user.nombre;
                    return request.session.save(err => {
                        response.redirect('/capybaras');
                    });
                }
                response.redirect('/users/login');
            }).catch(err => {
        
            });
    }).catch((error)=>{
        console.log(error)
    });

};


exports.get_signup = (request, response, next) => {
    response.render('Primer_Pantalla', {
        username: request.session.usuario ? request.session.usuario : '',
        info: ''
    }); 
};

exports.post_signup = (request, response, next) => {
    const user = 
        new User(request.body.nombre, request.body.username, request.body.password);
    user.save()
        .then(()=>{
            response.redirect('Primer pantalla'); 
        }).catch((error)=>{
            console.log(error);
        });
};

exports.logout = (request, response, next) => {
    request.session.destroy(() => {
        response.redirect('Primer pantalla'); //Este código se ejecuta cuando la sesión se elimina.
    });
};

exports.root = (request, response, next) => {
    response.redirect('/users/login'); 
};