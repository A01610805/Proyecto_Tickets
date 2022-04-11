const Categoria = require('../models/categorias');
const Pregunta = require('../models/preguntas');

exports.get_gentem = (request, response, next) => {
        console.log('Aqui inicia generar template');
            response.render('Generar_template');  
};
exports.post_gentem = (request, response, next) =>{

}



exports.root = (request, response, next) => {
    response.redirect('/generar_template'); 
};