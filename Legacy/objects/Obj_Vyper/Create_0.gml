//Direção inicial que o inimigo segue
direcao = choose(1, -1);
//Velocidade horizontal do inimigo
xspd = 1;
//Iniciando a gravidade utilizada pelo inimigo:
gravidade = 0.4;
//Iniciando a velocidade vertical do inimigo:
vel_movimento_vertical = 0;
//Escolhendo se eu caio de plataformas ou nao
cair = choose(1, 0);

event_inherited();