var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/", function (req, res) {
    usuarioController.testar(req, res);
});

router.get("/listar", function (req, res) {
    usuarioController.listar(req, res);
});

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

// Cadastrando empresa
router.post("/cadastrarEmpresa", function (req, res) {
    usuarioController.cadastrarEmpresa(req, res);
})

// Cadastrando máquina
router.post("/cadastrarMaquina", function (req, res) {
    usuarioController.cadastrarMaquina(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.entrar(req, res);
});

router.get("/exibirCodigo/:codigoEmpresa", function (req, res) {
    usuarioController.exibirCodigo(req, res);
});

/*
router.get("/kpiFuncionariosAtivos", function (req, res) {
    usuarioController.kpiFuncionariosAtivos(req, res);
});

router.get("/kpiFuncionariosAusentes", function (req, res) {
    usuarioController.kpiFuncionariosAusentes(req, res);
});

router.get("/kpiFuncionariosInativos", function (req, res) {
    usuarioController.kpiFuncionariosInativos(req, res);
}); */

router.get("/getIdUser/:email", function (req, res) {
    usuarioController.getIdUser(req, res);
});

router.get("/numero-funcionarios/:idEmpresa", function (req, res) {
    usuarioController.obterNumeroFuncionarios(req, res);
});

router.get("/obter-dados/:numeroFuncionarios", function (req, res) {
    usuarioController.buscarStatusEmTempoReal(req, res);
});

/*
router.get("/obterDadosGrafico/:idMaquina", function (req, res) {
    usuarioController.obterDadosGrafico(req, res);
}); */

// listar maquinas
router.get("/getListaMaquinas/:fkEmpresa", function (req, res){
    usuarioController.getListaMaquinas(req, res);
});
// Deletar as máquinas
router.delete("/deletarMaquinas/:idMaquina", function(req, res){
    usuarioController.deletarMaquinas(req, res)
})

// Puxar info máquina
router.get("/getInfoMaquina/:fkMaquina", function(req, res){
    usuarioController.getInfoMaquina(req, res)
})

module.exports = router;