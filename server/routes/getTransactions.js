const router = require('express').Router();
const pool = require('../db');

router.get('/transactions', async (req, res) => {
    const searchParameter = req.query.user
    console.log(searchParameter)

    const fetchTransactions = await pool.query('SELECT * FROM user_transactions WHERE user_id = $1', [searchParameter]);
    await console.log(fetchTransactions.rows)
})

module.exports = router