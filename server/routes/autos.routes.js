const express = require('express');
const router = express.Router();

const connection = require('../conection.js');

router.get('/todos_los_autos', async(req, res) => {
    const quey = 'SELECT * FROM libro';
    cosnt 
    connection.query(quey);
    
});