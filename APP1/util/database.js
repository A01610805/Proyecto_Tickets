const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'zebrands_tickets',
    password: '',
    port: 3000
});

module.exports = pool.promise();