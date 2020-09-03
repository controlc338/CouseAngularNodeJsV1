const express = require('express')
const cors = require('cors')
const bodyParser = require('body-parser')
const pg = require('pg')
const customer = require('./models/customer')



const db = new pg.Pool({
  host: 'localhost',
  user: 'postgres',
  database: 'db_example',
  password: '1234',
  max: 20,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
  port:5432

})


const app = express()
const PORT = process.env.PORT || 60


app.use(cors())
app.use(bodyParser.json())
var conString = "postgres://postgres:Controlc338@localhost/db_example";

app.get('/', (req, res) => {

  const client = new pg.Client(conString)
  client.connect()
  client.query('SELECT * FROM person', (err, result) => {
    if (err) {
      res.status(501).send({
        status: err.message
      })
    } else {
      res.json(result.rows)
      client.end()
    }
  })
})

app.get('/person', (req, res) => {
  const client = new pg.Client(conString)
  client.connect()
  client.query("INSERT INTO person(name) VALUES('saber')", (err, result) => {
    if (err) {
      res.status(501).send(err.message)
    } else {
      res.json({
        status: 'success'
      })
      client.end()
    }
  })
})

app.get('/person2', (req, res) => {
  db.query("SELECT * FROM person", (err, result) => {
    if (err) {
      res.status(501).json({
        status: err.message
      })
    } else {
      res.json(result.rows)
    }
  })
})

app.delete('/person/:id', async (req, res) => {

  let query = {
    text: "DELETE FROM person WHERE id = $1",
    values: [req.params.id]
  }

  db.query(query, (err, result) => {
    if (err) {
      res.status(501).json({
        status: err.message
      })
    } else {
      res.json({
        status: 'success'
      })
    }
  })
})

app.put('/person/:id', async (req, res) => {
  let query = {
    text: "UPDATE person SET name = $1 WHERE id =$2",
    values: [req.body.name, req.params.id]
  }

  db.query(query, (err, result) => {
    if (err) {
      res.status(501).json({
        status: err.message
      })
    } else {
      res.json({
        status: 'success'
      })
    }
  })
})

app.post('/person/auto', (req, res) => {
  let query = {
    text: "INSERT INTO person(name) VALUES($1) RETURNING id",
    values: [req.body.name]
  }
  db.query(query, (err, result) => {
    if (err) {
      res.status(501).json({
        status: err.message
      })
    } else {
      res.json({
        status: 'success',
        id: result.rows[0].id
      })
    }
  })
})


app.post('/person/trans', async (req, res) => {

  const client = await db.connect()

  try {
    await client.query('BEGIN')

    let query = {
      text: "INSERT INTO person(name) VALUES($1) RETURNING id",
      values: [req.body.name]
    }

    await client.query(query)

    query = {
      text: " INSERT INTO products (name) VALUES($1)",
      values: [req.body.product_name]
    }

    await client.query(query)

    await client.query('COMMIT')
    res.json({
      status: 'success'
    })

  } catch (error) {
    await client.query('ROLLBACK')
    res.json({
      status: error.message
    })
  } finally {
    await client.release()
  }
})

app.get('/se/customer', async (req, res) => {
    res.json(await customer.findAll())
})

app.get('/se/customer/:id', async (req, res) => {
  res.json(await customer.findAll({
    where: {
      id: req.params.id
    }
  }))
})

app.post('/se/customer', async (req, res) => {
  customer.create({
    name: req.body.name,
    tel: req.body.tel,
    address:req.body.address
  }).then(resp => {
      res.json({status:resp})
  }).catch(err => {
    res.json(err.message)
  })
})

app.put('/se/customer/:id', async (req, res) => {
  customer.update({
    name: req.body.name,
    updatedAt: new Date()
  }, {
      where: {
      id: req.params.id
    }
  }).then(resp => {
      res.json(resp)
  }).catch(err => {
      res.json(err.message)
  })
})

app.delete('/se/customer/:id', async (req, res) => {
  
   customer.destroy({
    where:
      { id: req.params.id}
   }).then(resp => {
  res.json(resp
    )
   }).catch(err => {
    res.json(err.message)
  })
  


})






app.use(function (err, req, res, next) {
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  res.status(err.status || 500);
  res.render('error');
});


app.listen(PORT, () => {
  console.log(`Connection PORT ${PORT}`)
})