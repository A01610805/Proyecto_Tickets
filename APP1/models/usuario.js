const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class Busqueda {

    constructor(ID_rol, ID_usuario) {
        this.ID_rol = ID_rol;
        this.ID_usuario = ID_usuario;
    }

    static fetchAll() {
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, nombre_rol FROM usuario NATURAL JOIN rol');
    }

    static fetchAllSoporte() {
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, nombre_rol FROM usuario NATURAL JOIN rol WHERE ID_rol=2 OR ID_rol=1');
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
        return db.execute('SELECT * FROM usuario NATURAL JOIN rol GROUP BY ID_usuario ASC LIMIT '+num+', 5');
    }

    static fetchusuario_id(id_usuario) {
        return db.execute('SELECT * FROM usuario NATURAL JOIN rol WHERE ID_usuario = ?', [id_usuario]);
    }

    update_rol() {
        return db.execute('UPDATE usuario set ID_rol = ? WHERE ID_usuario = ?', [this.ID_rol, this.ID_usuario]);
    }

    static update_rol() {
        return db.execute('UPDATE usuario set ID_rol = ? WHERE ID_usuario = ?', [this.ID_rol, this.ID_usuario]);
    }

    static getusuariobyid(idusuario) {
        return db.execute('SELECT * FROM usuario WHERE ID_usuario = ?', [idusuario]);
    }

    static actualizar_password(npass,idusuario) {
        return bcrypt.hash(npass, 12)
            .then((nuevo_password_cifrado) => {
                return db.execute(
                    'UPDATE usuario SET password = ? WHERE ID_usuario = ?', [nuevo_password_cifrado,idusuario]);
            }).catch((error) => {
                console.log(error);
            });
    }

}
