const mysql = require('mysql2');

const DBlocal = {
    host: 'localhost',
    user: 'root',
    database: 'zebrands_tickets',
    password: '',

};

const DBinstancia = {
    host: 'localhost',
    user: 'framej',
    database: 'zebrands_tickets',
    password: 'Framej123',
    port: 3306
}

const pool = mysql.createPool(DBlocal);

module.exports = pool.promise();