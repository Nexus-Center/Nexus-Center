document.addEventListener("DOMContentLoaded", () => {
  const maquinaLocal = JSON.parse(localStorage.getItem("maquina"));
  if (infoHardware) {
    infoHardware.innerHTML = `<h3> Inf. Hardware:</h3>
        <h1>Sistema Operacional: ${maquinaLocal.so}</h1>
        <h1> Processador: ${maquinaLocal.processador}</h1>
        <h1> Memória Ram: ${maquinaLocal.ram}</h1>
        <h1>Capacidade Disco: ${maquinaLocal.disco}</h1>`;
  }
});

function deleteMaquina() {
  const index = localStorage.getItem("index");
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
