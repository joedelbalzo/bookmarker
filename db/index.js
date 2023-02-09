const pg = require('pg');
const client = new pg.Client(process.env.DATABASE_URL || 'postgress://localhost/bookmarker')

module.exports = client;