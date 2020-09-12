const { Pool } = require('pg')
const types = require('pg').types

const pool = new Pool({
  host: 'localhost',
  user: 'postgres',
  password: '045433455',
  database: 'db_note',
  max: 50,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis:2000
})

var parseFn = function (val) {
  return val === null ? null : moment(val)
}
types.setTypeParser(types.builtins.TIMESTAMPTZ, parseFn)
types.setTypeParser(types.builtins.TIMESTAMP, parseFn)

types.setTypeParser(types.builtins.FLOAT8, (value) => {
  return parseFloat(value);
});
types.setTypeParser(types.builtins.NUMERIC, (value) => {
  return parseFloat(value);
});

types.setTypeParser(20, (val) => {
  return parseInt(val)
})

module.exports = pool