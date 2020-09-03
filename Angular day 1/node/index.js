const http = require('http');
const express = require('express');
var bodyParser = require("body-parser");
const fetch = require('node-fetch')
const testmodule = require('./testmodule')
const cors = require('cors');
//npm i multer



const PORT = process.env.PORT || 85


var app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

showTest1 = () => {
  return new Promise((resolve, reject) => {
    fetch('https://jsonplaceholder.typicode.cm/todos/1')
      .then(response => response.json())
      .then(json => resolve(json))
      .catch(error => reject(error))
  })
}

middleTest = (req, res, next) => {
  console.log(req.body)
  if (req.body.status == 'not found') {
      res.send('Not found')
  } else {
      console.log('In come')
      next()
    }
}


app.use('/user',middleTest, testmodule)

app.get('/hellow', async (req, res) => {

  try {
    const resp1 = showTest1();

    const resp = await showTest1();

    console.log(resp)
    console.log('two')
    console.log('three')
    res.send('success')
  } catch (error) {
    console.log(error)
  }

})

app.post('/posttest', (req, res) => {
  let body = req.body
  res.json(body.name + body.last)
})

app.put('/puttest/:name/:two', (req, res) => {
  let body = req.body
  let params = req.params.name
  console.log(req.params.two)
  console.log(params)
  res.json(body)
})

app.delete('/deletetest/:name/:two', (req, res) => {
  let params = req.params.name
  console.table(req.params)
  res.send(req.params)
})


const server = http.createServer(app);
server.addListener('Connection', () => {
  console.log('Client Connection')
})

server.listen(PORT, () => {
  console.log("PORT", PORT)
})

// const server = http.createServer((req, res) => {
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



