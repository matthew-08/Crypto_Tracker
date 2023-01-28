const express = require('express');
const app = express();
const dotenv = require('dotenv');
const cors = require('cors');

dotenv.config();

app.use(express.json());
app.use(
  cors({
    origin: ['http://localhost:8000', 'http://localhost:5173'],
    methods: ['GET', 'PUT', 'POST'],
  })
);

app.use('/auth', require('./routes/signup'));

app.use('/auth', require('./routes/signin'));

app.listen(process.env.PORT, () =>
  console.log(`Sever listening on ${process.env.PORT}`)
);
