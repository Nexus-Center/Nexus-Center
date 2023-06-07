var usuarioModel = require("../models/usuarioModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA usuarioController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
    usuarioModel.listar()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function entrar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {
        
        usuarioModel.entrar(email, senha)
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                    if (resultado.length == 1) {
                        console.log(resultado);
                        res.json(resultado[0]);
                    } else if (resultado.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function exibirCodigo(req, res) {
    var idEmpresa = req.params.codigoEmpresa

    usuarioModel.exibirCodigo(idEmpresa).then(function (resultado) {
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

/*
function kpiFuncionariosAtivos(req, res) {

    usuarioModel.kpiFuncionariosAtivos().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar a KPI.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

}

function kpiFuncionariosAusentes(req, res) {

    usuarioModel.kpiFuncionariosAusentes().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar a KPI.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

}

function kpiFuncionariosInativos(req, res) {

    usuarioModel.kpiFuncionariosInativos().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar a KPI.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

}*/


function redefinirSenha(req, res) {
  var email = req.body.email;
    var senha = req.body.senha;

    usuarioModel.redefinirSenha(email, senha)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var codigo = req.body.codigoServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if (codigo == undefined) {
        res.status(400).send("Seu código de empresa está undefined!");
    }else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, senha, codigo)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function cadastrarEmpresa(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var razaoSocial = req.body.razaoSocialServer;
    var cnpj = req.body.cnpjServer;
    var email = req.body.emailServer;
    var telefone = req.body.telServer;
    var codigoGerado = req.body.codigoGeradoServer;

    // Faça as validações dos valores
    if (razaoSocial == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (cnpj == undefined) {
        res.status(400).send("Seu CNPJ está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Sua email está undefined!");
    } else if (telefone == undefined) {
        res.status(400).send("Seu telefone está undefined!");
    } else if (codigoGerado == undefined) {
        res.status(400).send("Seu código está undefined!");
    }else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarEmpresa(razaoSocial, cnpj, email, telefone, codigoGerado)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function cadastrarMaquina(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nomeUsuario = req.body.nomeUsuarioServer;
    var patrimonio = req.body.patrimonioServer;
    var senha = req.body.senhaServer;
    var fkEmpresa = req.body.fkEmpresaServer;

    // Faça as validações dos valores
    if (nomeUsuario == undefined) {
        res.status(400).send("Seu nome de usuário está undefined!");
    } else if (patrimonio == undefined) {
        res.status(400).send("Seu patrimonio está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if (fkEmpresa == undefined) {
        res.status(400).send("Sua fkEmpresa está undefined!");
    }else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarMaquina(nomeUsuario, patrimonio, senha, fkEmpresa)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro da máquina! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

var idEmpresa = "";

function obterNumeroFuncionarios(req, res) {

    idEmpresa = req.params.idEmpresa;

    console.log(`Recuperando as ultimos status`);

    usuarioModel.obterNumeroFuncionarios(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os ultimos status.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
     });
 }
 function obterDados(req, res) {

    var empresa = req.params.fkEmpresa;

    console.log(`Recuperando status em tempo real`);

    usuarioModel.obterDados(empresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os ultimos status.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
};

/*
function obterDadosGrafico(req, res) {
    
    console.log(`Recuperando status em tempo real`);

    var idMaquina = req.params.idMaquina;
    
    usuarioModel.obterDadosGrafico(idEmpresa, idMaquina).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os ultimos status.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}
*/

function getListaMaquinas(req, res) {
    const fkEmpresa = req.params.fkEmpresa;

    console.log(fkEmpresa, ">>>>>>>>>>>>>")
    console.log("acessei o getListaMaquinas!!!")

    usuarioModel.getListaMaquinas(fkEmpresa)
    .then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as máquinas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

}

function deletarMaquinas(req, res){
    const idMaquina = req.params.idMaquina;

    console.log(idMaquina, ">>>>>>>>>>>>>")
    console.log("acessei o delete máquinas!!!")

    usuarioModel.deletarMaquinas(idMaquina)
    .then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao deletar as máquinas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

}

function getInfoMaquina(req, res) {
    const fkMaquina = req.params.fkMaquina;

    console.log(fkMaquina, ">>>>>>>>>>>>>")
    console.log("acessei o getInfoMaquina!!!")

    usuarioModel.getInfoMaquina(fkMaquina)
    .then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as informações da máquina.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function getPorcentagemUso(req, res) {
    const fkMaquina = req.params.fkMaquina;

    console.log(fkMaquina, ">>>>>>>>>>>>>")
    console.log("acessei o getPorcentagemUso!!!")

    usuarioModel.getPorcentagemUso(fkMaquina)
    .then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as informações de porcentagem de uso.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


module.exports = {
    entrar,
    cadastrar,
    exibirCodigo,
    cadastrarEmpresa,
    cadastrarMaquina,
    // kpiFuncionariosAtivos,
    // kpiFuncionariosAusentes,
    // kpiFuncionariosInativos,
    redefinirSenha,
    listar,
    testar,
    obterNumeroFuncionarios,
    obterDados,
    // obterDadosGrafico,
    getListaMaquinas,
    deletarMaquinas,
    getInfoMaquina,
    getPorcentagemUso
}