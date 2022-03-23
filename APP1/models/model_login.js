const db = require('../util/database');

module.exports = class User {

    //Constructor de la clase. Sirve para crear un nuevo objeto, y en él se definen las propiedades del modelo
    constructor(ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) {
        this.ID_usuario = ID_usuario;
        this.ID_rol = ID_rol;
        this.nombre = nombre;
        this.apellido_paterno = apellido_paterno;
        this.apellido_materno = apellido_materno;
        this.correo = correo;
        this.password = password;
    }

    //Como solo se quieren obtener los datos no se incluye un metodo save().
    save() {
        //return db.execute(
        //    'INSERT INTO usuarios(nombre, username, password) VALUES(?,?,?)',
        //    [this.nombre, this.username, password_cifrado]);
    }

    //Este método servirá para devolver los objetos del almacenamiento persistente.
    static findOne(name) {
        return db.execute('SELECT * FROM usuario WHERE nombre=?',
            [name]);
    }
}