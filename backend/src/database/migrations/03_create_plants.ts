import Knex from 'knex';

export async function up(knex: Knex) {
    return knex.schema.createTable('plants', table => {
        table.increments('id').primary();
        table.string('popular_name').notNullable();
        table.string('scientific_name').notNullable();
        table.enu('lightness', ['SOL_PLENO', 'SOMBRA', 'MEIA_SOMBRA']).notNullable();
        table.bigInteger('watering_frequency').notNullable();
        table.string('amount_water').notNullable();
        table.bigInteger('fertilizion_frequency').notNullable();
        table.bigInteger('pruning_frequency').notNullable();
        table.string('description').nullable();
        table.timestamp('created_at').defaultTo(knex.fn.now());
        table.timestamp('updated_at').defaultTo(knex.fn.now());
    })
}

export async function down(knex: Knex) {
    return knex.schema.dropTable('plants')
}

