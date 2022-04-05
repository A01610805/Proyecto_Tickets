const Busqueda = require('../models/usuario');
const Rol = require('../models/rol');

exports.get_busqueda = (req,res,next) => {
    console.log('Entrando a Buscar Usuario');
    Busqueda.fetchAll()
        .then(([rows, fielData])=>{
            Rol.findOne()
                .then(([rows2, fielData]) => {
                    res.render('BuscarUsuarios',{
                        usuario: rows,
                        rol: rows2,
                    });
                })
            .catch(error => {console.log(error)});
        })
     .catch(error => {console.log(error)});
}
exports.filtrar = (req, res, next) => {
    // console.log(req.params.ID_rol);
    //console.log(req.get('Cookie').split('=')[1]);
    // console.log(req.cookies);
    // const info = req.session.info ? req.session.info : '';
    // req.session.info = '';
    Busqueda.fetchOne(req.params.ID_rol)
        .then(([rows, fieldData]) => {
            Rol.findOne()
                .then(([rows2, fielData]) => {
                    res.render('BuscarUsuarios',{
                        usuario: rows,
                        rol: rows2,
                        }); 
                    })
                .catch(error => {console.log(error)});
                })
            .catch(error => {console.log(error)});
            
}
exports.buscar = (req, res, next) => {
    // console.log(req.params.valor);
    Busqueda.fetch_ID(req.params.valor)
        .then(([rows, fieldData]) => {
            Busqueda.fetch_nombre(req.params.valor)
                .then(([rows2, fieldData]) => {
                    Busqueda.fetch_apellidoP(req.params.valor)
                        .then(([rows3, fieldData]) => {
                            Busqueda.fetch_apellidoM(req.params.valor)
                                .then(([rows4, fieldData]) => {
                                    Busqueda.fetch_correo(req.params.valor)
                                        .then(([rows5, fieldData]) => {
                                            console.log(rows);
                                            res.status(200).json(rows, rows2, rows3, rows4, rows5);
                                        })
                                        .catch(err => {
                                            console.log(err);
                                        }); 
                                })
                                .catch(err => {
                                    console.log(err);
                                }); 
                        })
                        .catch(err => {
                            console.log(err);
                        });
                })
                .catch(err => {
                    console.log(err);
                }); 
        })
        .catch(err => {
            console.log(err);
        }); 
    
     
        

}

exports.root = (req,res,next) => {
    console.log('Ruta por defecto de buscar usuario');
    res.redirect('/home'); 
};