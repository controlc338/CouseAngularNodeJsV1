const route = require('express').Router()
const tag = require('../module_route/tag')

route.post('/', tag.created)
route.delete('/delete/:id', tag.delete)
route.get('/', tag.findAll)


module.exports = route