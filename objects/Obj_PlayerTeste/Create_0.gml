controlsSetup();

moveDir = 0; // Direção do movimento (-1 -> esquerda, 0 -> parado, 1 -> direita)
velMove =  3;

// Velocidade de movimento nos eixos
xspd = 0;
yspd = 0;

grav = 0.3;
vel_terminal = 10; // Velocidade terminal da queda

jumpSpd = -7;
qtdMaxPulos = 2;
qtdPulos = 0; // Indica quantos pulos foram feitos

noChao = true; // Indica se o player está encima de um piso

agachar = false; // Indica se o player está agachado

vidas = 1 // Começa com apenas uma vida e aumenta conforme coleta os raios

