const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class Busqueda {

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static fetchAll(){
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno,apellido_materno,correo, nombre_rol FROM usuario NATURAL JOIN rol');
    }
    static fetch_ID(valor){
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno,apellido_materno,correo, nombre_rol FROM usuario WHERE ( ID_usuario LIKE ? )', ['%'+valor+'%']);
    }
    static fetch_nombre(valor){
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno,apellido_materno,correo, nombre_rol FROM usuario WHERE ( nombre LIKE ? )', ['%'+valor+'%']);
    }
    static fetch_apellidoP(valor){
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno,apellido_materno,correo, nombre_rol FROM usuario WHERE ( apellido_pateno LIKE ? )', ['%'+valor+'%']);
    }
    static fetch_apellidoM(valor){
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno,apellido_materno,correo, nombre_rol FROM usuario WHERE ( apelllido_materno LIKE ? )', ['%'+valor+'%']);
    }
    static fetch_correo(valor){
        return db.execute('SELECT ID_usuario, ID_rol, nombre, apellido_paterno,apellido_materno,correo, nombre_rol FROM usuario WHERE ( correo LIKE ? )', ['%'+valor+'%']);
    }
    static fetchOne(){
        return db.execute('SELECT ID_rol FROM usuario NATURAL JOIN rol');
    }
}
 
