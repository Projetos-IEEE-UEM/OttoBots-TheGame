//Aqui é onde desenharemos uma tela de pause bem simples:
var comprimentoTela = display_get_gui_width(); // Dado de comprimento de tela;
var alturaTela = display_get_gui_height(); //Dado de altura de tela;

if(global.pause){ //Se meu jogo estiver pausado:
	draw_set_color(c_black); //Desenhe em preto -
	draw_set_alpha(0.5); //- com 50% de transparência -
	draw_rectangle(0, 0, comprimentoTela, alturaTela, false); //- e desenhe um retângulo com estas caracteristicas;
	draw_set_alpha(1) //Retorna ao padrão;
	draw_set_color(c_white); //Retorna ao padrão;
	draw_set_halign(fa_center); //Alinha o texto ao centro na horizontal;
	draw_set_valign(fa_middle); //Alinha o texto ao centro na vertical;
	draw_text(comprimentoTela/2, alturaTela/2, "O Otto tambem precisa de descanso!") //Escreve um textinho 
	draw_set_halign(-1) //Retorna ao padrão.
	draw_set_valign(-1) //Retorna ao padrão.
}