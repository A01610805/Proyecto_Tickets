const Categoria = require('../models/categorias');
const Pregunta = require('../models/preguntas');
const Respuesta = require('../models/respuestas');

exports.get_ticket = (request, response, next) => {
    Categoria.fetchAll()
        .then(([rows, fielData]) => {
            response.render('ModificarTemplate', {
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
            console.log('Entrando a categoria');
            Pregunta.fetchPreguntas(request.params.id)
                .then(([rows2, fielData]) => {
                    console.log('Entrando a pregunta y render');
                    response.render('ModTem', {
                        Tiname: request.session.usuario ? request.session.usuario : '',
                        categorias: rows,
                        preguntas: rows2,
                        id: request.params.id ? request.params.id : 1,
                    }); 
                }) 
                .catch(error => {console.log(error)}); 
        }) 
    .catch(error => {console.log(error)});
};
exports.post_mod = (request, res, next) => {
    const categoria = new Categoria( request.body.titulo, request.body.tiempo, request.params.id);
    console.log('Esto es antes de categoria.update()');
    console.log(categoria);
    categoria.update()
    const pregunta = new Pregunta(request.body.texto_pregunta, request.params.id)
    pregunta.update()
};
// exports.post_npreg =(request, res, next) => { 
//     const pregunta = new Pregunta(request.body.texto_preguntanew, request.params.id)
//     pregunta.addpreg()
// }

// exports.delete_preguntas = (req, res, next) => {
//     console.log(request.params.id);
//     //Categoria.fetchOne(request.params.id)
//     Pregunta.delete_preguntas(request.param.id)
// };

exports.root = (request, response, next) => {
    response.redirect('/modificar_template'); 
};
