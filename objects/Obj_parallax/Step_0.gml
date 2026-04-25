// Esse aqui é o nosso código de paralaxe. Ele funciona relaticamente bem, desde que tenhamos as camadas organizadas da maneira correta...
var x_da_camera = camera_get_view_x(view_camera[0]); // Esta linha pega a posição "x" da câmera que segue o jogador e a guarda dentro de uma variável denominada
// x_da_camera. A partir desta variável, utilizamos diferentes pesos para fazer com que camadas de fundo dos cenários se movam com velocidades diferentes. Todas
// as linhas abaixo fazem com que o a posição x das camadas de fundo sejam definidas de acordo com a posição da câmera: quanto menor o multiplicador da variá-
// vel, menos a camada se move com relação e câmera e, portanto, mais ao fundo a camada parece estar.
layer_x("Backgrounds_5", x_da_camera * 0.1);
layer_x("Tiles_2", x_da_camera * 0.2);
layer_x("Backgrounds_6", x_da_camera * 0.3);
layer_x("Backgrounds_2", x_da_camera * 0.4);
// Uma limitação do jeito que foi feito aqui é que o efeito funciona apenas no eixo "x" e não no "y", mas isso é coisa quepode ser implementada mais para frente,
// caso necessário.
