async function connect(){
    if(global.connection && global.connection.state !== 'disconnected')
        return global.connection;
  
    const mysql = require("mysql2/promise");
    const connection = await mysql.createConnection("mysql://root:Alucard931812@localhost:3306/mydb");
    console.log("Conectou no MySQL!");
    global.connection = connection;
    return connection;
  }

async function selectNomeDuasPecas(id1, id2){
    const conn = await connect();
    const sql = 'SELECT * FROM pecas WHERE idpecas = ?;';
    const values = [id1, id2];
    const [rows] = await conn.query(sql, values[0]);
    const [rows2]  = await conn.query(sql, values[1]);
    var array = [rows, rows2];
    // console.log(array);
    return array;
  }

module.exports = {selectNomeDuasPecas}
