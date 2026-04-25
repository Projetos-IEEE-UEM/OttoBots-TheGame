//Se meu jogo estiver pausado:
if(global.pause){
	image_speed = 0; //Paro de atualizar meus sprites;
	exit //Paro de executar meu código;
}
//Se meu jogo não estiver pausado:
else{
	image_speed = 1; //Volto a atualizar meus sprites e o programação segue normalmente.
}

// Objeto sempre está caindo
y += direcao*gravidade
// Mas se ele encontrar o chao, deve ser destruido
if place_meeting(x,y,Obj_block)
{
	gravidade = 0;
	direcao = 0;
	sprite_index = Sprite_projetil_some;
	
	if image_index >= image_number - 1 {
		instance_destroy(self);
	}
	
}