const db = require('../configdb')


exports.findAll = (req, res) => {
  let query = {
    text: "SELECT * FROM tb_tag WHERE user_id = $1",
    values: [req.payload.user_id]
  }
  db.query(query, (err, result) => {
    if (err) {
      res.status(501).json({
        message: err.message
      })
    } else {
      res.json(result.rows)
    }
  })
}
  

exports.created = (req, res) => {
  let query = {
    text: "INSERT INTO tb_tag(name,user_id) VALUES($1, $2)",
    values: [req.body.name, req.payload.user_id]
  }

  db.query(query, (err, result) => {
    if (err) {
      res.status(501).json({
          message: err.message
        })
    } else {
      res.json({
        message: 'success'
      })
    }
  })
}

exports.delete = (req, res) => {
  let query = {
    text: "DELETE FROM tb_tag WHERE id = $1",
    values: [req.params.id]
  }
  db.query(query, (err, result) => {
    if (err) {
      res.status(501).json({
        message: err.message
      })
    } else {
      res.json({
        message: 'success'
      })
    }
  })
}

