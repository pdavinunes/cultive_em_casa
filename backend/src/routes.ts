import express from 'express';
import multer from 'multer';

import UserController from './controllers/UserController';
import multerConfig from './config/multer';

const routes = express.Router();
const upload = multer(multerConfig);

const userController = new UserController();

routes.get('/users', userController.index)
routes.get('/users/:id', userController.show)
routes.post('/users', upload.single('image'), userController.store)
routes.post('/auth', userController.auth)
routes.put('/users/:id', userController.update)
routes.put('/users/:id/password', userController.updatePassword)


export default routes;