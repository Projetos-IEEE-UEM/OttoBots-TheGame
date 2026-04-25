
options[0] = "Jogar";
options[1] = "Configurações";
options[2] = "Sair para o Windows";
op_max = array_length_1d(options); 

opcao[0] = "Áudio e Tela";
opcao[1] = "Controles";
opcao[2] = "Voltar";
opcao_max = array_length_1d(opcao);

controle = ["mapear","setas", "Voltar"];
controle_max = array_length_1d(controle);

opcaoo[0] = "não temos niveis ainda";
opcaoo[1] = "aperte voltar";
opcaoo[2] = "Voltar";
opcaoo_max = array_length_1d(opcaoo);


opcaooo[0] = "Voltar";
opcaooo_max = array_length_1d(opcaooo);

mapear[0] = "começar o mapeamento";
mapear[1] = "voltar";
mapear_max = array_length_1d(mapear);

global.index = 0;
menu_nivel = 0; 

global.esquerda = ord("A");
global.direita = ord("D");
global.baixo = ord("S");
global.pular = vk_space;