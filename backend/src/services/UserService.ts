import {Response} from 'express';
import knex from '../database/connection';
import User from '../models/User';

class UserService {
    async index() {
        return await knex('users').select('*');
    }

    async show(id: any) {
        return await knex('users').select('*').where('id','=', id);
    }

    async store(user: User) : Promise<object> {
        if(await this._checkIfUsernameNotExists(user.username)) {
            const trx = await knex.transaction();
            
            const insertedIds = await trx('users')
            .insert(user)
            .returning('id');
            
            await trx.commit();
            
            const storedUser = {status: 201, id: insertedIds[0],...user}; 
            
            return storedUser;
        } else {
            return {status: 401, erro: "Usuario já existe"};
        } 

    }

    private async _checkIfUsernameNotExists(username: string) : Promise<boolean> {
        const user = await knex('users').select('*').where('username','=',username);
        return user.length === 0;
    }
}

export default UserService;