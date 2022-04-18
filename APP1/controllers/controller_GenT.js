const Categoria = require('../models/categorias');
const Pregunta = require('../models/preguntas');
const Gen_Tickets = require('../models/gen_ticket');
const Respuesta = require('../models/respuestas');
const { idpreg } = require('../models/preguntas');

exports.get_genticket = (request, response, next) => {
    Categoria.fetchAll()
        .then(([rows, fielData]) => {
            response.render('GenerarTicket', {
                Tiname: request.session.usuario ? request.session.usuario : '',
                categorias: rows,
                rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
            }); 
        }) 
    .catch(error => {console.log(error)});
};

exports.get_preguntas = (request, response, next) => {
    console.log(request.params.id);
    //Categoria.fetchOne(request.params.id)
    Categoria.fetchAll()    
        .then(([rows, fielData]) => {
            console.log('Entrando a categoria');
            Pregunta.fetchPreguntas(request.params.id)
                .then(([rows2, fielData]) => {
                    console.log('Entrando a pregunta y render');
                    response.render('TiGen', {
                        Tiname: request.session.usuario ? request.session.usuario : '',
                        rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                        categorias: rows,
                        preguntas: rows2,
                        id: request.params.id ? request.params.id : 1
                    }); 
                }) 
                .catch(error => {console.log(error)}); 
        }) 
    .catch(error => {console.log(error)});
};

exports.post_genticket = async(request,response, next) => {
    console.log('POST /ticket/nuevo');
    console.log(request.body);
    const ticket = new Gen_Tickets(request.params.id, request.body.titulo, request.body.descripcion);
    console.log('Esto es antes de ticket.save()');
    console.log(ticket);
<<<<<<< HEAD
    ticket.save();
    ticket.registrarFecha(request.cookies.correo_usuario);
    console.log('Esto es después de ticket.save()');

    
    const ArrayResp = request.body.respuesta;   // Aqui tenemos las respuestas
    

    const ArrayofArrayIDs = await idpreg(request.params.id);
    console.log(ArrayofArrayIDs);
    ArrayIDs = ArrayofArrayIDs[0];
    console.log(ArrayIDs);
    console.log(ArrayIDs[0].ID_pregunta);

    if (Array.isArray(ArrayResp)){
        for (let i = 0; i<ArrayResp.length; i++){
            Respuesta.save(ArrayIDs[i].ID_pregunta, ArrayResp[i]);
        }
    }
    else {
        Respuesta.save(ArrayIDs[0].ID_pregunta, ArrayResp);
    }
 
    response.redirect('/home')

=======
    //ticket.save();
    console.log('Esto es después de ticket.save()');

    console.log(ticket);
    idticket = await ticket.obtenerid();
    console.log(idticket[0]);

    pregunta = new Pregunta;
    idpregunta = await pregunta.idpreg(request.params.id);
    console.log(idpregunta[0]);
    
    npreguntas = await pregunta.countpreg(request.params.id);
    console.log(npreguntas[0]);

    // var n = 0;
    // for(let i in idpregunta ){
    //     console.log("entramos al for");
    //     console.log(idpregunta[n]);
    //     n = n + 1;
    // }

    for(var i = 0; i <= npreguntas[0]; i++){
        console.log('Entrando al for de respuetas');
         var respuesta = new Respuesta(idpregunta[n], idticket, request.body.texto_respuesta[n]);
         respuesta.save(idpregunta[n],idticket[n]);
         console.log('Pregunta registrada.');
    }
    response.redirect('/home')
            // .then(() => {
            //     response.redirect('/home');
            // })
            // .catch(err => console.log(err));
    // var i = -1;
    // for(let texto_respuesta of request.body.texto_respuesta){
    //     i=i+1;
    //     var pregunta = new Pregunta(request.params.id, request.body.texto_respuesta[i])
    //     console.log(request.body.texto_respuesta[i]);
    //     pregunta.save();
    // }
>>>>>>> 307171d521586ba6900f349b0ef4600271bab660
};

exports.root = (request, response, next) => {
    response.redirect('/generar_ticket'); 
};
