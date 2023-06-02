var database = require("../database/config");

function carregarDadosPeriodo(fkEmpresa) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `SELECT
        count(*) as quantidade from [dbo].[AlertaDashboard]
        as q join [dbo].[Metrica] as m 
        on q.fkParametroAlerta = m.idMetrica
        WHERE
        q.dataHora >= DATEADD(day, - 1, GETDATE())
             AND m.fkEmpresa = ${fkEmpresa} group by q.statusAlerta ORDER BY FIELD(statusAlerta, 'Ideal', 'Atencao', 'Alerta');`

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql =
            `select count(*) as quantidade, statusAlerta from alertaDashboard group by statusAlerta;`
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
        count(*) as quantidade from [dbo].[AlertaDashboard]
        as q join [dbo].[Metrica] as m 
        on q.fkParametroAlerta = m.idMetrica
        WHERE
        q.dataHora >= DATEADD(day, - 1, GETDATE())
             AND m.fkEmpresa = ${fkEmpresa} group by q.statusAlerta ORDER BY FIELD(statusAlerta, 'Ideal', 'Atencao', 'Alerta');`

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
