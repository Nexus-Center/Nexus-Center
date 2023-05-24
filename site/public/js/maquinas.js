let maquinas;
const fkEmpresaServer = sessionStorage.getItem("FKEMPRESA_USUARIO")

function getMaquinas() {
  fetch(`/usuarios/getListaMaquinas/${fkEmpresaServer}`, {
    headers: {
      "Content-type": "application/json",
    },
  }).then((resposta) => {
    resposta.json().then((resposta) => {
        maquinas = resposta;

        console.log(maquinas);
       
        localStorage.setItem("Maquinas", JSON.stringify(resposta));
    });
  });
}

getMaquinas();

setInterval(() => {
  getMaquinas();
}, 5000);

document.addEventListener("DOMContentLoaded", () => {
  console.log(gridMaquinas);
  setTimeout(() => {
    for (let [index, maquina] of maquinas.entries()) {
      gridMaquinas.innerHTML += `
        <div class="maquina" onclick="getMaquina(${index})">
            <img src="../assets/dash/maquina.png" alt="">
            <h1> ${maquina.nomeDoUsuario} </h1>
            <div class="circle" id="verd"></div>
        </div>`;
    }
  }, 200);
});

function getMaquina(index) {
  let maquina = maquinas[index];
  localStorage.setItem("maquina", JSON.stringify(maquina));
  localStorage.setItem("index", index);
  window.location = "infoMaquina.html";
  console.log(maquina);
}
