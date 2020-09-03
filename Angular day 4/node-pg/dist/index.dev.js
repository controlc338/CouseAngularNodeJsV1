"use strict";

var express = require('express');

var cors = require('cors');

var bodyParser = require('body-parser');

var pg = require('pg');

var customer = require('./models/customer');

var db = new pg.Pool({
  host: '27.254.171.187',
  user: 'postgres',
  database: 'db_example',
  password: 'Controlc338',
  max: 20,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000
});
var app = express();
var PORT = process.env.PORT || 60;
app.use(cors());
app.use(bodyParser.json());
var conString = "postgres://postgres:Controlc338@27.254.171.187:5432/db_example";
app.get('/', function (req, res) {
  //var conString = 'postgressql://postgres:@localhost:5432/postgres';
  //var conString = "postgres://postgres:Controlc338@27.254.171.187:5432/db_example";
  var client = new pg.Client(conString);
  client.connect();
  client.query('SELECT * FROM person', function (err, result) {
    if (err) {
      res.status(501).send({
        status: err.message
      });
    } else {
      res.json(result.rows);
      client.end();
    }
  });
});
app.get('/person', function (req, res) {
  var client = new pg.Client(conString);
  client.connect();
  client.query("INSERT INTO person(name) VALUES('saber')", function (err, result) {
    if (err) {
      res.status(501).send(err.message);
    } else {
      res.json({
        status: 'success'
      });
      client.end();
    }
  });
});
app.get('/person2', function (req, res) {
  db.query("SELECT * FROM person", function (err, result) {
    if (err) {
      res.status(501).json({
        status: err.message
      });
    } else {
      res.json(result.rows);
    }
  });
});
app["delete"]('/person/:id', function _callee(req, res) {
  var query;
  return regeneratorRuntime.async(function _callee$(_context) {
    while (1) {
      switch (_context.prev = _context.next) {
        case 0:
          query = {
            text: "DELETE FROM person WHERE id = $1",
            values: [req.params.id]
          };
          db.query(query, function (err, result) {
            if (err) {
              res.status(501).json({
                status: err.message
              });
            } else {
              res.json({
                status: 'success'
              });
            }
          });

        case 2:
        case "end":
          return _context.stop();
      }
    }
  });
});
app.put('/person/:id', function _callee2(req, res) {
  var query;
  return regeneratorRuntime.async(function _callee2$(_context2) {
    while (1) {
      switch (_context2.prev = _context2.next) {
        case 0:
          query = {
            text: "UPDATE person SET name = $1 WHERE id =$2",
            values: [req.body.name, req.params.id]
          };
          db.query(query, function (err, result) {
            if (err) {
              res.status(501).json({
                status: err.message
              });
            } else {
              res.json({
                status: 'success'
              });
            }
          });

        case 2:
        case "end":
          return _context2.stop();
      }
    }
  });
});
app.post('/person/auto', function (req, res) {
  var query = {
    text: "INSERT INTO person(name) VALUES($1) RETURNING id",
    values: [req.body.name]
  };
  db.query(query, function (err, result) {
    if (err) {
      res.status(501).json({
        status: err.message
      });
    } else {
      res.json({
        status: 'success',
        id: result.rows[0].id
      });
    }
  });
});
app.post('/person/trans', function _callee3(req, res) {
  var client, query;
  return regeneratorRuntime.async(function _callee3$(_context3) {
    while (1) {
      switch (_context3.prev = _context3.next) {
        case 0:
          _context3.next = 2;
          return regeneratorRuntime.awrap(db.connect());

        case 2:
          client = _context3.sent;
          _context3.prev = 3;
          _context3.next = 6;
          return regeneratorRuntime.awrap(client.query('BEGIN'));

        case 6:
          query = {
            text: "INSERT INTO person(name) VALUES($1) RETURNING id",
            values: [req.body.name]
          };
          _context3.next = 9;
          return regeneratorRuntime.awrap(client.query(query));

        case 9:
          query = {
            text: " INSERT INTO products (name) VALUES($1)",
            values: [req.body.product_name]
          };
          _context3.next = 12;
          return regeneratorRuntime.awrap(client.query(query));

        case 12:
          _context3.next = 14;
          return regeneratorRuntime.awrap(client.query('COMMIT'));

        case 14:
          res.json({
            status: 'success'
          });
          _context3.next = 22;
          break;

        case 17:
          _context3.prev = 17;
          _context3.t0 = _context3["catch"](3);
          _context3.next = 21;
          return regeneratorRuntime.awrap(client.query('ROLLBACK'));

        case 21:
          res.json({
            status: _context3.t0.message
          });

        case 22:
          _context3.prev = 22;
          _context3.next = 25;
          return regeneratorRuntime.awrap(client.release());

        case 25:
          return _context3.finish(22);

        case 26:
        case "end":
          return _context3.stop();
      }
    }
  }, null, null, [[3, 17, 22, 26]]);
});
app.get('/se/customer', function _callee4(req, res) {
  return regeneratorRuntime.async(function _callee4$(_context4) {
    while (1) {
      switch (_context4.prev = _context4.next) {
        case 0:
          _context4.t0 = res;
          _context4.next = 3;
          return regeneratorRuntime.awrap(customer.findAll());

        case 3:
          _context4.t1 = _context4.sent;

          _context4.t0.json.call(_context4.t0, _context4.t1);

        case 5:
        case "end":
          return _context4.stop();
      }
    }
  });
});
app.get('/se/customer/:id', function _callee5(req, res) {
  return regeneratorRuntime.async(function _callee5$(_context5) {
    while (1) {
      switch (_context5.prev = _context5.next) {
        case 0:
          _context5.t0 = res;
          _context5.next = 3;
          return regeneratorRuntime.awrap(customer.findAll({
            where: {
              id: req.params.id
            }
          }));

        case 3:
          _context5.t1 = _context5.sent;

          _context5.t0.json.call(_context5.t0, _context5.t1);

        case 5:
        case "end":
          return _context5.stop();
      }
    }
  });
});
app.post('/se/customer', function _callee6(req, res) {
  return regeneratorRuntime.async(function _callee6$(_context6) {
    while (1) {
      switch (_context6.prev = _context6.next) {
        case 0:
          customer.create({
            name: req.body.name,
            tel: req.body.tel,
            address: req.body.address
          }).then(function (resp) {
            res.json({
              status: resp
            });
          })["catch"](function (err) {
            res.json(err.message);
          });

        case 1:
        case "end":
          return _context6.stop();
      }
    }
  });
});
app.put('/se/customer/:id', function _callee7(req, res) {
  return regeneratorRuntime.async(function _callee7$(_context7) {
    while (1) {
      switch (_context7.prev = _context7.next) {
        case 0:
          customer.update({
            name: req.body.name,
            updatedAt: new Date()
          }, {
            where: {
              id: req.params.id
            }
          }).then(function (resp) {
            res.json(resp);
          })["catch"](function (err) {
            res.json(err.message);
          });

        case 1:
        case "end":
          return _context7.stop();
      }
    }
  });
});
app["delete"]('/se/customer/:id', function _callee8(req, res) {
  return regeneratorRuntime.async(function _callee8$(_context8) {
    while (1) {
      switch (_context8.prev = _context8.next) {
        case 0:
          customer.destroy({
            where: {
              id: req.params.id
            }
          }).then(function (resp) {
            res.json(resp);
          })["catch"](function (err) {
            res.json(err.message);
          });

        case 1:
        case "end":
          return _context8.stop();
      }
    }
  });
});
app.use(function (err, req, res, next) {
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  res.status(err.status || 500);
  res.render('error');
});
app.listen(PORT, function () {
  console.log("Connection PORT ".concat(PORT));
});