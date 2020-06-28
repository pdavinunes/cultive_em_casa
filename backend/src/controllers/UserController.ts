require('dotenv').config('.env');

import { Request, Response} from 'express';

import UserService from '../services/UserService';
import User from '../models/User';

const service = new UserService();

interface Resp {
    status: any
}
class UserController {

    async index(req: Request, res: Response) {
        const users = await service.index();
        return res.json(users);
    }

    async show(req: Request, res: Response) {
        const {id} = req.params;
        const user = await service.show(id);

        user.length === 0 ? 
            res.status(404).json({erro: `Nenhum usuário encontrado para o id: ${id}`})
            : res.json({user});
    }

    async store(req: Request, res: Response) {

        const {name, username, password, email} = req.body;
        const user = new User(name, email, username, password, req.file.filename);

        const resp = await service.store(user) as Resp;
        
        return res.status(resp.status).json({...resp});
    }
    
    async auth(req: Request, res: Response) {

    }
}

export default UserController;