async function connect(){
    const {Pool} = require("pg");

    if(global.connection){
        return global.connection.connect();
    };

    const pool = new Pool({
        connectionString:process.env.CONNECTION_STRING
    });

    const client = await pool.connect();
    console.log("Criou o pool de conexão");

    const res = await client.query("Select now()");
    console.log(res.rows[0]);

    global.connection = pool;
    return pool.connect();
};

connect();