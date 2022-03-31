const Categoria = require('../models/categorias');
const Pregunta = require('../models/preguntas');
const Gen_Tickets = require('../models/gen_ticket');
const Respuesta = require('../models/respuestas');

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
    console.log(request.body);

    const ticket = 
        new Gen_Tickets(
            request.params.id,request.body.titulo, 
            request.body.descripcion);
        console.log('Esto es antes de ticket.save()');
        ticket.save();
        console.log('Esto es después de ticket.save()');
        idticket=ticket.obtenerid();
        idpregunta=Pregunta.ID_pregunta(request.params.id);
        console.log(idpregunta);
        var i = -1;
        for(let texto_respuesta of request.body.texto_respuesta){
            i=i+1;
            var respuesta = new Respuesta(idpregunta[i], idticket, request.body.texto_respuesta[i])
            respuesta.save();
        }

        response.redirect('/home');
            //.then(() => {
              //  response.redirect('/home');
            //})
            //.catch(err => console.log(err));
            
    // var i = -1;
    // for(let texto_respuesta of request.body.texto_respuesta){
    //     i=i+1;
    //     var pregunta = new Pregunta(request.params.id, request.body.texto_respuesta[i])
    //     console.log(request.body.texto_respuesta[i]);
    //     pregunta.save();
    // }
};

exports.root = (request, response, next) => {
    response.redirect('/generar_ticket'); 
};
