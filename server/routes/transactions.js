const router = require('express').Router();
const pool = require('../db');

router.get('/', async (req, res) => {
    const getUser = res.locals.user;
    const test = 'tesla'
    const fetchTransactions = await pool.query('SELECT transaction_id, date, coin, quantity FROM users JOIN user_transactions ON users.user_id = user_transactions.user_id WHERE users.user_name = $1', [test]);
    console.log(fetchTransactions.rows)
    /* const fetchTransactions = await pool.query('SELECT * FROM user_transactions WHERE user_id = $1', [searchParameter]);
    await console.log(fetchTransactions.rows) */
})

router.delete('/', async (req, res) => {
    const transactionId = req.query.transactionId

    const deleteTransaction = await pool.query('DELETE FROM user_transactions WHERE transaction_id = $1',
    [transactionId])

    return res.status(200).end()
})

router.put('/', async(req, res) => {
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
})

router.post('/', async(req, res) => {

    try {
        const user = res.locals.user
        const { coin, quantity, note, date, price} = req.body;
        console.log(req.body);
        const userId = res.locals.userId
        const addTransaction = await 
        pool.query(
        'INSERT INTO user_transactions (coin, user_id, quantity, note, date, price) VALUES ($1, $2, $3, $4, $5, $6)',
        [
            coin,
            userId,
            quantity,
            note,
            date,
            price,
        ])
        return res.status(200).end()
    } catch (error) {
        return res.status(402).send('authorization error')
    }

    
})

module.exports = router