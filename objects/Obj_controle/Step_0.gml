/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if instance_exists(Obj_dialogo){
	global.dialogo = true;
}

// Continuando sobre a parte das resoluções - para essa parte inicial de testes, vou simplesmente associar
// a alteração deste parâmetros com algumas teclas, para assim alternar entre modos e resoluções. Especi-
// -ficamente, vou estar adotando "m" e "n", já que não foram utilizados ainda.

if (keyboard_check_pressed(ord("M"))){ // Se o usuário pressionar a tecla M...
	telaCheia = !window_get_fullscreen(); // Inverta o estado da variável "teclaCheia"...
	window_set_fullscreen(telaCheia); // Aplique esta variável na função que faz o jogo entrar em tela
	// cheia.
}

if (keyboard_check_pressed(ord("N"))){ // Se o usuário preccionar a tecla N...
	resolucao++; // Incremente a variável resolucao uma vez...
	if (resolucao>6){ // Mas se a variável já estiver em seu máximo (neste caso, 6), retorne- a zero.
		resolucao = 0; // Retorna a variável resolucao para seu estado inicial.
	}
}

switch (resolucao){ // Altere a resolução de acordo com o que ovalor da variável.
	case 0:
		window_set_size(426,240);
		break;
	case 1:
		window_set_size(640,360);
		break;
	case 2:
		window_set_size(854, 480);
		break;
	case 3:
		window_set_size(1280,720);
		break;
	case 4:
		window_set_size(1920,2080);
		break;
	case 5:
		window_set_size(2560,1440);
		break;
	case 6:
		window_set_size(3840,2160);
		break;
}

// Provavelmente este sistema todo poderia ser feito de manea mais elegante se eu adotasse o algum 
// sistema que envolvesse vetores ou algo assim, multiplicando valores de 16 e 9 por números inteiros...