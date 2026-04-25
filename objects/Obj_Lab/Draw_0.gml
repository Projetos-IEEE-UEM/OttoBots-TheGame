/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Ajuste esse valor para controlar a velocidade do movimento do texto em direção ao jogador

if distance_to_object(Obj_player) < 30 {
	draw_set_font(fnt_dialogo)
	draw_text_ext_transformed(Obj_player.x, Obj_player.y - 60, "Aperte E para entrar no Laboratório", 5, 999, 0.4, 0.4, 0);
}



