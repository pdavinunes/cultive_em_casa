import Knex from "knex";

export async function up(knex: Knex) {
  return knex.schema.createTable("user_plants", (table) => {
    table.increments("id").primary();
    table.string("name").notNullable();
    table.string("image").notNullable();
    table.string("avatar").notNullable();
    table.float("latitude", 14, 10).notNullable();
    table.float("longitude", 14, 10).notNullable();
    table.timestamp("last_watering").nullable();
    table.timestamp("last_pruning").nullable();
    table.timestamp("last_fertilization").nullable();
    table.timestamp("created_at").defaultTo(knex.fn.now());
    table.integer("plant_id").notNullable().references("id").inTable("plants");

    table.integer("user_id").notNullable().references("id").inTable("users");
  });
}

export async function down(knex: Knex) {
  return knex.schema.dropTable("user_plants");
}
