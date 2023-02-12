const jwt = require('jsonwebtoken');
const pool = require('../db');
require('dotenv').config();

const cookieJwtAuth = async (req, res, next) => {
  const token = req.cookies.token;
  console.log('in middleware')
  try {
    const user = await jwt.verify(token, process.env.SECRETKEY);
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
