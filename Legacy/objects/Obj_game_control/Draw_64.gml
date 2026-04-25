// Inicializa variáveis para a posição e escala da sprite de vida
var x_pos = 59;
var y_pos = 60;
var escala = .8;

// Escolhe a sprite de vida baseada na quantidade de vidas global do jogador
switch(global.vida) {
    case 4:
        draw_sprite_ext(Spr_hud_vida4, 0, x_pos, y_pos, escala, escala, 0, c_white, 1);
        break;
    case 3:
        draw_sprite_ext(Spr_hud_vida3, 0, x_pos, y_pos, escala, escala, 0, c_white, 1);
        break;
    case 2:
        draw_sprite_ext(Spr_hud_vida2, 0, x_pos, y_pos, escala, escala, 0, c_white, 1);
        break;
    case 1:
        draw_sprite_ext(Spr_hud_vida1, 0, x_pos, y_pos, escala, escala, 0, c_white, 1);
        break;
    default: // Isso inclui o caso de 0 vidas, assumindo Spr_hud_vida0 como a sprite de morte
        draw_sprite_ext(Spr_hud_vida0, 0, x_pos, y_pos, escala, escala, 0, c_white, 1);
}

// A parte do texto mostrando o número de vidas pode ser removida ou comentada, já que as sprites de bateria agora representam visualmente as vidas do jogador
// draw_set_font(ft_gui);
// draw_set_color(c_white);
// draw_text(90,30, string(global.vida));
// draw_set_font(-1);
// draw_set_color(-1);



draw_sprite_ext(Spr_hud_coin, (get_timer()/100000), 45, 120, 2, 2, 0, c_white, 1);
draw_set_font(ft_gui);
draw_set_color(c_white);
draw_text(90,90, string(coin));
draw_set_font(-1);
draw_set_color(-1);

