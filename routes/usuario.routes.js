const express = require("express");
const bcrypt = require("bcrypt");
const prisma = require("../prisma/client"); // importa o Prisma já instanciado

const router = express.Router();

router.post("/login", async (req, res) => {
  const { matricula, email, senha } = req.body;

  try {
    const usuario = await prisma.usuario.findFirst({ where: { matricula, email } });
    if (!usuario) return res.status(404).json({ sucesso: false, mensagem: "Usuário não encontrado." });

    const senhaValida = await bcrypt.compare(senha, usuario.senha);
    if (!senhaValida) return res.status(401).json({ sucesso: false, mensagem: "Senha incorreta." });

    return res.json({ sucesso: true, mensagem: "Login realizado com sucesso." });
  } catch (error) {
    res.status(500).json({ sucesso: false, mensagem: "Erro interno." });
  }
});

router.post("/registro", async (req, res) => {
  const { matricula, email, senha } = req.body;

  try {
    const senhaCriptografada = await bcrypt.hash(senha, 10);
    await prisma.usuario.create({ data: { matricula, email, senha: senhaCriptografada } });

    return res.status(201).json({ sucesso: true, mensagem: "Usuário cadastrado com sucesso." });
  } catch (error) {
    res.status(500).json({ sucesso: false, mensagem: "Erro ao cadastrar." });
  }
});

module.exports = router;