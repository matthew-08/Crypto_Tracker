const router = require('express').Router();
const pool = require('../db');

router.get('/transactions', async (req, res) => {
    const getUser = res.locals.user;
    const test = 'tesla'
    const fetchTransactions = await pool.query('SELECT transaction_id, date, coin, quantity FROM users JOIN user_transactions ON users.user_id = user_transactions.user_id WHERE users.user_name = $1', [test]);
    console.log(fetchTransactions.rows)
    /* const fetchTransactions = await pool.query('SELECT * FROM user_transactions WHERE user_id = $1', [searchParameter]);
    await console.log(fetchTransactions.rows) */
})

module.exports = router
