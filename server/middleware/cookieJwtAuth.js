const jwt = require('jsonwebtoken');
const pool = require('../db');
require('dotenv').config();

const cookieJwtAuth = async (req, res, next) => {
  const token = req.cookies.token;
  try {
    const user = await jwt.verify(token, process.env.SECRETKEY);
    const getUserId = await (await pool.query('SELECT user_id FROM users WHERE user_name = $1', [user.username])).rows[0].user_id
    console.log(getUserId);
    res.locals.userId = getUserId
    res.locals.user = user.username;
  
    next();
  } catch (err) {
    console.log(err);
    console.log('fail')
    res.status(402).send;
    next();
  }
};

module.exports = cookieJwtAuth;
