const express = require('express')
const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')
const app = express()
const session = require('express-session')
const jwt = require('jsonwebtoken');
const fs = require('fs')
var xl = require('excel4node');
const xlsxFile = require('read-excel-file/node');


app.set("view engine", "ejs");


app.use(cookieParser())
app.use(bodyParser.urlencoded({
  extended: true
}))
app.use(bodyParser.json())
app.use(session({
  secret: 'secret code',
  resave: true,
  saveUninitialized: true,
  cookie: {
    maxAge: 360000
  }
}))

const PORT = process.env.PORT || 60

const secretKey = "MIICIjANBgkqhkiG9w0BAQaQQE"





app.get('/', (req, res) => {
  res.json('Hello World')
  res.end()
})

app.get('/export', (req, res) => {
  let wb = new xl.Workbook()

  let sheet1 = wb.addWorksheet('sheet1')
  let sheet2 = wb.addWorksheet('sheet2')

  var style = wb.createStyle({
    font: {
      color: '#FF0800',
      size: 12,
    },
    numberFormat: '$#,##0.00; ($#,##0.00); -',
  });

  sheet1.cell(1, 1)
    .number(100)
    .style(style)
  sheet1.cell(1, 2)
    .number(100)
    .style(style)
  sheet1.cell(1, 3)
  .formula('A1 + B1')
    .style(style);
  
  sheet1.cell(2, 1)
    .string('Hellow')
  sheet1.cell(2, 2)
    .string('World')
  
  sheet2.cell(1, 1)
    .number(100)
    .style(style)
  sheet2.cell(1, 2)
    .number(100)
    .style(style)
  sheet2.cell(1, 3)
    .formula('A1 + B1')
    .style(style);

  sheet2.cell(2, 1)
    .string('Hellow')
  sheet2.cell(2, 2)
    .string('World')
  
  wb.write('Excel.xlsx', res);

})


app.get('/doc', (req, res) => {
    res.render('home')
})

app.get('/readexcel', (req, res) => {
  xlsxFile('Excel.xlsx').then((rows) => {
        console.table(rows)
  }) 
  res.end();
})




app.get('/readtext', (req, res) => {
  let text = fs.readFileSync('test.txt', 'utf8')
  res.send(text)
  res.end()
})

app.get('/writetext', (req, res) => {
  fs.writeFileSync('test.txt', 'Hello World', (err) => {
    if (err) {
        return console.log(err)
      }
  })
  res.send('success')
  res.end()
})


app.get('/setToken', (req, res) => {
  let token = jwt.sign({
    foo: 'bar'
  }, secretKey, {
      algorithm: 'HS256'
  });
  console.log(token)
  res.json({
    token: token
  })
})

app.get('/getCookie', (req, res) => {
  res.json({
    Cookie: req.cookies['myname']
  })
  res.end();
})

app.get('/setCookie', (req, res) => {

  res.cookie('myname', 'Saber', {
    maxAge: 30 * 60 * 1000,

  })
  res.json({
    status: 200
  })
  res.end()

})

app.get('/setSessions', (req, res) => {
  req.session.name = 'Lancer'
  res.json({
    status: 200
  })
  res.end()
})

app.get('/getSessions', (req, res) => {
  res.json({
    session: req.session.id
  })
  res.end()
})

app.listen(PORT, () => {
  console.log('Connection port' + PORT)
})