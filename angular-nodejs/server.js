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
const multer = require("multer");
const path = require("path");


const PORT = process.env.PORT || 60

app.use(bodyParser.urlencoded({
  extended: false
}))
app.use(bodyParser.json())
app.use(cors())
app.use(cookieParser())
app.use(session({
  secret: 'secret code',
  resave: true,
  saveUninitialized: true,
}))


app.use(express.static(path.join(__dirname, "/public")));

const secretKey = "MIICIjANBgkqhkiG9w0BAQaQQE"


const storage = multer.diskStorage({
  destination: (req, file, callBack) => {
      callBack(null, "public/image/");
  },
  filename: (req, file, callBack) => {
      const uniqueSuffix = Date.now() + "_" + Math.round(Math.random() * 1e9);
      callBack(null, uniqueSuffix + "_" + file.originalname);
  },
});

const upload = multer({ storage: storage });

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




app.post("/upload", upload.single("image"), (req, res, next) => {
  const file = req.file;
  if (!file) {
      const error = new Error("No File");
      error.httpStatusCode = 400;
      return next(error);
  }
  res.send({ name: file.filename, status: "success" });

});



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


