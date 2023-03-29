// ##################### Nav Bar responsiva ##########################
// Listener com arrow function aplicado a duas classes, ".hamburguer" 
// & ".menu" nos quais o evento click irá resultar em fechamento da 
// barra lateral.
// aplicado por Vitor
document.querySelector(".hamburger").addEventListener("click", () =>
    document.querySelector(".container").classList.toggle("show-menu")
);

// testando com outro seletor atualizado por Rafael
document.querySelector(".menu").addEventListener("click", () =>
    document.querySelector(".container").classList.toggle("show-menu")
);