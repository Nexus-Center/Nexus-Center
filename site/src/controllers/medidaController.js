var medidaModel = require("../models/medidaModel");

function carregarDadosPeriodo(req, res) {

    var fkEmpresa = req.params.fkEmpresa

    medidaModel.carregarDadosPeriodo(fkEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function carregarDadosGraficoBarras(req, res) {

    var fkEmpresa = req.params.fkEmpresa

    medidaModel.carregarDadosGraficoBarras(fkEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
   carregarDadosPeriodo,
   carregarDadosGraficoBarras
}