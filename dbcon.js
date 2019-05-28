var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : '{your username}',
  password        : '{your password here}',
  database        : '{your username}'
});
module.exports.pool = pool;
