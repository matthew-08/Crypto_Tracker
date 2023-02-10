const router = require('express').Router();
const pool = require('../db');


router.post('/transaction', async(req, res) => {
    const { username, coin, quantity } = req.body;

    const addTransaction = await 
    pool.query(
        'INSERT INTO user_transactions (coin, user_id, quantity) VALUES ($1, $2, $3)',
        [
            coin,
            username,
            quantity
        ]
        )
    await console.log(addTransaction);
})

module.exports = router

