var database = require("../database/config");

function carregarDadosPeriodo(fkEmpresa) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select * from metrica
        where dataHora > now() - interval 24 hour;`

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = 
        `select count(*) as quantidade from AlertaDashboard as q join metrica as m on q.fkParametroAlerta = m.idMetrica
        where q.dataHora > now() - interval 24 hour and m.fkEmpresa = ${fkEmpresa} group by q.statusAlerta ;`
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    carregarDadosPeriodo
}
