const id_maquina = localStorage.getItem("ID_MAQUINA");
const nomeUsuario = localStorage.getItem("NOME_USUARIO");
let maquina;


async function getInfoMaquina() {
  maquina = await (await fetch(`/usuarios/getInfoMaquina/${id_maquina}`)).json();
  console.log(maquina); // Certifique-se de que os dados foram obtidos corretamente
  if (maquina) {
    // Renderize os dados na página aqui
    infoHardware.innerHTML = `<h3>Inf. Hardware:</h3>
      <h1>Sistema Operacional: ${maquina[0].sistemaOperacional}</h1>
      <h1>Processador: ${maquina[0].nomeProcessador}</h1>
      <h1>Memória Ram: ${maquina[0].capacidadeRam} GB</h1>
      <h1>Capacidade Disco: ${maquina[0].capacidadeDisco} GB</h1>`;
    nomeDaMaquina.innerHTML = `<h1>${nomeUsuario}</h1>`;
  }
}

  getInfoMaquina();


//
function deleteMaquina() {
  const confirmeDelete = window.confirm(
    "Você realmente deseja deletar essa máquina?"
  );

  if (confirmeDelete) {
    fetch(`/usuarios/deletarMaquinas/${id_maquina}`, {
      method: "DELETE",
      headers: {
        "Content-type": "application/json",
      },
    }).then((resposta) => {
      console.log(maquina.idMaquina);
    });
    alert("Máquina Deletada!!");
    window.location = "maquinas.html";
  }
}






//   let listaMaquinas = JSON.parse(localStorage.getItem("novaMaquina"));
//   const confirmeDelete = window.confirm(
//     "Você realmente deseja deletar essa máquina?"
//   );

//   if (confirmeDelete) {
//     listaMaquinas.splice(index, 1);
//     alert("Máquina Deletada!!");
//     localStorage.setItem("novaMaquina", JSON.stringify(listaMaquinas));
//     window.location = "maquinas.html";
//   }
