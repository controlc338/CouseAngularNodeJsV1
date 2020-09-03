"use strict";

var express = require('express');

var app = express.Router();

var funTest = require('./funTest');

app.get('/user2', function (req, res) {
  res.json({
    user: 'Hellow',
    pass: '123'
  });
});
app.get('/user3', funTest.hellow);
app.get('/user3', function (req, res) {});
module.exports = app;