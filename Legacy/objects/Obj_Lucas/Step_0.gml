if(global.pause){  //Se meu jogo está pausado...
	image_speed = 0; //Parar de attualizar os sprites;
	exit //Parar de executar o código.
}
else{
	image_speed = 1; //Caso contrário, volte  a atualizar os sprites
}

if(abs(Obj_player.x - x) > 50){
	if((Obj_player.x - x) > 0){
		x = x + 1.3;
		image_xscale = -1;
		sprite_index = Spr_Lucas_anda;
	}
	if((Obj_player.x - x) < 0){
		x = x - 1.3;
		image_xscale = 1;
		sprite_index = Spr_Lucas_anda;
	}
}
else{
	sprite_index = Spr_Lucas
}