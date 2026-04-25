// Este objeto é utilizado para simplesmente mostrar um texto quando o jogador se aproxima dele. Neste
// caso, foi uilizado para mostrar o texto para iniciar o diálogo com os NPCs, mas também pode ser 
// utilizado para outras funções;
if global.resenha == true{
	draw_set_font(fnt_dialogo)
	draw_text_ext_transformed(Obj_player.x, Obj_player.y - 60, "Aperte E para falar", 5, 999, 0.4, 0.4, 0);
}
