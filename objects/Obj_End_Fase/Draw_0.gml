// Isto aqui é apenas para indicar ao jogador que algo pode ser feito próximo a este objeto... -Bruno
draw_self(); // Define se a porta/portal deve ou não aparecer ao jogador;
if distance_to_object(Obj_player) < 10 { // Caso o jogador esteja perto do objeto...
	draw_set_font(fnt_dialogo) // Defina a fonte de texto para esta...
	draw_text_ext_transformed(Obj_player.x, Obj_player.y - 60, "Aperte E para sair", 5, 999, 0.4, 0.4, 0); // e escreva este texto com estas especificações;
}

//Comando para saber o tamanho do texto: string_width();