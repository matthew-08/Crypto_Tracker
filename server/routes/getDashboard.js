const router = require('express').Router();
const pool = require('../db');
const jwt = require('jsonwebtoken');
const cookieJwtAuth = require('../middleware/cookieJwtAuth');

router.get('/dashboard', async (req, res) => {
  try {
    const getUser = res.locals.user;
    const user = await pool.query(
      'SELECT user_name, email FROM users where user_name = $1',
      [getUser]
    );
    res.status(200).json(user.rows[0]);
  } catch (error) {
    console.error(error);
  }
});

module.exports = router;
