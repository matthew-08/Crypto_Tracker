const router = require('express').Router();
const pool = require('../db');
const jwt = require('jsonwebtoken');
const cookieJwtAuth = require('../middleware/cookieJwtAuth');

router.get('/dashboard', async (req, res) => {
  try {
    const getUser = res.locals.user;
    const user = await pool.query(
      'SELECT user_name, email, user_id FROM users where user_name = $1',
      [getUser]
    );
    const user_id = await user.rows[0].user_id;
    await console.log(user_id);
    const coins = await pool.query(
      'SELECT coins FROM user_coins where user_id = $1',
      [user_id]
    );
    const parseJSON = await coins.rows[0].coins
    const combinedData = {
      coins: parseJSON,
      user_name: user.rows[0].user_name,
      email: user.rows[0].email,
    }
    console.log(combinedData);
    res.status(200).json(combinedData);
  } catch (error) {
    console.error(error);
  }
});

module.exports = router;
