const index = localStorage.getItem("index");


document.addEventListener("DOMContentLoaded", () => {
  const maquinas = JSON.parse(localStorage.getItem("Maquinas"));
  const maquina = maquinas[index];
  console.log(maquina)
  if (infoHardware) {
    infoHardware.innerHTML = `<h3> Inf. Hardware:</h3>
        <h1>Sistema Operacional: ${maquina.sistemaOperacional}</h1>
        <h1> Processador: ${maquina.nomeProcessador}</h1>
        <h1> Memória Ram: ${maquina.capacidadeRam}</h1>
        <h1>Capacidade Disco: ${maquina.capacidadeDisco}</h1>`;
  nomeDaMaquina.innerHTML = `<h1> ${maquina.nomeDoUsuario}</h1>`
  }
});


function deleteMaquina() {
  let listaMaquinas = JSON.parse(localStorage.getItem("novaMaquina"));
  const confirmeDelete = window.confirm(
    "Você realmente deseja deletar essa máquina?"
  );

  if (confirmeDelete) {
    listaMaquinas.splice(index, 1);
    alert("Máquina Deletada!!");
    localStorage.setItem("novaMaquina", JSON.stringify(listaMaquinas));
    window.location = "maquinas.html";
  }
}
