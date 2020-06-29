import {Response} from 'express';
import knex from '../database/connection';
import User from '../models/User';
const bcrypt = require('bcrypt');

interface UserSchema {
    password: string,
    image: string,
}

class UserService {
    async index() {
        let users = await knex('users').select('*');
        users = users.map((user) => this.addUrlInUser(user)); 
        return users;
    }

    async show(id: any) {
        let user = await knex('users').select('*').where('id','=', id);
        let response = {}; 
        if(!!user[0]) {
            user = this.addUrlInUser(user[0]);
            response = {status: 200, message: {...user}};
        } else {
            response = {status: 404, message: `Nenhum usuário encontrado para o id: ${id}`};
        }
        
        return response; 
    }

    async store(user: User) : Promise<object> {
        const checkUser = await this._findUserByUsername(user.username); 
        if(!!checkUser) {
            return {status: 401, erro: "Usuario já existe"};    
        } else {
            const trx = await knex.transaction();
            
            const insertedIds = await trx('users')
                .insert(user)
                .returning('id');
            
            await trx.commit();
            
            const storedUser = {status: 201, message: "Usuário adicionado com sucesso",id: insertedIds[0],...user}; 
            
            return storedUser;
        } 

    }

    private async _findUserByUsername(username: string) : Promise<object> {
        let user = await knex('users').select('*').where('username','=',username).first();
        user = this.addUrlInUser(user);
        return user;
    }

    async auth(username: string, password: string) {
        const user = await this._findUserByUsername(username) as UserSchema;
        let response = {};
        
        if(!!user) {
            await bcrypt.compare(password, user.password).then((result: any) => {
                if(result) { 
                    response = {status: 200, message: "Pode passar meu chapa", ...user}
                } else{
                    response = {status: 401, message: "Senha incorreta"}
                }
            });
        } else {
            response = {status: 404, message: "Usuário não existe"};
        }

        return response;
    }

    async update(id: any, user: any){
        const checkUser = await this.show(id) as any;
        let response = {};
        if(checkUser.status === 404) {
            response = checkUser;
        } else {
            const updated_at = new Date();
            const trx = await knex.transaction();
            const newUser = await trx('users')
                .where({id})
                .update({...user, updated_at}, ["*"]);
            await trx.commit(); 
            response = {status: 200, message: "Usuário alterado com sucesso", user: newUser};
        }
        return response;
    }

    private addUrlInUser(user: any) {
        const imageUrl = `http://localhost:3333/uploads/${user.image}`;
        return {...user, imageUrl}; 
    }
}

export default UserService;