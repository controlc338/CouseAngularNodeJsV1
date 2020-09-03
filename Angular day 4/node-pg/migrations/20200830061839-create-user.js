'use strict';

// queryInterface.addColumn('Person', 'petName', {
//   type: DataTypes.STRING
// });

// queryInterface.changeColumn('Person', 'foo', {
//   type: DataTypes.FLOAT,
//   defaultValue: 3.14,
//   allowNull: false
// });

// queryInterface.removeColumn('Person', 'petName', {
//   /* query options */ });

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      firstName: {
        type: Sequelize.STRING
      },
      lastName: {
        type: Sequelize.STRING
      },
      email: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    //await queryInterface.dropTable('Users');
  }
};