async function connect(){
  if(global.connection && global.connection.state !== 'disconnected')
      return global.connection;

  const mysql = require("mysql2/promise");
  const connection = await mysql.createConnection("mysql://root:Alucard931812@localhost:3306/mydb");
  console.log("Conectou no MySQL!");
  global.connection = connection;
  return connection;
}

async function selectUmaPeca(id){
  const conn = await connect();
  const sql = 'SELECT * FROM Possui WHERE FK_idPeca = ?;';
  const values = id;
  const [rows] = await conn.query(sql, values);
  return rows;
}


// module.exports = {selectCustomers}
module.exports = {selectUmaPeca}
