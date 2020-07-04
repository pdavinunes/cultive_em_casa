import Knex from 'knex';

export async function up(knex: Knex) {
    return knex.schema.createTable('plant_actions', table => {
        table.increments('id').primary();
        table.enu('action',['WATERING', 'PRUNING', 'FERTILIZION']).notNullable();  
        table.timestamp('created_at').defaultTo(knex.fn.now());
        table.integer('user_plant_id')
            .notNullable()
            .references('id')
            .inTable('user_plants');
    })
}

export async function down(knex: Knex) {
    return knex.schema.dropTable('user_plants')
}