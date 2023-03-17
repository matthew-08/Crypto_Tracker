const router = require('express').Router();
const pool = require('../db');

router.delete('/', async (req, res) => {
    const coinId = req.query.coinId.toLowerCase()
    const userId = res.locals.userId
    console.log(res.locals)
    await pool.query(`
    DELETE FROM 
    user_transactions 
    WHERE coin = $1
    AND
    user_id = $2
    `, [coinId, userId.toLowerCase()])
    await pool.query(`
    UPDATE user_coins 
    SET coins = array_remove
    (coins, $1) 
    WHERE user_id = $2
    `,[coinId, userId])

    return res.status(200).json(coinId);
})

router.put('/', async (req, res) => {
    const coinId = req.query.coinId
    const user = res.locals.user
    const getUserId = await (await pool.query('SELECT user_id FROM users WHERE user_name = $1', [user])).rows[0].user_id
   /*  const getCoins = await pool.query('SELECT user_coins from coins WHERE user_id = $1', [getUserId]) */
    const addToArray = await pool.query('UPDATE user_coins SET coins = array_append(coins, $1) WHERE user_id = $2',
    [coinId, getUserId])
    await console.log(addToArray);
    console.log(req.cookies.token);



    return res.status(200).json(coinId);

})

module.exports = router