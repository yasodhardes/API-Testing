const e = require('cors');
var express = require('express'),
employe  = require('../models/employe');

var app = module.exports = express.Router();

app.get('/api/status', function(req, res) {
  res.status(200).send({status: "ok"});
})

app.get('/api/employeRand', function(req, res) {
  res.status(200).send(employe.getRandomOne());
});

