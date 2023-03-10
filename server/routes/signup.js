const router = require('express').Router();
const pool = require('../db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

router.post('/createUser', async (req, res) => {
  const { username, email, password } = req.body;

  const doesEmailExist = await pool.query(
    'SELECT * FROM users WHERE email = $1',
    [email]
  );

  const doesUsernameExist = await pool.query(
    'SELECT * FROM users WHERE user_name = $1',
    [username]
  );

  if (doesEmailExist.rows.length !== 0) {
    return res.status(402).json({ type: 'email' });
  } else if (doesUsernameExist.rows.length !== 0) {
    return res.status(402).json({ type: 'username' });
  } else {
    const saltRounds = 10;

    const salt = await bcrypt.genSalt(saltRounds);
    const encryptedPass = await bcrypt.hash(password, salt);

    const a = await pool.query(
      'INSERT INTO users (user_name, email, password) VALUES ($1, $2, $3) RETURNING email, user_id',
      [username, email, encryptedPass]
    );
    const userId = await a.rows[0].user_id
    
    const setDefaultCoins = await pool.query(
      'INSERT INTO user_coins(coins, user_id) VALUES (ARRAY[$1, $2, $3], $4)', [
        'bitcoin',
        'ethereum',
        'dogecoin',
        userId,
      ]
    )
    const token = jwt.sign({ username: username }, process.env.SECRETKEY, {
      expiresIn: '1h',
    });
    console.log(token)
    res.cookie('token', token, {
      httpOnly: true,
    });
    console.log(setDefaultCoins);
    return res.status(200).json({ a: a.rows[0] });
  }
});

module.exports = router;
