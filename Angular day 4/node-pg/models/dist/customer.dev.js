"use strict";

var _require = require('sequelize'),
    DataTypes = _require.DataTypes;

var configSeq = require('../sq-config');

var Customer = configSeq.define('customer', {
  name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  tel: {
    type: DataTypes.STRING,
    defaultValue: '0854613098',
    allowNull: true
  },
  address: {
    type: DataTypes.STRING,
    allowNull: true
  },
  tex: {
    type: DataTypes.STRING,
    allowNull: true
  }
}); //Customer.sync({alter: true})

module.exports = Customer;