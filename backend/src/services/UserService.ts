import knex from "../database/connection";
import User from "../models/User";
import fs from "fs";
import path from "path";
const bcrypt = require("bcrypt");

interface UserSchema {
  password: string;
  image: string;
}

class UserService {
  async index() {
    let users = await knex("users").select("*");
    users = users.map((user) => this._addUrlInUser(user));
    return users;
  }

  async show(id: any) {
    let user = await knex("users").select("*").where({ id });
    if (!!user[0]) {
      user = this._addUrlInUser(user[0]);
      return { status: 200, message: { ...user } };
    } else {
      return {
        status: 404,
        message: `Nenhum usuário encontrado para o id: ${id}`,
      };
    }
  }

  async store(user: User): Promise<object> {
    const checkUser = await this._findUserByUsername(user.username);
    if (!!checkUser) {
      return { status: 401, erro: "Usuario já existe" };
    } else {
      const trx = await knex.transaction();

      const insertedIds = await trx("users").insert(user).returning("id");

      await trx.commit();

      const storedUser = {
        status: 201,
        message: "Usuário adicionado com sucesso",
        id: insertedIds[0],
        ...user,
      };

      return storedUser;
    }
  }

  async auth(username: string, password: string): Promise<any> {
    const userPromise = this._findUserByUsername(username);

    return await userPromise.then(async (user: any) => {
      if (!!user) {
        return await bcrypt
          .compare(password, user.password)
          .then((result: any) => {
            return result
              ? {
                  status: 200,
                  message: "Usuário autorizado",
                  user: { ...user },
                }
              : { status: 401, message: "Senha incorreta" };
          });
      } else {
        return { status: 404, message: "Usuário não existe" };
      }
    });
  }

  async update(id: any, user: any) {
    const checkUser = (await this.show(id)) as any;
    if (checkUser.status === 404) {
      return checkUser;
    } else {
      if (user.password || user.image) {
        return { status: 400, message: "Usuário não pode ser alterado" };
      }

      const updated_at = new Date();
      const trx = await knex.transaction();
      const newUser = await trx("users")
        .where({ id })
        .update({ ...user, updated_at }, ["*"]);
      await trx.commit();
      return {
        status: 200,
        message: "Usuário alterado com sucesso",
        user: newUser,
      };
    }
  }

  async updatePassword(id: any, password: any) {
    const checkUser = (await this.show(id)) as any;
    if (checkUser.status === 404) {
      return checkUser;
    } else {
      const updated_at = new Date();
      password = bcrypt.hashSync(password, 10);
      const trx = await knex.transaction();
      await trx("users").where({ id }).update({ password, updated_at });
      await trx.commit();
      return { status: 200, message: "Senha alterada com sucesso" };
    }
  }

  async updateImage(id: any, image: any) {
    const checkUser = (await this.show(id)) as any;
    if (checkUser.status === 404) {
      return checkUser;
    } else {
      const updated_at = new Date();
      const trx = await knex.transaction();
      await trx("users").where({ id }).update({ image, updated_at });
      await trx.commit();
      return { status: 200, message: "Foto do perfil alterada com sucesso" };
    }
  }

  async delete(id: any) {
    const checkUser = (await this.show(id)) as any;
    if (checkUser.status === 404) {
      return checkUser;
    } else {
      const user = { ...checkUser.message } as any;
      fs.unlink(
        path.resolve(__dirname, "..", "..", "uploads", user.image),
        (_) => {}
      );
      const trx = await knex.transaction();
      await trx("users").where({ id }).del();
      await trx.commit();
    }
    return { status: 200, message: "Usuário deletado com sucesso!" };
  }

  private _addUrlInUser(user: any) {
    const imageUrl = `http://localhost:3333/uploads/user_images/${user.image}`;
    return { ...user, imageUrl };
  }

  private async _findUserByUsername(username: string): Promise<object> {
    let user = await knex("users").select("*").where({ username }).first();
    return !!user ? (user = this._addUrlInUser(user)) : user;
  }
}

export default UserService;
