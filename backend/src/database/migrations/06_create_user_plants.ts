import Knex from "knex";

export async function up(knex: Knex) {
  return knex.schema.createTable("user_plants", (table) => {
    table.increments("id").primary();
    table.string("image").notNullable();
    table.string("avatar").notNullable();
    table.decimal("latitude").notNullable();
    table.decimal("longitude").notNullable();
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
