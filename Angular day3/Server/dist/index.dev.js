"use strict";

var keys = {
  "public": 'BL0AQWPUewYu69fazElPky9CC2JLSSa9bUbQvQMcafeUNhvIq9o2GtWadPQw3rrkORas5JUSgHRROuoNpSZG5Os',
  "private": 'cw7ZOjZEfnU1GyL4T1OkeKdi6HJBwG1wj66X6bUdqis'
};

var express = require('express');

var bodyParser = require('body-parser');

var webPush = require('web-push');

var cors = require('cors');

var app = express();
var PORT = process.env.PORT || 60;
app.use(bodyParser.json());
app.use(cors());
app.post('/notification', function (req, res) {
  var subscription = req.body;
  res.set('Content-Type', 'application/json');
  webPush.setVapidDetails('mailto:noti@gmail.com', keys["public"], keys["private"]);
  var payload = JSON.stringify({
    notification: {
      title: 'Party',
      body: '123',
      icon: null
    }
  });
  Promise.resolve(webPush.sendNotification(subscription, payload)).then(function () {
    res.status(200).send({
      message: 'Notification sent'
    });
  }, function (err) {
    console.log(err);
  });
});
app.get('/', function (req, res) {
  res.send('Hellow');
});
app.listen(PORT, function () {
  console.log("Connection To ".concat(PORT));
});