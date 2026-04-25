if inicializar == false{
	scr_textos();
	inicializar = true;
	alarm[0] = 1;
}

if (mouse_check_button_pressed(mb_left) or keyboard_check_pressed(ord("E"))) {
	if caractere < string_length(texto_grid[# Infos.Texto, pagina]){
		caractere = string_length(texto_grid[# Infos.Texto, pagina]);
	}else{
		alarm[0] = 1;
		caractere = 0;
		if pagina < ds_grid_height(texto_grid) - 1{
			pagina++
		}else{
			global.dialogo = false;
			global.pause = false;
			
			Obj_player.contador_de_debouncing = Obj_player.tempo_de_debouncing;
			instance_destroy();
			
		}
	}
}
