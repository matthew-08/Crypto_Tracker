const router = require('express').Router();
const pool = require('../db');


router.post('/transaction', async(req, res) => {
    const user = res.locals.user
    const { coin, quantity, note, date} = req.body;
    const getUserId = await (await pool.query('SELECT user_id FROM users WHERE user_name = $1', [user])).rows[0].user_id
    console.log(getUserId);

    const addTransaction = await 
    pool.query(
        'INSERT INTO user_transactions (coin, user_id, quantity, note, date) VALUES ($1, $2, $3, $4, $5)',
        [
            coin,
            userId,
            quantity,
            note,
            date
        ]
        )
    await console.log(addTransaction);
})

module.exports = router

