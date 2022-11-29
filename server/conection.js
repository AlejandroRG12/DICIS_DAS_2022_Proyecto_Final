const mysql = require('mysql');
const {promisify} = require ('util'); //manejo de promesa

const connection = mysql.createPool({
    host: 'localhost',
    user: 'user.dev',
    password: 'Prueba123',
    database: 'raites_db'
});

connection.getConnection(
    (err, conn) => {
        if(err){
            console.log('¡Error al conectarse a DB! 😒');
        }
        if(conn){
            console.log('¡DB conectada! 😁');
        }
        return;
    }
);

connection.query = promisify(connection.query);
module.exports = connection;

