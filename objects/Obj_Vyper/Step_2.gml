
// Quando encontrar um objeto de bloqueio na sua frente, o inimigo muda sua direção
if place_meeting(x+xspd, y, Obj_block){
	//enquanto nao se chocar com o bloco, ele chega perto bem de vagarinho
	while !place_meeting(x+sign(xspd), y, Obj_block){
		x += sign(xspd);
	}
	//muda de direção
	direcao = -direcao;
}

//se eu nao puder cair, eu nao caio das plataformas flutuantes
if cair == 0 {
	//Verifica se terminou a plataforma, e para ele nao cair, muda de direção
	if !place_meeting(x+20, y+1, Obj_block) || !place_meeting(x-20, y+1, Obj_block){
		direcao = -direcao;
	}
}

//movimentação horizontal
image_xscale = -direcao;
x += direcao*xspd;


//Se encontrar um objeto sob ele, sua velocidade vertical é zerada, ou seja, nao ha mais gravidade atuando sobre ele.
if place_meeting(x, y+vel_movimento_vertical, Obj_block){
	while !place_meeting(x, y+sign(vel_movimento_vertical), Obj_block){
		y += sign(vel_movimento_vertical);
	}
	
	vel_movimento_vertical = 0;
}

y += vel_movimento_vertical;