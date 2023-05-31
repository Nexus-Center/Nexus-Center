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
        `select count(*) as quantidade, statusAlerta from AlertaDashboard as q join metrica as m on q.fkParametroAlerta = m.idMetrica
        where q.dataHora > now() - interval 24 hour and m.fkEmpresa = ${fkEmpresa} group by q.statusAlerta ORDER BY FIELD(statusAlerta, 'Ideal', 'Atencao', 'Alerta');`
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
