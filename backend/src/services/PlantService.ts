import knex from "../database/connection";

class PlantService {
  async index() {
    return await knex("plants").select("*");
  }

  async show(id: string) {
    return await knex("plants")
      .select("*")
      .where({ id })
      .first()
      .then(this._fertilizersPerPlant)
      .then(this._environmentsPerPlant)
      .catch((err: any) => this._handleWithError(err, id));
  }

  async _fertilizersPerPlant(plant: any) {
    const _fertilizersPerPlant = await knex("fertilizers")
      .innerJoin(
        "plant_fertilizers",
        "fertilizers.id",
        "plant_fertilizers.fertilizer_id"
      )
      .where("plant_fertilizers.plant_id", plant.id)
      .select("fertilizers.name");

    return {
      ...plant,
      fertilizers: _fertilizersPerPlant,
    };
  }

  async _environmentsPerPlant(plant: any) {
    const _environmentsPerPlant = await knex("environments")
      .innerJoin(
        "plant_environments",
        "environments.id",
        "plant_environments.environment_id"
      )
      .where("plant_environments.plant_id", plant.id)
      .select("environments.name");

    return {
      status: 200,
      ...plant,
      environments: _environmentsPerPlant,
    };
  }

  async _handleWithError(err: any, id: string) {
    return {
      status: 404,
      message: `Planta não encontrada para o id informado: ${id}`,
    };
  }
}

export default PlantService;
