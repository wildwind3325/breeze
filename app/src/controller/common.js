var express = require('express');

var config = require('../config/config');

var router = express.Router();

router.post('/login', function (req, res, next) {
  res.send({ code: 0 });
});

router.post('/logout', function (req, res, next) {
  req.session.destroy(err => { });
  res.clearCookie(config.cookie_name);
  res.send({ code: 0 });
});

router.post('/status', function (req, res, next) {
  if (req.session.user) {
    res.send({
      code: 0,
      data: { loggedIn: true }
    });
  } else {
    res.send({
      code: 0,
      data: { loggedIn: false }
    });
  }
});

module.exports = router;