//A direção para qual este segue depende da posição do player em relação à ele;
//Se o player estiver à minha direita, vou a direita.
if x - Obj_player.x > 0{
	direcao = -1;
}
//Caso contrário, vou a esquerda.
else{
	direcao = 1;
}

//Mudo a orientacao do sprite

image_xscale = -direcao

//Velocidade de movimentação do projetil.
velocidade = 2;
//Velocidade horizontal do inimigo
xspd = 1;
//Iniciando a gravidade utilizada pelo inimigo:
gravidade = 0.4;
//Iniciando a velocidade vertical do inimigo:
vel_movimento_vertical = 0;
//Escolhendo se eu caio de plataformas ou nao
cair = choose(1, 0);

event_inherited();