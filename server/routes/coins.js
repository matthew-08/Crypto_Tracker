const router = require('express').Router();
const pool = require('../db');

router.delete('/', async (req, res) => {
    const coinId = req.query.coinId
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
    console.log(coinId);
    return res.status(200).json(coinId);
})

router.put('/', async (req, res) => {
    const coinId = req.query.coinId
    const user = res.locals.user
    const getUserId = await (await pool.query(`
    SELECT user_id 
    FROM users 
    WHERE user_name = $1
    `,[user])).rows[0].user_id
    const addToArray = await pool.query(`
    UPDATE user_coins 
    SET coins = array_append(coins, $1) 
    WHERE user_id = $2`,
    [coinId, getUserId])

    return res.status(200).json(coinId);

})

router.get('/add', async (req, res) => {
    const allCoins = await fetch('https://api.coingecko.com/api/v3/coins/list')
    const parseAllCoins = await allCoins.json()
    const coin = await parseAllCoins
    await coin.then(res => handle())
    const handle = async () => {
      for(let i = 0; i <= mapAllCoins.length; i++) {
        await pool.query(`
        INSERT INTO coins 
        (coin_id, coin_symbol, coin_name) 
        VALUES ($1, $2, $3)`,
        [coin.id, coin.symbol,coin.name])
      }
    }
  })

module.exports = router