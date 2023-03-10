const router = require('express').Router();
const pool = require('../db');
const url = require('url');


module.exports = router.get('/coins', async (req, res) => {
    const searchParameter = req.query.coin
    try {
        const data = await pool.query('SELECT * FROM coins WHERE LOWER(coin_name) LIKE LOWER($1) LIMIT 10',[searchParameter + '%'])
        res.status(200).json(data)
    } catch (error) {
        
    }
})