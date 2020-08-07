var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : process.env.DATABASE_HOST,
  user     : 'root',
  password : process.env.DATABASE_PASSWORD,
  database : process.env.DATABASE_NAME
});

connection.connect();

connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
  if (error) throw error;
  console.log('The solution is: ', results[0].solution);
});

connection.end();
