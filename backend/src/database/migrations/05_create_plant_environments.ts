import Knex from 'knex';

export async function up(knex: Knex) {
    return knex.schema.createTable('plant_environments', table => {
        table.increments('id').primary();
        
        table.integer('plant_id')
            .notNullable()
            .references('id')
            .inTable('plants');
        
        table.integer('environment_id')
            .notNullable()
            .references('id')
            .inTable('environments');
    })
}

export async function down(knex: Knex) {
    return knex.schema.dropTable('plant_environments')
}