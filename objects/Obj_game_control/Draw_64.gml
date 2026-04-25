// Aqui é onde são criados os elementos do HUD do game. - Bruno

// A primeira parte do código está relacionada com posição e escala de cada um dos elementos. Note que esta é fixa, o que pode ser um problema uma vez
// tenhamos escalas de janela reguláveis; Possível problema vindo ai.
var x_pos = 59;
var y_pos = 60;
var escala = .8;

// O Switch abaixo se refere ao gráfico da bateria mostrado para representar a vida do Otto - é um simples "switch-case" que altera o gráfico de acordo
// o valor da variável "vida".
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

// Esta parte são os outros elementos do HUD, como o tempo. Obsere que a posição do HUD destes elementos também é fixa, o que pode, novamente, representar
// um possível problema quando tivermos nossas escalas reguláveis de janela.
draw_sprite_ext(Spr_hud_coin, (get_timer()/100000), 45, 120, 2, 2, 0, c_white, 1); // HUD do contador de tempo
draw_set_font(ft_gui); // Nova fonte para o que vier abaixo...
draw_set_color(c_white); // ...nova cor para o que vier abaixo...
draw_text(90,90, string(coin)); // HUD do contador de moedas.
draw_set_font(-1); // Essa linha e a de baixo resetam os valores de fonte e cor para o soriginais, para que outras partes do projeto não sofram com bugs.
draw_set_color(-1);

