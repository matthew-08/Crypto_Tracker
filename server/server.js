const express = require('express');
const app = express();
const dotenv = require('dotenv');
const cors = require('cors');
const cookieJwtAuth = require('./middleware/cookieJwtAuth');
const cookies = require('cookie-parser');


dotenv.config();

app.use(cookies());
app.use(express.json());
app.use(
  cors({
    origin: ['http://localhost:8000', 'http://localhost:5173', 'http://localhost:5174'],
    methods: ['GET', 'PUT', 'POST', 'DELETE'],
    credentials: true,
    exposedHeaders: ["set-cookie"]
  })
);

app.set('trust proxy', 1);





app.use('/auth', require('./routes/auth'));

app.use('/get', cookieJwtAuth, require('./routes/getDashboard'));

app.use('/transactions', cookieJwtAuth, require('./routes/transactions'))

app.use('/search', require('./routes/searchCoin'))

app.use('/coins', cookieJwtAuth, require('./routes/coins'))


app.listen(process.env.PORT, () =>
  console.log(`Sever listening on ${process.env.PORT}`)
);

