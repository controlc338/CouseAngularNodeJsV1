const { Sequelize, DataTypes } = require('sequelize');

const sequelize = new Sequelize('db_example', 'postgres', '1234', {
  host: 'localhost',
  dialect: 'postgres',
  port:5434
});

module.exports = sequelize;