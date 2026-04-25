// Inicializações
draw_set_font(ft_gui);
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var x1 = gui_width / 2;
var y1 = gui_height / 2;
var margem = 50;
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var input_mode = ""; 





if (keyboard_check_pressed(vk_down)) {
    input_mode = "keyboard";
    global.index--;
    if (global.index < 0) {
        global.index = op_max - 1;
    }
}

if (keyboard_check_pressed(vk_up)) {
    input_mode = "keyboard";
    global.index++;
    if (global.index >= op_max) {
        global.index = 0;
    }
}


if (point_in_rectangle(m_x, m_y, 0, 0, gui_width, gui_height)) { 
    input_mode = "mouse";
    for (var i = 0; i < op_max; i++) {
        var string_w = string_width(options[i]);
        var string_h = string_height(options[i]);
        var y2 = y1 + (margem * i);

        if (point_in_rectangle(m_x, m_y, x1 - string_w / 2, y2 - string_h / 2, x1 + string_w / 2, y2 + string_h / 2)) {
            global.index = i;
        }
    }
}

switch (menu_nivel) {
    case 0: // Menu Principal
        for (var i = 0; i < op_max; i++) {
            var string_w = string_width(options[i]);
            var string_h = string_height(options[i]);
            var y2 = y1 + (margem * i);

           
            draw_set_color((global.index == i) ? c_yellow : c_white);
            draw_text(x1, y2, options[i]);

          
            if ((mouse_check_button_pressed(mb_left)) ||  keyboard_check_pressed(vk_enter)) {
                switch (global.index) {
                    case 0: room_goto_next(); break;
                    case 1: menu_nivel = 1; break;
                    case 2: game_end(); break;
                }
            }
        }
        break;

    case 1: // Configurações
        for (var i = 0; i < opcao_max; i++) {
            var string_w = string_width(opcao[i]);
            var string_h = string_height(opcao[i]);
            var y2 = y1 + (margem * i);

            draw_set_color((global.index == i) ? c_yellow : c_white);
            draw_text(x1, y2, opcao[i]);

            if  ((mouse_check_button_pressed(mb_left)) ||  keyboard_check_pressed(vk_enter)) {
                switch (global.index) {
                    case 0: menu_nivel = 2; break;
                    case 1: menu_nivel = 3; break;
                    case 2: menu_nivel = 0; break;
                }
            }
        }
        break;

    case 2: // Dificuldade
        for (var i = 0; i < opcaoo_max; i++) {
            var string_w = string_width(opcaoo[i]);
            var string_h = string_height(opcaoo[i]);
            var y2 = y1 + (margem * i);

            draw_set_color((global.index == i) ? c_yellow : c_white);
            draw_text(x1, y2, opcaoo[i]);

            if  ((mouse_check_button_pressed(mb_left)) ||  keyboard_check_pressed(vk_enter)) {
                switch (global.index) {
                    case 0: global.level = 1; menu_nivel = 0; break;
                    case 1: global.level = 0; menu_nivel = 0; break;
                    case 2: menu_nivel = 1; break;
                }
            }
        }
        break;

    case 3: // Controles
        for (var i = 0; i < controle_max; i++) {
            var string_w = string_width(controle[i]);
            var string_h = string_height(controle[i]);
            var y2 = y1 + (margem * i);

            draw_set_color((global.index == i) ? c_yellow : c_white);
            draw_text(x1, y2, controle[i]);

            if  ((mouse_check_button_pressed(mb_left)) ||  keyboard_check_pressed(vk_enter)) {
                switch (global.index) {
                    case 0: global.escolha = 0; global.esquerda = ord("A");
							global.direita = ord("D");
							global.baixo = ord("S");
							global.pular = vk_space;menu_nivel = 0; break;
                    case 1: global.escolha = 1; global.esquerda = vk_left;
							global.direita = vk_right;
							global.baixo = vk_down;
							global.pular = vk_up;menu_nivel = 0; break;
                    case 2: menu_nivel = 1; break;
                }
            }
        }
        break;

    case 4: // Submenu adicional
        for (var i = 0; i < opcaooo_max; i++) {
            var string_w = string_width(opcaooo[i]);
            var string_h = string_height(opcaooo[i]);
            var y2 = y1 + (margem * i);

            draw_set_color((global.index == i) ? c_yellow : c_white);
            draw_text(x1, y2, opcaooo[i]);

            if  ((mouse_check_button_pressed(mb_left)) ||  keyboard_check_pressed(vk_enter)) {
                if (global.index == 0) {
                    menu_nivel = 1;
                }
            }
        }
        break;

    case 5:
        // Outros menus
        break;
}
