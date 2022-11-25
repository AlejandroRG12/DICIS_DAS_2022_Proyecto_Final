const express = require('express');
const app = express();
const morgan = require('morgan');   //manejo de errores al momento de la peticion
const cors = require('cors'); 
const path = require('path'); //manejo de rutas de archivos de manera relativa

// Uso de dependencias --------------------------------------------------------------------
app.use(morgan('tiny'));                        //manejo de errores
app.use(cors());                                //uso del modulo de nuestra app

// configuracion de express ---------------------------------------------------------------
app.use(express.json());                                    //adaptar las recepciones a formato JSON
app.use(express.urlencoded({extended: true}));              //codificar la barra de direcciones
app.use(express.static(path.join(__dirname, 'public')));    //adaptar la ruta para express



app.listen(3000, function(){
    console.log('API ejecutandose...');
});

app.get('/', (req,res) => {
    res.send('Hola mundo desde Express!');
});