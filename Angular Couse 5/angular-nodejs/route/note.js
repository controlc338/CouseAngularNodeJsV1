const route = require('express').Router()
const note = require('../module_route/note')


route.get('/findAll', note.findAll)
route.post('/note', note.createNote)
route.put('/note/:id', note.updateNote)
route.delete('/note/:id', note.deleteNote)

route.get('/note/:keyworld', note.findBykeyworld)


module.exports = route
