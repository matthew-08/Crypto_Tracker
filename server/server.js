const express = require('express');
const app = express();
const dotenv = require('dotenv');
const cors = require('cors');
const cookieJwtAuth = require('./middleware/cookieJwtAuth');
const cookies = require('cookie-parser');
const pool = require('./db')


dotenv.config();

app.use(cookies());
app.use(express.json());
app.use(
  cors({
    origin: ['http://localhost:8000', 'http://localhost:5173'],
    methods: ['GET', 'PUT', 'POST'],
    credentials: true,
    /* allowedHeaders: ['Content-Type', 'Authorization', 'x-csrf-token'], */
    /* maxAge: 600,
    exposedHeaders: ['*', 'Authorization'], */
  })
);

app.get('/add', async (req, res) => {
  const allCoins = await fetch('https://api.coingecko.com/api/v3/coins/list')
  const parseAllCoins = await allCoins.json()
  const coin = await parseAllCoins
  const handle = async () => {
    for(let i = 0; i <= mapAllCoins.length; i++) {
      await pool.query('INSERT INTO coins (coin_id, coin_symbol, coin_name) VALUES ($1, $2, $3)',[coin.id, coin.symbol,coin.name])
    }
  }
  await coin.then(res => handle())
})

app.use('/auth', require('./routes/signup'));

app.use('/auth', require('./routes/signin'));

app.use('/get', cookieJwtAuth, require('./routes/getDashboard'));

app.use('/get', cookieJwtAuth, require('./routes/getCoins'));

app.use('/get', require('./routes/getTransactions'))

app.use('/add', cookieJwtAuth, require('./routes/addCoin'))

app.use('/add', require('./routes/addTransaction'));

app.use('/search', require('./routes/searchCoin'))

app.use('/delete', require('./routes/deleteTransaction'))

app.use('/update', require('./routes/editTransaction'))

app.listen(process.env.PORT, () =>
  console.log(`Sever listening on ${process.env.PORT}`)
);

