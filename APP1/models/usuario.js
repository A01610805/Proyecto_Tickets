const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class Busqueda {

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchAll() {
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, nombre_rol FROM usuario NATURAL JOIN rol');
    }

    static fetch(valor) {
        let arr = valor.split('&');
        console.log(arr[0]);
        console.log(arr[1]);
        console.log(arr[2]);
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, nombre_rol FROM usuario NATURAL JOIN rol WHERE ID_usuario LIKE ? AND nombre LIKE ? AND nombre_rol LIKE ?', ['%' + arr[0] + '%', '%' + arr[1] + '%', '%' + arr[2] + '%']);
    }

    static getidusuario(id) {
        return db.execute('SELECT ID_usuario FROM usuario WHERE correo=?', [id]);
    }

    static getTotal_usuarios() {
        return db.execute('SELECT count(*) as total FROM usuario')
            .then(([rows, fieldData]) => {
                console.log(rows[0].total);
                return rows[0].total;
            })
            .catch(error => {
                console.log(error);
                return 0;
            });
    }

    static fetchusuarios_pag(num) {
        return db.execute('SELECT * FROM usuario NATURAL JOIN rol GROUP BY nombre ASC LIMIT ?, 5', [num]);
    }

}
