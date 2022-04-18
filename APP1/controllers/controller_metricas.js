const Metricas = require('../models/metricas');
const Categoria = require('../models/categorias');

exports.getmetricas = (request, response, next) => {
    console.log("estamos dentro!");

    // Gráfica #1 (tiempos por categoría)
    Metricas.tiemposCat() // Esto no funciona; lo dejo como ejemplo
        .then(([rows,fielData]) => {
            console.log("Entrando a la promesa tiemposCat");
            response.render('metricas', {
                tiempos: rows,
            });  
        })
        .catch(error => {console.log(error)});
    


    //response.render('metricas');
};

