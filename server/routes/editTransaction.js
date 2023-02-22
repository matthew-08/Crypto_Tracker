const router = require('express').Router();
const pool = require('../db');


router.put('/transaction', async(req, res) => {
    const transactionId = req.query.transactionId
    console.log(transactionId)
    const {quantity, note, date, price} = req.query
    console.log(date);

    console.log(transactionId);

    const editTransaction = await 
    pool.query(
        'UPDATE user_transactions SET quantity = $2, price = $3, date = $4, note = $5 WHERE transaction_id = $1',
        [
            transactionId,
            quantity,
            price,
            date,
            note,
        ]
        )
    return res.status(200).end()
    await console.log(editTransaction);
})

module.exports = router