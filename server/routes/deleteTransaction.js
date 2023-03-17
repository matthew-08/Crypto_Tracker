const router = require('express').Router();
const pool = require('../db');


router.delete('/transaction', async (req, res) => {
    const transactionId = req.query.transactionId

    const deleteTransaction = await pool.query('DELETE FROM user_transactions WHERE transaction_id = $1',
    [transactionId])

    return res.status(200).end()
})

module.exports = router