'use strict'; // queryInterface.addColumn('Person', 'petName', {
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
  up: function up(queryInterface, Sequelize) {
    return regeneratorRuntime.async(function up$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _context.next = 2;
            return regeneratorRuntime.awrap(queryInterface.createTable('Users', {
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
            }));

          case 2:
          case "end":
            return _context.stop();
        }
      }
    });
  },
  down: function down(queryInterface, Sequelize) {
    return regeneratorRuntime.async(function down$(_context2) {
      while (1) {
        switch (_context2.prev = _context2.next) {
          case 0:
          case "end":
            return _context2.stop();
        }
      }
    });
  }
};