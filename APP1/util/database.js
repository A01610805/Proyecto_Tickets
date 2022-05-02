const mysql = require('mysql2');

const DBlocal = {
    host: 'localhost',
    user: 'root',
    database: 'zebrands_tickets',
    password: '',
    port: 3307
};

const DBinstancia = {
    host: 'localhost',
    user: 'framej',
    database: 'zebrands_tickets',
    password: 'Framej123',
    port: 3306
}

const pool = mysql.createPool(DBInstancia);

module.exports = pool.promise();