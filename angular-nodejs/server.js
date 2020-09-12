const express = require('express')
const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')
const app = express()
const session = require('express-session')
const jwt = require('jsonwebtoken');
const cors = require('cors')
const login = require('./module_route/login')
const note = require('./route/note')
const tag = require('./route/tag')

const PORT = process.env.PORT || 60

app.use(bodyParser.urlencoded({
  extended: true
}))
app.use(bodyParser.json())
app.use(cors())
app.use(cookieParser())
app.use(session({
  secret: 'secret code',
  resave: true,
  saveUninitialized: true,
}))

const secretKey = "MIICIjANBgkqhkiG9w0BAQaQQE"

verifyToken = (req, res, next) => {
  let token = req.headers['authorization']
  jwt.verify(token, secretKey, (err, payload) => {
    if (err) {
      res.status(401).json({
        message: err.message
      })
    } else {
      req.payload = payload
      next()
    }
  })
}

app.get('/', (req, res) => {
  res.json({
    message: 'Hellow World'
  })
})



app.post('/login', login.login)

app.use('/note', verifyToken, note)
app.use('/tag', verifyToken, tag)


app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  if (err.status == 404) {
    res.status(404);
    res.sendFile(__dirname + "/public/error.html");
  }
});

app.listen(PORT, () => {
  console.log(`Connection port ${PORT}`)
})