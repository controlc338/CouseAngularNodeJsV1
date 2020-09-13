const db = require('../configdb')


exports.findAll = (req, res) => {
  let query = {
    text: "SELECT * FROM tb_note WHERE user_id = $1",
    values: [req.payload.user_id]
  }

  db.query(query, (err, result) => {
    if (err) {
      res.status(501).json({
        err: err.message
      })
    } else {
      res.json(result.rows)
      res.end()
    }
  })
}

exports.createNote = (req, res) => {
  let query = {
    text: "INSERT INTO tb_note(note, tag_id, user_id) VALUES($1, $2, $3)",
    values: [req.body.note, req.body.tag_id, req.payload.user_id]
  }
  db.query(query, (err, result) => {
    if (err) {
      console.log(err.message)
      res.status(501).json({
        err: err.message
      })
    } else {
      res.json({
        message: 'success'
      })
      res.end()
    }
  })
}

exports.updateNote = (req, res) => {
  let query = {
    text: "UPDATE tb_note SET note = $1, tag_id =$2 WHERE id = $3",
    values: [req.body.note, req.body.tag_id, req.params.id]
  }

  db.query(query, (err, result) => {
    if (err) {
      res.status(501).json({
        err: err.message
      })
    } else {
      res.json({
        message: 'success'
      })
      res.end()
    }
  })
}

exports.deleteNote = (req, res) => {
  let query = {
    text: "DELETE FROM tb_note WHERE id = $1",
    values: [req.params.id]
  }
  db.query(query, (err, result) => {
    if (err) {
      res.status(501).json({
        err: err.message
      })
    } else {
      res.json({
        message: 'success'
      })
      res.end()
    }
  })
}

exports.findBykeyworld = (req, res) => {
  let query = {
    text: " SELECT * FROM tb_note WHERE user_id =$1 AND note LIKE $2",
    values: [req.payload.user_id, `%${req.params.keyworld}%`]
  }
  console.log(req.params)
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