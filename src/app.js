const express = require('express');
var crypto = require('crypto');

const app = express();

app.get('/', (req, res) => {
  res.send('hello world');
});

app.get('/hashthis', (req, res) => {
    let hashed = crypto.createHash('md5').update(req.query.tohash).digest('hex');
    res.send(hashed);
});

module.exports = app;