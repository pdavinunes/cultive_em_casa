const { Router } = require('express');
const UserController = require('./controllers/UserController')

const routes = Router()

routes.get('/users', UserController.index)
routes.post('/users', UserController.store)

routes.get('/', (req, res) => {
    return res.json({status : 'running'})
})

module.exports = routes