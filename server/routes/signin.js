const router = require('express').Router();
const pool = require('../db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();

router.post('/signIn', async (req, res) => {
  const { username, password } = req.body;

  const user = await pool.query('SELECT * from users WHERE user_name = $1', [
    username,
  ]);

  if (user.rows.length === 0) {
    return res.status(402).json({status: 'user'});
  }

  const comparePassword = await bcrypt.compare(password, user.rows[0].password);

  if (comparePassword) {
    const token = await jwt.sign({ username: username }, process.env.SECRETKEY, {
      expiresIn: '1h',
    });
    res.cookie('token', token, {
      httpOnly: true,
    });
    console.log(token);
  }
  return res.status(200).json({ username: username });
  /* res.send(200).json({ comparePassword }); */
});

module.exports = router;
