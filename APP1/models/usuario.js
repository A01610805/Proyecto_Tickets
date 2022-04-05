const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class Busqueda {

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchAll(){
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno,apellido_materno,correo, nombre_rol FROM usuario NATURAL JOIN rol');
    }
}
