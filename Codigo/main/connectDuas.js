async function connect(){
    if(global.connection && global.connection.state !== 'disconnected')
        return global.connection;
  
    const mysql = require("mysql2/promise");
    const connection = await mysql.createConnection("mysql://beb38fe1670c6f:8128bfa4@us-cdbr-east-02.cleardb.com/heroku_c2dfb677c56f025?reconnect=true");
    console.log("Conectou no MySQL!");
    global.connection = connection;
    return connection;
  }
  // beb38fe1670c6f
  // 8128bfa4@
  // us-cdbr-east-02.cleardb.com
  // heroku_c2dfb677c56f025
  // mysql --host=us-cdbr-east-02.cleardb.com --user=beb38fe1670c6f --password=8128bfa4 --reconnect heroku_c2dfb677c56f025

async function selectDuasPecas(id1, id2){
    const conn = await connect();
    const sql = 'SELECT * FROM Possui WHERE FK_idPeca = ?;';
    const values = [id1, id2];
    const [rows] = await conn.query(sql, values[0]);
    const [rows2]  = await conn.query(sql, values[1]);
    var array = [rows, rows2];
    // console.log(array);
    return array;
  }


module.exports = {selectDuasPecas}
