if inicializar == true{
	
var _x_sprite_l = sprite_get_xoffset(Spr_Cx_Dialogo)*4;
var _x_sprite_r = sprite_get_xoffset(Spr_Cx_Dialogo)*1.3;
var _y_sprite = sprite_get_yoffset(Spr_Cx_Dialogo)*5;


	
var _guil = display_get_gui_width();
var _guia = display_get_gui_height();
var _xx = 0;
var _yy = _guia - 150;
var _c = c_black;
var _sprite = texto_grid[# Infos.Retrato, pagina];
var _texto = string_copy(texto_grid[# Infos.Texto, pagina], 0, caractere);


var _x_caixa = (_guil/2) + 110
var _y_caixa = _yy - 40;

draw_set_font(fnt_dialogo);
draw_set_color(c_black);

//isso serve para alinha o texto à esquerda
//draw_set_halign(fa_left);

if texto_grid[# Infos.Lado, pagina] == 0{	//Caixa na Esquerda
	//Desenha a Caixa de Dialogo
	draw_sprite_ext(Spr_Cx_Dialogo, 0, _guil/2, _yy + 125, -2, 2, 0, c_white, 1);
	//Desenha o Texto do dialogo
	draw_text_ext(_x_sprite_l, _y_sprite, _texto, 32, 525);
	//Desenha o Nome do Personagem
	draw_text(_xx + 440, _yy + 65, texto_grid[# Infos.Nome, pagina]);
	//Desenha o Avatar do Personagem
	draw_sprite_ext(_sprite, 0, _xx + 435, _yy + 55, -2, 2, 0, c_white, 1);
}else{										//Caixa na Direita
	draw_sprite_ext(Spr_Cx_Dialogo, 0, _guil/2, _yy + 125, 2, 2, 0, c_white, 1);
	draw_text_ext(_x_sprite_r, _y_sprite, _texto, 32, 525);	
	draw_text(_guil - 400, _yy + 60, texto_grid[# Infos.Nome, pagina]);
	draw_sprite_ext(_sprite, 0, _guil - 390, _yy + 55, 2, 2, 0, c_white, 1);
	}
}