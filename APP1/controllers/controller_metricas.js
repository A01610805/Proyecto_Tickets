const Metricas = require('../models/metricas');
const Categoria = require('../models/categorias');

exports.getmetricas = (request, response, next) => {
    console.log("estamos dentro!");

    // Gráfica #1 (tiempos por categoría)
    Metricas.tiemposCat() // Esto no funciona; lo dejo como ejemplo
        .then(([rows,fielData]) => {
            console.log("Entrando a la promesa tiemposCat");
            //console.log(rows);
            let numeros= [];
            for (let dato of rows){
                numeros.push(dato.info_metrica);
            }
            console.log(numeros);
            response.render('metricas', {
                tiempos: numeros,
            });  
        })
        .catch(error => {console.log(error)});
    


    //response.render('metricas');
};

