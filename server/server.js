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
    origin: ['http://localhost:8000', 'http://localhost:5173', 'http://localhost:5174'],
    methods: ['GET', 'PUT', 'POST', 'DELETE'],
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
  await coin.then(res => handle())
  const handle = async () => {
    for(let i = 0; i <= mapAllCoins.length; i++) {
      await pool.query('INSERT INTO coins (coin_id, coin_symbol, coin_name) VALUES ($1, $2, $3)',[coin.id, coin.symbol,coin.name])
    }
  }
})


app.use('/auth', require('./routes/auth'));

app.use('/get', cookieJwtAuth, require('./routes/getDashboard'));

app.use('/transactions', cookieJwtAuth, require('./routes/transactions'))

app.use('/search', require('./routes/searchCoin'))

app.use('/coins', cookieJwtAuth, require('./routes/coins'))


app.listen(process.env.PORT, () =>
  console.log(`Sever listening on ${process.env.PORT}`)
);

