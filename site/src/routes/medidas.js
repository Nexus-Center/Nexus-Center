var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/carregarDadosPeriodo/:fkEmpresa", function (req, res) {
    medidaController.carregarDadosPeriodo(req, res);
})

module.exports = router;