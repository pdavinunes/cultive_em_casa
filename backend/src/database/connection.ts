import knex from 'knex';
require('dotenv').config('.env');

const connection = knex({
    client: process.env.DB_CLIENT,
    version: process.env.DB_VERSION,
    connection: {
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASS,
        database: process.env.DB_NAME
    }
});

export default connection;