const { DataTypes } = require('sequelize')
const configSeq = require('../sq-config')

const Customer = configSeq.define('customer', {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  tel: {
    type: DataTypes.STRING,
    defaultValue: '0854613098',
    allowNull: true,
  },
  address: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  tex: {
      type: DataTypes.STRING,
      allowNull: true,
  }
})
//Customer.sync({alter: true})

module.exports = Customer