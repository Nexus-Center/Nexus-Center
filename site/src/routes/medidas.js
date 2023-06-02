var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/carregarDadosPeriodo/:fkEmpresa", function (req, res) {
    medidaController.carregarDadosPeriodo(req, res);
})

router.get("/carregarDadosGraficoBarras/:fkEmpresa", function (req, res) {
    medidaController.carregarDadosGraficoBarras(req, res);
})

module.exports = router;