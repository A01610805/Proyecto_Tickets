//const res = require("express/lib/response");
const Ticket = require("../models/tickets");

//Inicio de /buscar_tickets/activos
exports.get_activos= async (request, response, next)=>{
let tipo=1;
console.log(request.session.usuario);

const total = await Ticket.getTotal_activos();
console.log("En total hay: " + total);
const start = request.params.start ? request.params.start : 0

tickets=Ticket.fetchticketsactivos_pag(start)
    .then(([rows, fieldData]) => {
        //console.log(rows);
        response.render('Consulta', {
            tickets: rows,
            username: request.session.username ? request.session.username : '',
            rol: request.cookies.rolusuario ? request.cookies.rolusuario : 1,
            tipo:tipo,
            total_tickets: total,
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

// A partir de aqui inicia la implementación en ajax de buscar_activos
exports.buscar_activos = (request, response, next) => {
    
    tickets=Ticket.fetchticketsactivos_filtros(request.params.valor)
    .then(([rows, fieldData]) => {
        console.log(request.params.valor);
        console.log(rows);
        response.status(200).json(rows);
    })
    .catch(err => {
        console.log(err);
    });
}
//Final de /buscar_tickets/activos


//Inicio de /buscar_tickets/archivo
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

// A partir de aqui inicia la implementación en ajax de buscar_archivo
 exports.buscar_archivo = (request, response, next) => {
    tickets=Ticket.fetchticketsarchivados_filtros(request.params.valor)
    .then(([rows, fieldData]) => {
        console.log(rows);
        response.status(200).json(rows);
    })
    .catch(err => {
        console.log(err);
    });
}
//Final de /buscar_tickets/archivo


//Inicio de /buscar_tickets/propio
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
}
// A partir de aqui inicia la implementación en ajax de buscar_archivo
exports.buscar_propios = (request, response, next) => {
    tickets=Ticket.fetchticketsusuario_filtro(request.params.valor)
    .then(([rows, fieldData]) => {
        console.log(request.params.valor);
        console.log(rows);
        response.status(200).json(rows);
    })
    .catch(err => {
        console.log(err);
    });
}
//Final de /buscar_tickets/propio

exports.borrarpropios=(request, response, next)=>{
    Ticket.borrarticketpropio(request.body.idticket);
    response.redirect('/home'); 
}

exports.root = (request, response, next) => {
    response.redirect('/home'); 
};
