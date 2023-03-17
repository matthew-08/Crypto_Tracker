const router = require('express').Router();
const pool = require('../db');

router.delete('/', async (req, res) => {
    const coinId = req.query.coinId
    const userId = res.locals.userId
    await pool.query('SELECT ')
    await pool.query(`
    DELETE FROM 
    user_transactions 
    WHERE coin = $1
    AND
    user_id = $2
    `, [coinId, userId])

    return res.status(200).json(coinId);
})

module.exports = router