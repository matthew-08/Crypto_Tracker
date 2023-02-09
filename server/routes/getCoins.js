const router = require('express').Router();
const pool = require('../db');
const jwt = require('jsonwebtoken');
const cookieJwtAuth = require('../middleware/cookieJwtAuth');

router.get('/coins', async (req, res) => {
    try {
        
    } catch (error) {
        console.error(error)
    }

})

module.exports = router