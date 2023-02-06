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
    origin: ['http://localhost:8000', 'http://localhost:5173'],
    methods: ['GET', 'PUT', 'POST'],
    credentials: true,
    /* allowedHeaders: ['Content-Type', 'Authorization', 'x-csrf-token'], */
    /* maxAge: 600,
    exposedHeaders: ['*', 'Authorization'], */
  })
);

app.use('/auth', require('./routes/signup'));

app.use('/auth', require('./routes/signin'));

app.use('/get', cookieJwtAuth, require('./routes/getDashboard'));

app.listen(process.env.PORT, () =>
  console.log(`Sever listening on ${process.env.PORT}`)
);
