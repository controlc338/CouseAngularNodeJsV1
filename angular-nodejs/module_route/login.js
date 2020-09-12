const db = require('../configdb')
const jwt = require('jsonwebtoken');

const secretKey = "MIICIjANBgkqhkiG9w0BAQaQQE"

exports.login = async (req, res, next) => {
  try {
      
    let query = {
      text: "SELECT * FROM tb_user WHERE username = $1 AND password =$2",
      values:[req.body.username, req.body.password]
    }
    let user = (await db.query(query)).rows

    if (user.length > 0) {
      let payload = {
        name: user[0].name,
        lastname: user[0].last_name,
        user_id: user[0].id
      }
      let token = jwt.sign(payload, secretKey, { algorithm: "HS256", expiresIn: '1d' })
      res.send({
        message: 'success',
        token: token
      })
      res.end()

    } else {
      res.send({
        message:"User not found"
      })
    }
    res.end()

  } catch (error) {
    res.status(501).send({
      message:error.message
    })
  }
}