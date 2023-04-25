const router = require('express').Router();
const pool = require('../db/db');
const url = require('url');


module.exports = router.get('/coins', async (req, res) => {
    const searchParameter = req.query.coin
    console.log(searchParameter);
    try {
        const data = await pool.query('SELECT * FROM coins WHERE LOWER(coin_name) LIKE LOWER($1) LIMIT 10',[searchParameter + '%'])
        res.status(200).json(data)
    } catch (error) {
        res.status(404).json({error: error})
    }
})