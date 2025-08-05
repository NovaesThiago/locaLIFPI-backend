const express = require("express");
const usuarioRoutes = require("./routes/usuario.routes");

const app = express();
app.use(express.json());

app.use("/api", usuarioRoutes);

app.listen(3000, () => console.log("Servidor rodando na porta 3000"));