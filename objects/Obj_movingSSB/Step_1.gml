// Se move em um circulo
dir += velRotacao;

// Vai até a posição desejada
var _Xdestino = xstart + lengthdir_x(raio, dir);
var _Ydestino = ystart + lengthdir_y(raio, dir);
/* A funcão lengthdir, retorna o valor da distancia de um objeto do ponto de 
origem do circulo com *raio*, se movendo em *dir* */

// Define a velocidade
xspd = _Xdestino - x;
//yspd = _Ydestino - y;
yspd = 0;

// Move a plataforma
x += xspd;
y += yspd;
