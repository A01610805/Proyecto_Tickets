const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class Busqueda {

    //Este método servirá para devolver los objetos del almacenamiento persistente.
<<<<<<< HEAD
    static fetchAll() {
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, nombre_rol FROM usuario NATURAL JOIN rol');
    }
    static fetch(valor) {
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, nombre_rol FROM usuario NATURAL JOIN rol WHERE (nombre LIKE ? OR apellido_paterno LIKE ? OR apellido_materno LIKE ? OR ID_usuario LIKE ? OR ID_rol LIKE ? OR correo LIKE ? OR nombre_rol LIKE ?)', ['%' + valor + '%', '%' + valor + '%', '%' + valor + '%', '%' + valor + '%', '%' + valor + '%', '%' + valor + '%', '%' + valor + '%']);
    }
    static getidusuario(id) {
        return db.execute('SELECT ID_usuario FROM usuario WHERE correo=?', [id]);
    }
}
=======
    static fetchAll(){
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno,apellido_materno,correo, nombre_rol FROM usuario NATURAL JOIN rol');
    }
}
>>>>>>> 307171d521586ba6900f349b0ef4600271bab660
