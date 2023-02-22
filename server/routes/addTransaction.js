const router = require('express').Router();
const pool = require('../db');


router.post('/transaction', async(req, res) => {

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

