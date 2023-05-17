const maquinas = JSON.parse(localStorage.getItem("novaMaquina"));
console.log(maquinas)

document.addEventListener("DOMContentLoaded", () => {
    console.log(gridMaquinas)
    if (gridMaquinas) {
        for (let [index, maquina] of maquinas.entries()) {
            gridMaquinas.innerHTML += `
        <div class="maquina" onclick="getMaquina(${index})">
            <img src="../assets/dash/maquina.png" alt="">
            <h1> ${maquina.nome} </h1>
            <div class="circle" id="${maquina.status}"></div>
        </div>`
        }
    }
})



let maquina;
function getMaquina(index) {
    maquina = maquinas[index]
    localStorage.setItem("maquina", JSON.stringify(maquina))
    localStorage.setItem("index", index)
    window.location = "infoMaquina.html"
    console.log(maquina)
    
}
