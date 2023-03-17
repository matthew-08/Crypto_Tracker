const router = require('express').Router();
const pool = require('../db');

router.delete('/coin', async (req, res) => {
    const coinId = req.query.coinId
    const user = res.locals.user
    await pool.query('SELECT ')
    await pool.query(
        `DELETE FROM 
         transactions 
         WHERE coin = $1 AND`)



    return res.status(200).json(coinId);

})