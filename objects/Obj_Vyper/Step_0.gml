if(global.pause){
	image_speed = 0;
	exit
}
else{
	image_speed = 1;
}

//Se ele estiver morto, troca a animacao de morte e o codigo vai parar de ser executado
if morto {
	//muda o sprite para o vyper morto
	sprite_index = Spr_Vyper_Morre
	
}

//Enquanto nao estiver no chao, ele é afetado pela gravidade.
if !place_meeting(x, y+1, Obj_block) {
	vel_movimento_vertical+=gravidade;
}


//checando se eu levo dano do player mas ainda nao morreu
if dano && (morto == false) {
	//muda a animacao para a animacao de dano
	sprite_index = Spr_Vyper_Dano;
	//zera a velocidade para ele nao se movimentar mais
	xspd = 0;
}



