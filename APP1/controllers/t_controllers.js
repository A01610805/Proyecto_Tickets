//const res = require("express/lib/response");
const Ticket = require("../models/tickets");

exports.get_activos=(request, response, next)=>{
let tipo=1;
console.log(request.session.usuario);
tickets=Ticket.fetchticketsactivos()
    .then(([rows, fieldData]) => {
        //console.log(rows);
        response.render('Consulta', {
            tickets: rows,
            username: request.session.username ? request.session.username : '',
            rol: request.cookies.rolusuario ? request.cookies.rolusuario : 1,
            tipo:tipo,
        }); 
    })
    .catch(err => {
        console.log(err);
    });
}

exports.post_activos=(request, response, next)=>{
    console.log(request.body);
    Ticket.borrarticketpropio(request.body.idticket);
    response.redirect('/home');  
}

 // A partir de aqui inicia la implementación en ajax
exports.buscar_activos = (request, response, next) => {
    tickets=Ticket.fetchticketsactivos_creador(request.params.valor)
    .then(([rows, fieldData]) => {
        console.log(rows);
        response.status(200).json(rows);
        // response.render('Consulta', {
        //     tickets: rows,
        //     username: request.session.username ? request.session.username : '',
        //     rol: request.cookies.rolusuario ? request.cookies.rolusuario : 1,
        //     tipo:tipo,
        //     async:true,
        // }); 
    })
    .catch(err => {
        console.log(err);
    });
}

exports.get_archivo=(request, response, next)=>{
let tipo=2;
tickets=Ticket.fetchticketsarchivados()
    .then(([rows, fieldData]) => {
        console.log(rows);
        response.render('Consulta', {
            tickets: rows,
            username: request.session.username ? request.session.username : '',
            rol: request.cookies.rolusuario ? request.cookies.rolusuario : 1,
            tipo:tipo,
        }); 
    })
    .catch(err => {
        console.log(err);
    });
}

exports.post_archivo=(request, response, next)=>{
    Ticket.borrarticketpropio(request.body.idticket);
    response.redirect('/home'); 
}

exports.get_ticketspropios=(request, response, next)=>{
    let tipo=3;
    tickets=Ticket.fetchticketsusuario(request.cookies.nombre_usuario)
    .then(([rows, fieldData]) => {
        console.log(rows);
        response.render('Consulta', {
            tickets: rows,
            username: request.session.nombre ? request.session.nombre : '',
            rol: request.cookies.rolusuario ? request.cookies.rolusuario : 1,
            tipo:tipo,
        }); 
    })
    .catch(err => {
        console.log(err);
    }); 
    //response.render('Consulta',{
        //ticket:ticket,
      //  tipo:tipo,
    //});
    }

exports.borrarpropios=(request, response, next)=>{
    Ticket.borrarticketpropio(request.body.idticket);
    response.redirect('/home'); 
}

exports.root = (request, response, next) => {
    response.redirect('/home'); 
};
