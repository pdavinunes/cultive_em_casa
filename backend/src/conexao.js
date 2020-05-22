const mysql = require('mysql')
const connection = mysql.createConnection({
  host     : 'localhost',
  port     : 3306,
  user     : 'root',
  password : '',
  database : 'cultive_em_casa'
})

connection.connect(function(err){
  if(err) return console.log(err);
})

module.exports = connection