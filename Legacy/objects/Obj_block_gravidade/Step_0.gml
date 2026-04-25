if place_meeting(x,y, Obj_player){
	Obj_player.grav = 0.15;
	Obj_player.velocidade_movimento = 1.5;
	if (Obj_player.estado == "caindo"){
		Obj_player.vel_movimento_vertical = Obj_player.vel_movimento_vertical/1.1;
		//Obj_player.mudardirecao = false;
	}
	else{
		Obj_player.mudardirecao = true;
	}
}
else{
	Obj_player.grav = 0.3;
	Obj_player.velocidade_movimento = 3;
	Obj_player.vel_movimento_vertical = Obj_player.vel_movimento_vertical;
	Obj_player.vel_pulo = -7;
	Obj_player.mudardirecao = true;
}