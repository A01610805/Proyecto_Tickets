const Metricas = require('../models/metricas');
const Categoria = require('../models/categorias');

exports.getmetricas = async(request, response, next) => {
    console.log("estamos dentro!");

    // Gráfica #1 (tiempos por categoría)
    Metricas.tiemposCat() 
        .then(([rows,fielData]) => {
            //console.log(rows);
            let numeros= [];
            for (let dato of rows){
                numeros.push(dato.info_metrica);
            }
            response.render('metricas', {
                tiempos: numeros,
            });  
        })
        .catch(error => {console.log(error)});
    


    //response.render('metricas');
};

