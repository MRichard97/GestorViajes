import sql from 'mssql/msnodesqlv8';
import config from "../config/config";

const dbConfig = {
    database: config.DB_NAME,
    server: config.DB_HOST,
    driver: 'msnodesqlv8',
    options: {
        trustedConnection: true
    }
};

const exec = async (procedureName, params) => {
  try {
    const conn = new sql.ConnectionPool(dbConfig);
    
    await conn.connect();

    const request = conn.request();

    if (params) {
      Object.keys(params).forEach(key => {
        request.input(key, params[key]);
      });
    }

    const result = await request.execute(procedureName);

    await conn.close();

    return result.recordset;
  } catch (err) {
    throw new Error(`Error al ejecutar el procedimiento almacenado '${procedureName}': ${err.message}`);
  }
};
  
export default exec;

