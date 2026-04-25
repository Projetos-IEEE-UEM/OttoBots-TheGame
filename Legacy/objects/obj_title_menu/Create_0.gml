global.level = 0;
global.escolha = 0;
/*if(file_exists("configuracao.txt")){
	var _save = file_text_open_read("configuracao.txt");
	global.escolha = file_text_read_real(_save);
	//file_text_close(_save);
}
else{	global.escolha = 0; }
*/
width = 640;
height = 1040;
options[0] = "Jogar";
options[1] = "configuracoes";
options[2] = "Sair para o windows";
op_max = array_length(options);
var index;
op_border = 80;
op_space = 160;
pos = 0;
opcao[0] = "dificuldade";
opcao[1] = "audio e tela";
opcao[2] = "controles";
opcao[3] = "voltar";
opcao_max = array_length(opcao);
controle = [ "usar WASD", "usar as setas(nao funciona)","voltar"];
controle_max = array_length(controle);


opcaoo[0] = "Marcha para perdicao";
opcaoo[1] = "fácil";
opcaoo[2] = "voltar";
opcaoo_max = array_length(opcaoo);

opcaooo[0] = "voltar";
opcaooo_max = array_length(opcaooo);
op_length = 0;
menu_nivel = 0;










