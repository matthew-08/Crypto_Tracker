const router = require('express').Router();
const pool = require('../db');

router.put('/coin', async (req, res) => {
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