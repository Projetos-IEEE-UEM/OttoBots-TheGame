/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
global.dialogo = false;
global.resenha = false;

// Aqui é onde vou criar meu sistema de controle de resolução e modo de exibição. Vamos começar declarando
// as variáveis que usarei, isto é, qual resolução o jogo rodará e se será em tela cheia ou não -Bruno;

telaCheia = false // Basicamente, verifica se o jogo está ou não em tela cheia e
// salva este estado em uma variável. Será utilizada no estágio "ETAPA" deste mesmo objeto.
resolucao = 0; // Uma variável que será utilizada num switch case para escolher qual resolução o jogo
// deve rodar. Novamente, verifique o estágio "ETAPA" deste objeto para mais detalhes...