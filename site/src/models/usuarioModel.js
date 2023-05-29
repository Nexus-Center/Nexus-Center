var database = require("../database/config");

function listar() {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()"
  );
  var instrucao = `
        SELECT * FROM usuario;
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function entrar(email, senha) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ",
    email,
    senha
  );
  var instrucao = `
        SELECT * FROM usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function exibirCodigo(codigoGerado) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ",
    codigoGerado
  );
  var instrucao = `
        SELECT idEmpresa FROM empresa WHERE idEmpresa = '${codigoGerado}';
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function kpiFuncionariosAtivos() {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function kpiFuncionariosAtivos(): "
  );
  var instrucao = `
        SELECT CAST(COUNT(*) AS UNSIGNED) AS qtdAtivos FROM metricamouse WHERE statusMouse = 'ativo';
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function kpiFuncionariosAusentes() {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function kpiFuncionariosAusentes(): "
  );
  var instrucao = `
        SELECT CAST(COUNT(*) AS UNSIGNED) AS qtdAusentes FROM metricamouse WHERE statusMouse = 'ausente';
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function kpiFuncionariosInativos() {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function kpiFuncionariosInativos(): "
  );
  var instrucao = `
        SELECT CAST(COUNT(*) AS UNSIGNED) AS qtdInativos FROM metricamouse WHERE statusMouse = 'inativo';
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function getIdUser(email) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function getIdUser(): ",
    email
  );
  var instrucao = `
        SELECT idUser FROM usuario WHERE email = '${email}';
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function cadastrar(nome, email, senha, codigo) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():",
    nome,
    email,
    senha,
    codigo
  );

  // A fkEmpresa equivale a variável "codigo"
  var instrucao = `
        INSERT INTO usuario (nome, email, senha, fkEmpresa) VALUES ('${nome}', '${email}', '${senha}', '${codigo}');
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function cadastrarEmpresa(razaoSocial, cnpj, email, telefone, codigoGerado) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrarEmpresa():",
    razaoSocial,
    cnpj,
    email,
    telefone,
    codigoGerado
  );

  // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
  //  e na ordem de inserção dos dados.
  var instrucao = `
        INSERT INTO empresa (idEmpresa, razaoSocial, cnpj, email, tel) VALUES ('${codigoGerado}','${razaoSocial}', '${cnpj}', '${email}', '${telefone}');
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function cadastrarMaquina(nomeUsuario, patrimonio, senha, fkEmpresa) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrarMaquina():",
    nomeUsuario,
    patrimonio,
    senha,
    fkEmpresa
  );

  var instrucao = `
        INSERT INTO Maquina (nomeDoUsuario, patrimonio, senha, fkEmpresa) VALUES ('${nomeUsuario}', '${patrimonio}', '${senha}', '${fkEmpresa}');
    `;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function buscarUltimosStatus(idEmpresa) {
  instrucaoSql = "";

  if (process.env.AMBIENTE_PROCESSO == "producao") {
    instrucaoSql = `select top ${limite_linhas}
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        momento,
                        FORMAT(momento, 'HH:mm:ss') as momento_grafico
                    from medida
                    where fk_aquario = ${idMaquina}
                    order by id desc`;
  } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
    // fazer alterações para puxar o desktop, status e usbConectado
    instrucaoSql = `SELECT nomeDoUsuario as nomeUsuario, patrimonio FROM Maquina WHERE fkEmpresa = ${idEmpresa};`;
  } else {
    console.log(
      "\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n"
    );
    return;
  }

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarStatusEmTempoReal(idEmpresa) {
  instrucaoSql = "";

  if (process.env.AMBIENTE_PROCESSO == "producao") {
    instrucaoSql = `select top 1
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,  
                        CONVERT(varchar, momento, 108) as momento_grafico, 
                        fk_aquario 
                        from medida where fk_aquario = ${idMaquina} 
                    order by id desc`;
  } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
    instrucaoSql = `SELECT nomeDoUsuario as nomeUsuario, patrimonio FROM Maquina WHERE fkEmpresa = ${idEmpresa};`;
  } else {
    console.log(
      "\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n"
    );
    return;
  }

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

// Puxando informações da máquina
function getListaMaquinas(fkEmpresa) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrarMaquina():"
  );

  var instrucao = `SELECT * FROM Maquina WHERE fkEmpresa = ${fkEmpresa}`;
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

// Deletar a máquina
function deletarMaquinas(idMaquina) {
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function deletarMaquina():"
  );

  // Para apagar da azure
   var instrucao = `EXEC deletarMaquina @p_idMaquina = ${idMaquina}`;

// Para deletar do mysql:
 // var instrucao = ` call deletarMaquina(${idMaquina})`;

  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}

function getInfoMaquina(fkMaquina){
  console.log(
    "ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function infoMaquinas():"
  );

  var instrucao = `SELECT * FROM InfoMaquina WHERE fkMaquina = ${fkMaquina}`
  console.log("Executando a instrução SQL: \n" + instrucao);
  return database.executar(instrucao);
}


module.exports = {
  entrar,
  exibirCodigo,
  cadastrar,
  cadastrarEmpresa,
  cadastrarMaquina,
  kpiFuncionariosAtivos,
  kpiFuncionariosAusentes,
  kpiFuncionariosInativos,
  getIdUser,
  listar,
  buscarStatusEmTempoReal,
  buscarUltimosStatus,
  getListaMaquinas,
  deletarMaquinas,
  getInfoMaquina
};
