const router = require('express').Router();
const pool = require('../db');


router.delete('/transaction', async (req, res) => {
    const transactionId = req.query.transactionId
    console.log(transactionId);

    const deleteTransaction = await pool.query('DELETE FROM user_transactions WHERE transaction_id = $1',
    [transactionId])

    await console.log(deleteTransaction);
})

module.exports = router