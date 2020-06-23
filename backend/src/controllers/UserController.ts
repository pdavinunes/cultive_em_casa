import { Request, Response, request } from 'express';
import knex from '../database/connection';
require('dotenv').config('.env');

class UserController {
    async index(req: Request, res: Response) {
        const users = await knex('users').select('*');
        return res.json(users);
    }

    async store(req: Request, res: Response) {
        const {
            name,
            email,
            username,
            password
        } = req.body;

        const trx = await knex.transaction();

        const user = {
            image: req.file.filename,
            name,
            email,
            username,
            password
        }

        const insertedIds = await trx('users')
                                    .insert(user)
                                    .returning('id');
        
        await trx.commit();

        return res.json({
            id: insertedIds[0],
            ...user
        });
    }
    
}

export default UserController;