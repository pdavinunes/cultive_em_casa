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
        let user = await knex('users').select('*').where({id});
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
            
            const storedUser = {status: 201, 
                                message: "Usuário adicionado com sucesso",
                                id: insertedIds[0],
                                ...user}; 
            
            return storedUser;
        } 

    }

    async auth(username: string, password: string) {
        const user = await this._findUserByUsername(username) as UserSchema;
        let response = {};
        
        if(!!user) {
            await bcrypt.compare(password, user.password).then((result: any) => {
                if(result) { 
                    response = {status: 200, message: "Usuário autorizado", user: {...user}}
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
            
            if(user.password) {
                return {status: 400, message: "Usuário não pode ser alterado"}; 
            }

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

    async updatePassword(id: any, password: any) {
        const checkUser = await this.show(id) as any;
        let response = {};
        if(checkUser.status === 404) {
            response = checkUser;
        } else {
            const updated_at = new Date();
            password = bcrypt.hashSync(password, 10);
            const trx = await knex.transaction();
            await trx('users')
                .where({id})
                .update({password, updated_at});
            await trx.commit(); 
            response = {status: 200, message: "Senha alterada com sucesso"};
        }
        return response;
    }

    async updateImage(id: any, image: any) {
        const checkUser = await this.show(id) as any;
        let response = {};
        if(checkUser.status === 404) {
            response = checkUser;
        } else {
            const updated_at = new Date();
            const trx = await knex.transaction();
            await trx('users')
                .where({id})
                .update({image, updated_at});
            await trx.commit(); 
            response = {status: 200, message: "Foto do perfil alterada com sucesso"};
        }
        return response;
    }

    private addUrlInUser(user: any) {
        const imageUrl = `http://localhost:3333/uploads/${user.image}`;
        return {...user, imageUrl}; 
    }

    private async _findUserByUsername(username: string) : Promise<object> {
        let user = await knex('users').select('*').where({username}).first();
        console.log(user);
        if(!!user) {
            user = this.addUrlInUser(user);
        } 
        return user;
    }
}

export default UserService;