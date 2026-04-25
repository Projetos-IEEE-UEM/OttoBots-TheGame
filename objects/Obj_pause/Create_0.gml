// O modo como fazemos a variável de pausa, atualmente, envolve esta variável global que, em todos os objetos, aciona ou não uma flag para que o código pare 
// de rodar. Não é a maneira mais eficiente, mas foi a que consegui pensar quando escrevi isto pela primeira vez. Pode ser interessante remodelarmos esse sistema
// no futuro, especialmente notando o quão complexo o jogo foi ficando a partir deste ponto... -Bruno
global.pause = false;