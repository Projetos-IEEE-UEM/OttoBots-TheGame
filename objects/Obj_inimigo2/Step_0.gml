//Se meu jogo estiver pausado:
if(global.pause){
	image_speed = 0; //Paro de atualizar meus sprites;
	exit //Paro de executar meu código;
}
//Se meu jogo não estiver pausado:
else{
	image_speed = 1; //Volto a atualizar meus sprites e o programação segue normalmente.
}

/*Aqui cuidarei de como esse robô deve ser comportar no eixo y. Quero que ele fique a uma
distância constante do Otto, subindo e descendo conforme a necessidade. Por isso, farei
que: caso o y do meu robô menos o y do Otto seja maior que - 80 (lembre-se que o eixo
y do Game Maker é invertido*/

//Como ele ja caiu no chao e esta morto, pode trocar de sprite e morrer
if morto && caiu == true{
	//mudo o sprite para a morte
	sprite_index = Spr_inimigo2_Morre;

	//sai dessa etapa
	exit;
}

/*Aqui vou definir o critério que fará o inimigo começar a perseguir o Otto: é basicamente uma conta com a 
posição do jogador e do inimigo. Se o valor absoluto (distância) do jogardor com o inimigo for menor que o 
raio imposto acima, o inimigo deve começar uma perseguição. ~Bruno*/
if (abs(x - Obj_player.x) < var_raio && abs(y - Obj_player.y) < var_raio) {
	seguir = true;
}
//Caso o Otto saia do range definido pela variável var_raio_fuga, o inimigo deve parar de seguir.
if (abs(x - Obj_player.x) > var_raio_fuga or abs(y - Obj_player.y) > var_raio_fuga) {
	seguir = false;
}

//enquanto ele nao toma dano, ele persegue o player e atira nele
if (dano == false && seguir == true){
	if y - Obj_player.y > -80
	{
		//O robô deve acelerar para cima:
		aceleracao_vertical = aceleracao_vertical - 0.05;
	}
	else
	{
		//Caso contrário, acelero para baixo
		aceleracao_vertical = aceleracao_vertical + 0.05;
	}
	//Entretanto, minha aceleração não deve passar de 1.
	aceleracao_vertical = clamp(aceleracao_vertical, -1, 1);
	//y será a velocidade base vezes a aceleração!
	y += velocidade_vertical * aceleracao_vertical;

	//Agora sobre o movimento horizontal:

	//Se o player estiver a esquerda
	if Obj_player.x < x
	{
		//Se o Otto estiver a esquerda, acelero para a esquerda.
		aceleracao = aceleracao - 0.01;
	}
	else
	{
		//Caso contrário, acelero para a direita
		aceleracao = aceleracao + 0.01;
	}

	//Entretanto, minha aceleração não deve passar de 0.7.
	aceleracao = clamp(aceleracao, -0.7, 0.7);

	//X será a velocidade base vezes a aceleração!
	x += velocidade * aceleracao;

	//Quando o contador for igual a 100 (Por volta de 1 segundo)
	if contador == 50
	{
		//Crie um outro objeto (Obj_projetil)
		instance_create_layer(x,y, layer, Obj_projetil);
		//Resete o contador
		contador = 0;
	}
	/*
	Vou deixar essa parte do código comentada caso queiramos utilizá-la mais pra frente. Ela
	foi dubstituida pelo o que está nas primeiras linhas de código.
	//Aqui eu queria que, além do movimento horizontal, o inimigo também variasse um pouco verticalmente.
	//Por isso, criei um segundo contador que conta o tempo que o inimigo gasta subindo e descendo.
	//Quando o contador_voo atingir 20 milisegundos...
	if contador_voo == 20
	{
		//E o inimigo estiver descendo.
		if direcao_vertical == 1
		{
			//Faça ele subir!
			direcao_vertical = -1;
		}
		//Caso contrário:
		else
		{
			//Faça ele descer!
			direcao_vertical = 1;
		}
		//Reseta o contador de voo para que ele comece a contar novamente.
		contador_voo = 0;
	}

	//Velocidade vertical será a velocidade base do inimigo vezes a direção que ele está seguindo.
	y += velocidade_vertical * direcao_vertical;
	*/
	//Incremente o contador a cada frame.
	contador++;

	//Incremente o contador de voo.
	//contador_voo++;
}

//Quando ja sofreu o dano, porem ainda nao morreu no chao
if dano && (morto == false) {
	
	//muda a animacao para a animacao de dano
	sprite_index = Spr_inimigo2_Dano;
	
	//Velocidade de queda
	velocidade_vertical = 3;
}

//Acabou de sofrer dano e comecou a cair en direçao ao chao
if dano && (caiu = false){
	//Caindo
	y += velocidade_vertical;
}

//identifica que o inimigo caiu no chao, entao ele ja pode morrer
if place_meeting(x, y+10, Obj_block) && morto = true{
	caiu = true;
}
