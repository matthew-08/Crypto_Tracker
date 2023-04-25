const router = require('express').Router();
const pool = require('../db/db');
const userInfoSchema = require('../models/userInfo')

router.get('/dashboard', async (req, res) => {
  try {
    console.log("DASHBOARD")
    const getUser = res.locals.user;
    console.log(getUser)
    const user = await pool.query(
      `SELECT user_name, email, user_id 
      FROM users 
      WHERE user_name = $1`,
      [getUser]
    );
    const user_id = await user.rows[0].user_id;
    await console.log(user_id);
    const coins = await pool.query(
      'SELECT coins FROM user_coins where user_id = $1',
      [user_id]
    );
    const parseJSON = await coins.rows[0].coins
    const getTransactions = await pool.query(
    'SELECT * FROM user_transactions where user_id = $1',
    [user_id]
    );
    const parseTransactions = await getTransactions.rows
    
    const userInfo = userInfoSchema(
      parseTransactions,
      parseJSON,
      user.rows[0].user_name,
      user.rows[0].email,
    )

    res.status(200).json(userInfo);
  } catch (error) {
    return res.status(404).end()
  }
});

module.exports = router;
