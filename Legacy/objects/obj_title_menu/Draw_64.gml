//inicio
draw_set_font(ft_gui);
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var x1 = gui_width/2;
var y1 = gui_height/2;
var margem = 50;
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	switch(menu_nivel){
		case 0:
			for(var i = 0; i < op_max; i++){
				var string_w = string_width(options[i]);
				var string_h = string_height(options[i]);
				var y2 = y1 + (margem*i);
				if(point_in_rectangle(m_x, m_y, x1 - string_w/2 , y2 - string_h/2, x1 + string_w, y2 + string_h/2)){
					index=i;
					draw_set_color(c_yellow);
				if(mouse_check_button_pressed(mb_left)){
					switch(index){
						case 0:
							room_goto_next();
							break;
						case 1:
							menu_nivel = 1;
							break;
						case 2:
							game_end();
							break;}}
							
				}else{draw_set_color(c_white);}
				if(menu_nivel == 0){draw_text(x1, y2, options[i]);
				}}
				break;
		case 1:
			for(var i = 0; i < opcao_max; i++){
				var string_w = string_width(opcao[i]);
				var string_h = string_height(opcao[i]);
				var y2 = y1 + (margem*i);
				if(point_in_rectangle(m_x, m_y, x1 - string_w/2 , y2 - string_h/2, x1 + string_w, y2 + string_h/2)){
					index=i;
					draw_set_color(c_yellow);
				if(mouse_check_button_pressed(mb_left)){
					switch(index){
						case 0:
							menu_nivel = 2;
							break;
						case 1:
							menu_nivel = 3;
							break;
						case 2:
							menu_nivel = 4;
							break;
						case 3:
							menu_nivel = 0;
							break;}}
							
						}else{draw_set_color(c_white);}
						if(menu_nivel == 1){draw_text(x1, y2, opcao[i]);}}
			break;
		case 2:
			for(var i = 0; i < opcaoo_max; i++){
				var string_w = string_width(opcaoo[i]);
				var string_h = string_height(opcaoo[i]);
				var y2 = y1 + (margem*i);
				if(point_in_rectangle(m_x, m_y, x1 - string_w/2 , y2 - string_h/2, x1 + string_w, y2 + string_h/2)){
					index=i;
					draw_set_color(c_yellow);
					if(mouse_check_button_pressed(mb_left)){
						switch(index){
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
								break;}}
				}else{draw_set_color(c_white);}
				if(menu_nivel == 2){draw_text(x1, y2, opcaoo[i]);}}
				break;
		case 3:
			for(var i = 0; i < opcaooo_max; i++){
				var string_w = string_width(opcaooo[i]);
				var string_h = string_height(opcaooo[i]);
				var y2 = y1 + (margem*i);
				if(point_in_rectangle(m_x, m_y, x1 - string_w/2 , y2 - string_h/2, x1 + string_w, y2 + string_h/2)){
					index=i;
					draw_set_color(c_yellow);
				if(mouse_check_button_pressed(mb_left)){
					switch(index){
						case 0:
						menu_nivel = 1;
						break;}}
				}else{draw_set_color(c_white);}
				if(menu_nivel == 3){draw_text(x1, y2, opcaooo[i]);}}
	  case 4:
		for(var i = 0; i < controle_max; i++){
			var string_w = string_width(controle[i]);
			var string_h = string_height(controle[i]);
			var y2 = y1 + (margem*i);
			if(point_in_rectangle(m_x, m_y, x1 - string_w/2 , y2 - string_h/2, x1 + string_w, y2 + string_h/2)){
				index=i;
				draw_set_color(c_yellow);
				if(mouse_check_button_pressed(mb_left)){
					switch(index){
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
							break;}}
			}else{draw_set_color(c_white);}
	if(menu_nivel == 4){
	draw_text(x1, y2, controle[i]);}}
	break;
	case 5:
	break;
}
