const jwt = require('jsonwebtoken');
require('dotenv').config();

const cookieJwtAuth = (req, res, next) => {
  const token = req.cookies.token;
  try {
    const user = jwt.verify(token, process.env.SECRETKEY);
    res.locals.user = user.username;
    next();
  } catch (err) {
    res.status(402).send;
    next();
  }
};

module.exports = cookieJwtAuth;
