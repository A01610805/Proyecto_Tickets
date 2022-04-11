//const res = require("express/lib/response");
const Ticket = require("../models/tickets");

//Inicio de /buscar_tickets/activos
exports.get_activos= async(request, response, next)=>{
    let tipo=1;
    console.log(request.session.usuario);

    const total = await Ticket.getTotal_activos();
    console.log("En total hay: " + total);
    const start1 = request.params.start1 ? request.params.start1 : 0
    console.log(start1);
    tickets=Ticket.fetchticketsactivos_pag(start1)
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

exports.post_activos = (request, response, next) => {
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
exports.get_archivo=async(request, response, next)=>{
let tipo=2;

const total = await Ticket.getTotal_archivados();
console.log("En total hay: " + total);
const start2 = request.params.start2 ? request.params.start2 : 0
console.log(start2);

tickets=Ticket.fetchticketsarchivados_pag(start2)
    .then(([rows, fieldData]) => {
        console.log(rows);
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

exports.post_archivo = (request, response, next) => {
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
exports.get_ticketspropios=async(request, response, next)=>{
    let tipo=3;

    const total = await Ticket.getTotal_propios(request.cookies.correo_usuario);
    console.log(request.cookies.correo_usuario);
    console.log("En total hay: " + total);
    const start3 = request.params.start3 ? request.params.start3 : 0

    tickets=Ticket.fetchticketspropios_pag(request.cookies.correo_usuario,start3)
    .then(([rows, fieldData]) => {
        console.log(rows);
        response.render('Consulta', {
            tickets: rows,
            username: request.session.nombre ? request.session.nombre : '',
            rol: request.cookies.rolusuario ? request.cookies.rolusuario : 1,
            tipo:tipo,
            total_tickets: total,
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

exports.post_propios=(request, response, next)=>{
    Ticket.borrarticketpropio(request.body.idticket);
    response.redirect('/home'); 
}

//Final de /buscar_tickets/propio

exports.borrarpropios=(request, response, next)=>{
    Ticket.borrarticketpropio(request.body.idticket);
    response.redirect('/home');
}

exports.root = (request, response, next) => {
    response.redirect('/home'); 
};
