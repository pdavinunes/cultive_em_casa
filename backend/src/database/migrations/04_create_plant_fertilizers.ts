import Knex from 'knex';

export async function up(knex: Knex) {
    return knex.schema.createTable('plant_fertilizers', table => {
        table.increments('id').primary();
        
        table.integer('plant_id')
            .notNullable()
            .references('id')
            .inTable('plants');
        
        table.integer('fertilizer_id')
            .notNullable()
            .references('id')
            .inTable('fertilizers');
    })
}

export async function down(knex: Knex) {
    return knex.schema.dropTable('plant_fertilizers')
}