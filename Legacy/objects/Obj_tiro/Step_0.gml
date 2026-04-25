//Se meu jogo estiver pausado:
if(global.pause){
	image_speed = 0; //Paro de atualizar meus sprites;
	exit //Paro de executar meu código;
}
//Se meu jogo não estiver pausado:
else{
	image_speed = 1; //Volto a atualizar meus sprites e o programação segue normalmente.
}

x += velocidade * direcao

if place_meeting(x+velocidade, y, Obj_block){
	instance_destroy()
}