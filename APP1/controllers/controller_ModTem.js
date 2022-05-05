const Categoria = require('../models/categorias');
const Pregunta = require('../models/preguntas');
const Preguntan = require('../models/news_preguntas');

exports.get_ticket = (request, response, next) => {
    Categoria.fetchAll()
        .then(([rows, fielData]) => {
            console.log( request.cookies.rolusuario);
            response.render('ModificarTemplate', {
                Tiname: request.session.usuario ? request.session.usuario : '',
                categorias: rows,
                rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
            }); 
        }) 
    .catch(error => {console.log(error)});
};
exports.get_preguntas = (request, response, next) => {
    // console.log(request.params.id);
    //Categoria.fetchOne(request.params.id)
    Categoria.fetchAll()    
        .then(([rows, fielData]) => {
            // console.log('Entrando a categoria');
            Pregunta.fetchPreguntas(request.params.id)
                .then(([rows2, fielData]) => {
                    // console.log('Entrando a pregunta y render');
                    response.render('ModTem', {
                        Tiname: request.session.usuario ? request.session.usuario : '',
                        categorias: rows,
                        preguntas: rows2,
                        id: request.params.id ? request.params.id : 1,
                        nombre: request.params.nombre ? request.params.nombre : 1,
                        tiempo: request.params.tiempo ? request.params.tiempo : 1,
                        rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                        username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : '',
                    }); 
                }) 
                .catch(error => {console.log(error)}); 
        }) 
    .catch(error => {console.log(error)});
};
exports.post_mod = (request, response, next) => {
    // console.log('Esto es antes de declarar constructores')
    const categoria = new Categoria( request.body.titulo, request.body.tiempo, request.params.id);
    // console.log('Esto es antes de categoria.update()');
    // console.log(categoria);
    categoria.update()
    // console.log('Esto es antes de pregunta.update()');
    // console.log(request.body); 

    if((Array.isArray(request.body.texto_pregunta) == true) && Array.isArray(request.body.text_preg) == true){ 
        // console.log('Los dos son un arreglo');
        if (request.body.texto_pregunta.length <= request.body.text_preg.length) {
            for (let index = 0; index < request.body.text_preg.length; index++) {
                if ((request.body.texto_pregunta[index] != undefined) && (request.body.text_preg[index] != undefined)) {
                    const pregunta = new Pregunta(request.body.texto_pregunta[index], request.params.id, request.body.ID_preg[index])
                    // console.log(pregunta);
                    pregunta.update()
                    // console.log('Se actualizo una pregunta')
                }
    
                if ((request.body.texto_pregunta[index] == undefined) && (request.body.text_preg[index] != undefined)) {
                    const pregunta = new Pregunta(request.body.text_preg[index], request.params.id, request.body.ID_preg[index])
                    // console.log(pregunta);
                    pregunta.delete(request.body.ID_preg[index])
                    // console.log('Se elimino una pregunta');
                }
                
                
            }
        }

        if (request.body.texto_pregunta.length >= request.body.text_preg.length) {
            for (let index = 0; index < request.body.texto_pregunta.length; index++) {
                if ((request.body.texto_pregunta[index] != undefined) && (request.body.text_preg[index] != undefined)) {
                    const pregunta = new Pregunta(request.body.texto_pregunta[index], request.params.id, request.body.ID_preg[index])
                    // console.log(pregunta);
                    pregunta.update()
                    // console.log('Se actualizo una pregunta')
                }
    
                if ((request.body.texto_pregunta[index] != undefined) && (request.body.text_preg[index] == undefined)) {
                    // console.log('Se agrego una pregunta');
                    const pregunta = new Preguntan(request.body.texto_pregunta[index])
                    // console.log(pregunta);
                    pregunta.save(request.params.id)
                }
                
            }
        }
        
        
    }
    if((Array.isArray(request.body.texto_pregunta) == false) && (Array.isArray(request.body.text_preg) == true) ){
        // console.log('El original es  un arreglo y el nuevo no');
        for (let index = 1; index < request.body.text_preg.length; index++) {
            const pregunta = new Pregunta(request.body.text_preg[index], request.params.id, request.body.ID_preg[index])
            // console.log(pregunta);
            pregunta.delete(request.body.ID_preg[index])
            
        }
        const pregunta = new Pregunta(request.body.texto_pregunta, request.params.id,request.body.ID_pregunta)
        pregunta.update()
    }
    if((Array.isArray(request.body.texto_pregunta) == true) && (Array.isArray(request.body.text_preg) == false) ){
        // console.log('Solo el nuevo es un arrglo');
        for (let index = 0; index < request.body.texto_pregunta.length; index++) {
            // console.log(index);
            if (index == 0) {
                // console.log('IF del 0');
                const pregunta = new Pregunta(request.body.texto_pregunta[index], request.params.id,request.body.ID_pregunta[index])
                // console.log(pregunta);
                pregunta.update()
            }
            if (index != 0){
                // console.log('despues del 0');
                const pregunta = new Preguntan(request.body.texto_pregunta[index])
                // console.log(pregunta);
                pregunta.save(request.params.id)
            }
            
        }
    }

    response.redirect('/modificar_template/get_template')
};
exports.post_delete = (request, response, next) => {
    //console.log('Se va a eliminar una categoria')
    const categoria = new Categoria( request.body.nombre, request.body.tiempo, request.body.id);
    categoria.delete()
    //console.log('Se elimino una categoria');    
    response.redirect('/modificar_template/get_template')
}

exports.root = (request, response, next) => {
    response.redirect('/modificar_template'); 
};
