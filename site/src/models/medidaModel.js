var database = require("../database/config");

function carregarDadosPeriodo(fkEmpresa) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `SELECT COUNT(*) AS quantidade, statusAlerta
        FROM alertaDashboard
        WHERE dataHora >= DATEADD(DAY, -1, GETDATE())
        GROUP BY statusAlerta;`

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql =
            `select count(*) as quantidade, statusAlerta from alertaDashboard WHERE
            q.dataHora >= DATEADD(day, - 1, GETDATE())
            group by statusAlerta;`
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function carregarDadosGraficoBarras(fkEmpresa) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `SELECT 
            COUNT(*) AS quantidade,
            statusAlerta,
            tipoComponente
            FROM alertaDashboard
            JOIN componente ON fkComponente = idComponente
            GROUP BY tipoComponente, statusAlerta;`

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql =
            `SELECT 
            COUNT(*) AS quantidade,
            statusAlerta,
            tipoComponente
            FROM alertaDashboard
            JOIN componente ON fkComponente = idComponente
            GROUP BY tipoComponente, statusAlerta;`
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    carregarDadosPeriodo,
    carregarDadosGraficoBarras
}
