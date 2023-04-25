require('dotenv').config();
const Pool = require('pg').Pool;

const pool = new Pool({
  user: process.env.POSTGRES_USER,
  host: process.env.POSTGRES_HOST,
  password: process.env.POSTGRES_PASSWORD,
  port: process.env.POSTGRES_PORT,
  database: process.env.POSTGRES_DATABASE,
});

console.log({
  user: process.env.POSTGRES_USER,
  host: process.env.POSTGRES_HOST,
  password: process.env.POSTGRES_PASSWORD,
  port: process.env.POSTGRES_PORT,
  database: process.env.POSTGRES_DATABASE,
})

console.log(pool)

module.exports = pool;
