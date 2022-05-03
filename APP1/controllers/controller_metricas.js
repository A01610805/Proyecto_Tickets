const Metricas = require('../models/metricas');
const Categoria = require('../models/categorias');

exports.getmetricas = async(request, response, next) => {
    Metricas.fechas()
    .then(([rows3,fielData]) => {
        let fechas= [];
        for (let fecha of rows3){
            fechas.push(fecha.Fechas);
        }
        console.log(fechas);
    // Gráfica #1 (tiempos por categoría)
    Metricas.tiemposCat() 
        .then(([rows,fielData]) => {
            //console.log(rows);
            let numeros= [];
            for (let dato of rows){
                numeros.push(dato.info_metrica);
            }
            Metricas.nombresCat()
                .then(([rows2, fielData]) => {
                    let cats= [];
                    for (let cat of rows2){
                        cats.push(cat.nombre_categoria);
                    }

                    Metricas.ticketsemitidos()
                    .then(([rows4, fielData]) => {
                        let te=[];
                        for (let tee of rows4){
                            te.push(tee.fecha_emision);
                        }
                        console.log(numeros)
                        Metricas.ticketsresueltos()
                        .then(([rows5, fielData]) => {
                            let tr=[];
                            for (let trr of rows5){
                                tr.push(trr.fecha_fin);
                            }    
                        Metricas.viewusuariote(request.cookies.id_usuario)
                        Metricas.ticketsresueltos_usuario()
                        .then(([rows6, fielData]) => {
                            let tru=[];
                            for (let trru of rows6){
                                tru.push(trru.fecha_fin);
                            }
                            Usuario.fetchAllSoporte()
                        .then(([rows7, fieldData]) => {
                    response.render('Metricas', {
                        tiempos: numeros,
                        categorias: cats,
                        dates: fechas,
                        ticketsemitidos: te,
                        ticketsresueltos: tr,
                        ticketsresueltosu: tru,
                        users: rows7,
                        rol: request.cookies.rolusuario ? request.cookies.rolusuario : 3,
                        username: request.cookies.nombre_usuario ? request.cookies.nombre_usuario : ''
                    });  
                })
            })
        })
        })
        })
    })
                .catch(error => {console.log(error)});
        })
        .catch(error => {console.log(error)});
    


    //response.render('metricas');
};