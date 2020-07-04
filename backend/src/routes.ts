import express from 'express';
import multer from 'multer';

import UserController from './controllers/UserController';
import multerConfigUser from './config/multerUser';

const routes = express.Router();
const upload = multer(multerConfigUser);

const userController = new UserController();

routes.get('/users', userController.index)
routes.get('/users/:id', userController.show)
routes.post('/users', upload.single('image'), userController.store)
routes.post('/auth', userController.auth)
routes.put('/users/:id', userController.update)
routes.put('/users/:id/password', userController.updatePassword)
routes.put('/users/:id/image', upload.single('image'), userController.updateImage)
routes.delete('/users/:id', userController.delete)


export default routes;