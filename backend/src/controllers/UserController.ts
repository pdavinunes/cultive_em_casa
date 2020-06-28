require('dotenv').config('.env');

import { Request, Response, request } from 'express';
import knex from '../database/connection';

import User from '../models/User';

class UserController {
    async index(req: Request, res: Response) {
        const users = await knex('users').select('*');
        return res.json(users);
    }

    async show(req: Request, res: Response) {
        const {id} = req.params;
        const user = await knex('users').select('*').where('id','=', id );
        res.json({user});

    }

    async store(req: Request, res: Response) {

        const {name, username, password, email} = req.body;
        const user = new User(name, email, username, password, req.file.filename);

        const trx = await knex.transaction();

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