import knex from "../database/connection";
import fs from "fs";
import path from "path";
import moment from "moment-timezone";

class UserPlantService {
  async show(id: any) {
    let plants_per_user = await knex.raw(`SELECT 
                                    user_plants.id as pid,
                                    user_plants.*,
                                    plants.*,
                                    (EXTRACT(EPOCH FROM user_plants.last_fertilization) * 1000) + plants.fertilizion_frequency as next_fertilizon,
                                    (EXTRACT(EPOCH FROM user_plants.last_watering) * 1000) + plants.watering_frequency as next_watering,
                                    (EXTRACT(EPOCH FROM user_plants.last_pruning) * 1000) + plants.pruning_frequency as next_pruning
                                FROM 
                                    user_plants
                                INNER JOIN 
                                    plants ON user_plants.plant_id = plants.id
                                INNER JOIN 
                                    users ON user_plants.user_id = users.id
                                WHERE user_plants.user_id = ${id};`);

    if (!plants_per_user.rowCount) {
      return { status: 404, message: "Sem plantas para o usuário informado" };
    }
    plants_per_user = plants_per_user.rows.map((plant: any) =>
      this._addUrlInPlant(plant)
    );
    return { status: 200, plants_per_user };
  }

  async store(user_plant: any): Promise<object> {
    if (!user_plant.hasOwnProperty("last_watering")) {
      user_plant = { ...user_plant, last_watering: this.getEventDate() };
    }
    if (!user_plant.hasOwnProperty("last_pruning")) {
      user_plant = { ...user_plant, last_pruning: this.getEventDate() };
    }
    if (!user_plant.hasOwnProperty("last_fertilization")) {
      user_plant = { ...user_plant, last_fertilization: this.getEventDate() };
    }
    const trx = await knex.transaction();
    const insertedIds = await trx("user_plants")
      .insert(user_plant)
      .returning("id");
    await trx.commit();

    const storedUser = {
      status: 201,
      message: "Planta adicionado com sucesso",
      id: insertedIds[0],
      ...user_plant,
    };

    return storedUser;
  }

  async update(id: any, user_plant: any) {
    const trx = await knex.transaction();
    await trx("user_plants")
      .where({ id })
      .update({ ...user_plant });
    await trx.commit();
    return {
      status: 200,
      message: "Planta alterado com sucesso",
    };
  }

  async action(id: any, req: any) {
    const actionName = `last_${req.action}`;
    const trx = await knex.transaction();
    await trx("user_plants")
      .where({ id })
      .update({ [actionName]: this.getEventDate() });
    await trx.commit();
    return {
      status: 200,
      message: "Planta alterado com sucesso",
    };
  }

  async delete(id: any) {
    const plant = await knex("user_plants").select("image").first();
    fs.unlink(
      path.resolve(
        __dirname,
        "..",
        "..",
        "uploads",
        "plant_images",
        plant.image
      ),
      (_) => {}
    );
    const trx = await knex.transaction();
    await trx("user_plants").where({ id }).del();
    await trx.commit();
    return { status: 204 };
  }

  private _addUrlInPlant(user: any) {
    const imageUrl = `http://localhost:3333/uploads/plant_images/${user.image}`;
    const avatarUrl = `http://localhost:3333/uploads/avatar_plants/${user.avatar}`;
    return { ...user, imageUrl, avatarUrl };
  }

  getEventDate() {
    return moment.tz(Date.now(), "America/Fortaleza").format();
  }
}

export default UserPlantService;
