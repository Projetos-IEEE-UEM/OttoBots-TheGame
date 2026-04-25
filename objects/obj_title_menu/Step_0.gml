/*up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter);
op_length = array_length(option[menu_nivel]);
 pos += down_key - up_key;
function pee_menu(accept_key, pos){
if pos >= op_length{ pos = 0};
if pos < 0{pos = op_length - 1};
	if accept_key {
		var _sml = menu_nivel;
	switch(menu_nivel){
	case 0:
		switch(pos){
			case 0:
				room_goto_next();
				/*var _salvar = file_text_open_write("configuracao.txt");
				global.escolha = file_text_write_real(_salvar, global.escolha);
				file_text_close(_salvar);
				break;
			case 1:
				menu_nivel = 1;
				break;
			case 2:
				game_end();
				break;}
		break;
		case 1:
			switch(pos){
				case 0: //
					menu_nivel = 3;
					break;
				case 1:
					menu_nivel = 4;
					break;
				case 2: 
					menu_nivel = 2;
					break;
				case 3:
					menu_nivel = 0;
					break;}
			break;
		case 2:
			switch(pos){
				case 0:
					global.escolha = 0;
					menu_nivel = 0;
					break;
				case 1:
					global.escolha = 1;
					menu_nivel = 0;
					break;
				case 2: 
					menu_nivel = 1;
					break;}
			break;
		case 3:
			switch(pos){
				case 0:
					global.level = 1;
					menu_nivel = 0;
					break;
				case 1:
					global.level = 0;
					menu_nivel = 0;
					break;
				case 2:
					menu_nivel = 1;
					break;}
			break;
		case 4:
			switch(pos){
				case 0:
					menu_nivel = 1;
					break;}
			break;
	}
		if _sml != menu_nivel{pos = 0};
		op_length = array_length(option[menu_nivel]);
	}
}
pee_menu(accept_key, pos); */