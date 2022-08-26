var express = require('express');
var http = require('http');
var path = require('path');
var cookieParser = require('cookie-parser');
var session = require('express-session');
var log4js = require('log4js');

require('./util/enhance');
require('./config/env')();
var config = require('./config/config');
var router = require('./router');

var app = express();
var server = http.createServer(app);

app.use(log4js.connectLogger(log4js.getLogger(), { level: 'info' }));
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ limit: '10mb', extended: false }));
app.use(cookieParser());
app.use(session({
  name: config.cookie_name,
  secret: config.secret,
  resave: false,
  rolling: true,
  saveUninitialized: false,
  cookie: {
    maxAge: 1000 * 3600 * 24,
    sameSite: 'lax'
  }
}));

app.use(express.static(path.join(__dirname, '../public')));
router(app);

app.use(function (req, res, next) {
  res.status(404).send({
    code: 1,
    msg: '404 Not Found'
  });
});

app.use(function (err, req, res, next) {
  res.status(err.status || 500).send({
    code: 1,
    msg: err.message
  });
});

process.on('unhandledRejection', (error, promise) => {
  console.error('unhandledRejection', error);
});

process.on('uncaughtException', (error, origin) => {
  console.error('unhandledRejection', error);
});

module.exports = { app: app, server: server };