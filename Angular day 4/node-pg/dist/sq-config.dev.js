"use strict";

var _require = require('sequelize'),
    Sequelize = _require.Sequelize,
    DataTypes = _require.DataTypes;

var sequelize = new Sequelize('db_example', 'postgres', '1234', {
  host: 'localhost',
  dialect: 'postgres'
});
module.exports = sequelize;