"use strict";

var http = require('http');

var express = require('express');

var bodyParser = require("body-parser");

var fetch = require('node-fetch');

var testmodule = require('./testmodule');

var cors = require('cors'); //npm i multer


var PORT = process.env.PORT || 85;
var app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));

showTest1 = function showTest1() {
  return new Promise(function (resolve, reject) {
    fetch('https://jsonplaceholder.typicode.cm/todos/1').then(function (response) {
      return response.json();
    }).then(function (json) {
      return resolve(json);
    })["catch"](function (error) {
      return reject(error);
    });
  });
};

middleTest = function middleTest(req, res, next) {
  console.log(req.body);

  if (req.body.status == 'not found') {
    res.send('Not found');
  } else {
    console.log('In come');
    next();
  }
};

app.use('/user', middleTest, testmodule);
app.get('/hellow', function _callee(req, res) {
  var resp1, resp;
  return regeneratorRuntime.async(function _callee$(_context) {
    while (1) {
      switch (_context.prev = _context.next) {
        case 0:
          _context.prev = 0;
          resp1 = showTest1();
          _context.next = 4;
          return regeneratorRuntime.awrap(showTest1());

        case 4:
          resp = _context.sent;
          console.log(resp);
          console.log('two');
          console.log('three');
          res.send('success');
          _context.next = 14;
          break;

        case 11:
          _context.prev = 11;
          _context.t0 = _context["catch"](0);
          console.log(_context.t0);

        case 14:
        case "end":
          return _context.stop();
      }
    }
  }, null, null, [[0, 11]]);
});
app.post('/posttest', function (req, res) {
  var body = req.body;
  res.json(body.name + body.last);
});
app.put('/puttest/:name/:two', function (req, res) {
  var body = req.body;
  var params = req.params.name;
  console.log(req.params.two);
  console.log(params);
  res.json(body);
});
app["delete"]('/deletetest/:name/:two', function (req, res) {
  var params = req.params.name;
  console.table(req.params);
  res.send(req.params);
});
var server = http.createServer(app);
server.addListener('Connection', function () {
  console.log('Client Connection');
});
server.listen(PORT, function () {
  console.log("PORT", PORT);
}); // const server = http.createServer((req, res) => {
//   // if (req.url == '/') {
//   //   res.write('Hello World')
//   //   res.end()
//   // } else if (req.url == '/hellow') {
//   //   let add = 1 + 1
//   //   res.write('Hello Worldsss')
//   //   res.end()
//   // }
//   if (req.method == 'POST') {
//     if (req.url === '/testpost') {
//       res.write('Hello')
//       res.end()
//     } else if (req.url == '/testpost2') {
//       let body = ''
//       req.on('data', data => {
//           body += data.toString()
//       })
//       req.on('end', () => {
//         //console.log(body.name + '' + body.last)
//         //let resp = body.name + '' + body.last
//         res.write(body)
//         res.end()
//       })
//     }
//   } else if (req.method == 'GET') {
//     if (req.url === '/testpost') {
//       res.write('Hello2')
//       res.end()
//     }
//   }
// });