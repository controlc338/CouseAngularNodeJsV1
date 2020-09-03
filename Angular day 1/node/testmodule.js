const express = require('express')
const app = express.Router()
const funTest = require('./funTest')

app.get('/user2', (req, res) => {
    res.json({ user:'Hellow', pass:'123'})
})

app.get('/user3',funTest.hellow)

app.get('/user3', (req, res) => {

})

module.exports = app