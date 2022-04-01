const Ticket = require("../models/tickets");

exports.get_activos=(request, response, next)=>{
let tipo=1;
tickets=Ticket.fetchticketsactivos()
.then(([rows, fieldData]) => {
    console.log(rows);
    response.render('Consulta', {
        tickets: rows,
        username: request.session.username ? request.session.username : '',
    }); 
})
.catch(err => {
    console.log(err);
});
}

exports.post_activos=(request, response, next)=>{

}

exports.get_archivo=(request, response, next)=>{
let tipo=2;
tickets=fetchticketsarchivados()
.then(([rows, fieldData]) => {
    console.log(rows);
    response.render('Consulta', {
        tickets: rows,
        username: request.session.username ? request.session.username : '',
    }); 
})
.catch(err => {
    console.log(err);
});
}

exports.post_archivo=(request, response, next)=>{

}

exports.get_tickusuario=(request, response, next)=>{
let tipo=3;
tickets=fetchticketsusuario(request.session.username)
.then(([rows, fieldData]) => {
    console.log(rows);
    response.render('Consulta', {
        tickets: rows,
        username: request.session.username ? request.session.username : '',
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

exports.post_tickusuario=(request, response, next)=>{

}
exports.root = (request, response, next) => {
    response.redirect('/home'); 
};