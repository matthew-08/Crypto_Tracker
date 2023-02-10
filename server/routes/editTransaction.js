const router = require('express').Router();
const pool = require('../db');


router.put('/transaction', async(req, res) => {
    const transactionId = req.query.transactionId
    const updatedQuantity = req.query.quantity

    console.log(transactionId);

    const editTransaction = await 
    pool.query(
        'UPDATE user_transactions SET quantity = $1 WHERE transaction_id = $2',
        [
            updatedQuantity,
            transactionId
        ]
        )
    await console.log(editTransaction);
})

module.exports = router