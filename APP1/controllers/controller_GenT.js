const Categoria = require('../models/categorias');
const Pregunta = require('../models/preguntas');

exports.get_genticket = (request, response, next) => {
    Categoria.fetchAll()
        .then(([rows, fielData]) => {
            response.render('GenerarTicket', {
                Tiname: request.session.usuario ? request.session.usuario : '',
                categorias: rows,
            }); 
        }) 
    .catch(error => {console.log(error)});
};

exports.get_preguntas = (request, response, next) => {
    console.log(request.params.id);
    //Categoria.fetchOne(request.params.id)
    Categoria.fetchAll()    
        .then(([rows, fielData]) => {
            Pregunta.fetchPreguntas(request.params.id)
                .then(([rows2, fielData]) => {
                    response.render('TiGen', {
                        Tiname: request.session.usuario ? request.session.usuario : '',
                        categorias: rows,
                        preguntas: rows2,
                        id: request.params.id ? request.params.id : 1,
                    }); 
                }) 
                .catch(error => {console.log(error)}); 
        }) 
    .catch(error => {console.log(error)});
}

exports.post_genticket = (request,response, next) => {
    console.log('POST /ticket/nuevo');
    const ticket = 
        new Gen_Tickets(
            request.body.titulo, request.body.descripcion,
            request.body.ID_categoria, request.body.texto_respuesta,
            request.body.ID_pregunta);
    ticket.save()
        .then(() => {
            request.session.info = ticket.nombre + ' fue registrado con éxito';
            response.redirect('/home');
        })
        .catch(err => console.log(err));
};

exports.root = (request, response, next) => {
    response.redirect('/generar_ticket'); 
};
