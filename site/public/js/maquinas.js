let maquinas;
const fkEmpresaServer = sessionStorage.getItem("FKEMPRESA_USUARIO")
let cor = "verd"

function getMaquinas() {
  
  fetch(`/usuarios/getListaMaquinas/${fkEmpresaServer}`)
  .then((resposta) => {
    resposta.json().then((resposta) => {
        maquinas = resposta;

        console.log(maquinas);
    });
  });
}

getMaquinas();

document.addEventListener("DOMContentLoaded", () => {
  console.log(gridMaquinas);
  setTimeout(() => {

    for (let maquina of maquinas) {
      gridMaquinas.innerHTML += `
        <div class="maquina" onclick="getMaquina(${maquina.idMaquina}, '${maquina.nomeDoUsuario}')">
            <img src="../assets/dash/maquina.png" alt="">
            <h1> ${maquina.nomeDoUsuario} </h1>
            <div class="circle" id="${cor}"></div>
        </div>`;
    }
  }, 1600);
});




function getMaquina(id, nomeUsuario) {
  localStorage.setItem("ID_MAQUINA", id);
  localStorage.setItem("NOME_USUARIO", nomeUsuario);
  window.location = "infoMaquina.html";
}

