if(global.pause){  //Se meu jogo está pausado...
	image_speed = 0; //Parar de attualizar os sprites;
	exit //Parar de executar o código.
}
else{
	image_speed = 1; //Caso contrário, volte  a atualizar os sprites
}

//Etapa fica rodando no o codigo toda hr enquanto o objeto existir

#region MOVIMENTAÇÃO E COLISAO

//So se movimenta enquanto nao estiver levando dano 
if dano == false && estado!="morto" {
	// O Otto só pode mudar de direção quando essa variável foi verdadeira.
	if (mudar_direcao == true){
		//esquerda (move=-1) e direita (move=0). Os dois apertados juntos (move=0)
		move = -(keyboard_check(global.esquerda) or gamepad_button_check(0, gp_padl))+(keyboard_check(global.direita) or gamepad_button_check(0, gp_padr))
		direcao = move;
	}
}
	
// Bloquear movimentação durante o diálogo
if (global.dialogo) {
    xspd = 0;    // Zerar velocidade horizontal
    move = 0;    // Bloquear input de movimentação
    image_speed = 0; // Parar animação
    return;      // Interromper a execução da lógica de movimentação
}
	
//Movimentação horizontal
xspd = velocidade_movimento*move

//Direção do personagem (se ele esta virado para esquerda ou direita)
if (move != 0) image_xscale = direcao

//se a tecla S estiver apertada o Otto agaixa
if (keyboard_check(global.baixo) or gamepad_button_check(0, gp_face3)) {
	agachar = true
}
//Se eu estiver agachado, minha velocidade aumenta
if agachar {
	velocidade_movimento = 4;
} else {
	//caso contrario, ela volta ao normal
	velocidade_movimento = 3;
}

//Se eu estiver agachado e nao estiver me movendo a animcao de movimento das rodas nao acontece 
if agachar && move == 0 {
	image_index = 1;
} else if agachar && move != 0 && place_meeting(x, y+1, Obj_block) {
	// Atualiza o temporizador de poeira
	dust_timer -= 1;

	// Verifica se é hora de criar partículas de poeira
	if (dust_timer <= 0) {
	    // Reseta o temporizador
	    dust_timer = dust_interval;

	    // Calcula a posição da poeira (ajuste conforme necessário)
	    var dust_x = (x - sprite_width/2) + 3*(direcao);
	    var dust_y = (y - sprite_height/ 2) + 10; // Altura do chão

	    // Cria a instância do objeto de poeira
	    instance_create_layer(dust_x, dust_y, layer, Obj_Dust);
	}
}

//Se nao tiver nenhum bloco em cima do player e a tecla nao estiver pressionada, ele levanta
if !place_meeting(x, y-5, Obj_block) && !(keyboard_check(global.baixo) or gamepad_button_check(0, gp_face3)) {
	agachar = false
}

//muda a altura do pulo do player quando este esta agachado
if agachar && (keyboard_check(global.baixo) or gamepad_button_check(0, gp_face3)) {
	vel_pulo = -5
} else {
	vel_pulo = -7
}
		

if place_meeting(x, y+1, Obj_block) {
	pulos = 2
}
else{
	vel_movimento_vertical+=grav
}

//So consigo pular quando o timer de dano acabar e eu nao estar mais no estado de dano.
if(dano == false){
	//funcionamento do pulo
	if ((keyboard_check_pressed(global.pular) or gamepad_button_check_pressed(0, gp_face1)) && pulos > 0){ //Se o botão de pulo for pressionado e a condição de debounce for cumprida;
        vel_movimento_vertical = vel_pulo
		pulos -= 1
	}
}

#endregion

// Se a tecla S / Baixo for pressionada, o Otto tenta agachar
if (keyboard_check(global.baixo) or gamepad_button_check(0, gp_face3)) {
    agachar = true;
}

if (agachar) {
    velocidade_movimento = 4;
    
    // FORÇA O JOGO A USAR A MÁSCARA MENOR (Evita expandir para as paredes)
    // Certifica-te de que criaste esse sprite e a origem dele está em "Bottom Centre"
    mask_index = spr_colision_player_crouch; 
    
} else {
    // Se não estiver a carregar no botão, precisamos de checar se REALMENTE podemos levantar.
    // IMPORTANTE: Altera o "-16" para a diferença de altura exata entre o teu player em pé e agachado!
    var _teto_acima = place_meeting(x, y - 16, Obj_block); 
    
    if (!_teto_acima) {
        agachar = false;
        
        // VOLTA PARA A MÁSCARA NORMAL EM PÉ
        // Certifica-te de que a origem também está em "Bottom Centre"
        mask_index = spr_colision_player_idle;
    }
}

// Se não tiver nenhum bloco em cima e o botão foi solto (e o teto está livre pelo código acima)
if !agachar {
    velocidade_movimento = 3;
}

// Muda a altura do pulo do player quando este está agachado
if (agachar) {
    vel_pulo = -5;
} else {
    vel_pulo = -7;
}



#region MAQUINA DE ESTADOS
jump = (keyboard_check_pressed(global.pular) or gamepad_button_check_pressed(0, gp_face1))

switch(estado){
	case "parado":{
		//comportamento do estado
		sprite_index = Spr_player
		
		//se a tecla S estiver apertada o Otto agaixa
		if agachar {
			sprite_index = Spr_player_abaixa
		}
		//condicao de movimento 
		if move != 0 {
			estado = "movendo";
		}
		else if jump {
			estado = "pulando";
		}
		
		break
	}
	case "movendo":{
		//comportamento
		sprite_index = Spr_player_walk

		//se a tecla S estiver apertada o Otto agaixa
		if agachar {
			sprite_index = Spr_player_abaixa
		}
		
		//condicao de estar parado
		if move == 0 {
			estado = "parado";
		}
		else if jump {
			estado = "pulando";
		}
		else if vel_movimento_vertical > 0 {
			estado = "caindo"
		}
		
		break;
	}
	case "pulando":{
		if agachar {
			sprite_index = Spr_player_abaixa
		}
		//comportamento
		//condiçao para para a animaçao no ar
		if vel_movimento_vertical < 0 && !(keyboard_check(global.baixo) or gamepad_button_check(0, gp_face3)) {
			sprite_index = Spr_player_jump;
			//condiçao para o sprite nao ficar se repetindo e ficar parado no ultimo frame
			if image_index >= image_number - 1 {
			image_index = image_number-1;
			}
		}
		else{
			estado = "caindo"
		}
		break
	}
	case "caindo" :{
		
		//recebe o sprite de queda
		sprite_index = Spr_player_fall;
		
		if agachar {
			sprite_index = Spr_player_abaixa
		}
			
		//Se eu estou caindo, quer dizer que posso cair na cabeça de um inimigo
		//criando uma variavel para checar se tem um inimigo abaixo de mim
		var _inimigo = instance_place(x, y+1, Obj_inimigo_pai);
			
		//checando se eu cai em um inimigo, so funciona se eu nao estiver travado de dano
		if _inimigo && dano == false  {
			//So consigo pular na cabeça do inimigo se ele nao estiver morto e nao tiver levado dano
			if _inimigo.morto == false && _inimigo.dano == false {
				
				//dando o aviso pro inimigo que ele tomou dano do player 
				_inimigo.dano = true;
				//Variavel para checar se eu vou ser lancado na diagonal
				cabeca_inimigo = true;
				//eu sou lancado no ar novamente -bouncing-
				vel_movimento_vertical = vel_pulo+2;
				estado = "pulando"
			}  		
		}
		//condição de fim de pulo
		if vel_movimento_vertical == 0 {
			estado = "parado"
		}
		if jump {
			estado = "pulando"	
		}
		
		break
	}
	case "morto":{
		
		sprite_index = Spr_player_dead;
		
		if image_index >= image_number - 1 {
			image_alpha -= 0.05;
		}

		show_debug_message("estou no estado morto");
		//estado = "parado"
		
		break;
	}
}
#endregion








#region BOUNCING DIAGONAL NA CABEÇA DOS INIMIGOS

if cabeca_inimigo and Pulo_diagonal == 0 {
	randomize();
	Pulo_diagonal = timer_diagonal;
	if move == 0 {
		escolha_diagonal = choose(-1,1);
	}else{
		escolha_diagonal = move;
	}
	if place_meeting(x,y+1, Obj_inimigo3){
		escolha_diagonal = escolha_diagonal*1.5;
	}
}

if cabeca_inimigo and Pulo_diagonal > 0 {
	Pulo_diagonal--;
	velocidade_movimento = 0;
	xspd = 2*escolha_diagonal;
}

if Pulo_diagonal == 0 or place_meeting(x,y+1, Obj_block) {
	cabeca_inimigo = false;
	Pulo_diagonal = 0;
}

#endregion



//Quando zerado o tempo levando dano, inicia o tempo de ficar invisivel
if timer_dano == 0 {
	//Timer do dano acabou, entao eu nao preciso mais estar levando dano
	dano = false;
}

//Quando o tempo de invecibilidade terminar, a imagem do player volta a ficar opaca
if timer_invencivel > 0 {
	timer_invencivel--;
}else{
	if estado != "morto"{
		image_alpha = 1;
	}
}


//Enquanto o tempo do dano ainda nao zerou
if dano {
	
	//sprite muda para o player tomando dano 
	sprite_index = Spr_player_hit;
	
	//So ativa a invencibilidade se eu nao estiver morto e levar dano
	if estado != "morto" {
		if timer_dano == 1 {
			//Inicio da contagem da invecibilidade e player fica menos opaco para indicar que esta invencivel
			timer_invencivel = tempo_invencivel;
			image_alpha = 0.5;
		}
	}	
	
	//diminiu o timer de dano
	timer_dano--;
	
	//isso serve para diminuir a distancia do empurrao que o player levou do inimigo
	if timer_dano < tempo_dano - 25 {
		move = 0;
	}
	
	//diminui a quantidade de vidas do Otto quando levar dano de fato
	if posso_dano {
		global.vida--;
		posso_dano = false;
	}
	
	//Quando suas vidas chegarem a zero, seu estado muda para morto
	if global.vida == 0{
		estado = "morto"
		sprite_index = Spr_player_dead;
	}

}




//Checando se eu encostei num inimigo, projétil ou bloco para tomar dano dele
var _inimigo = instance_place(x, y, Obj_inimigo_pai);
var _projetil = instance_place(x,y, Obj_projetil_pai);
var _bloco_dano = noone;
_bloco_dano = instance_place(x+direcao,y+1, Obj_block_dano);

if (_bloco_dano == noone) {
    // Qtd de pixels de distancia em volta do player pra procurar por um bloco de dano
    var _margem_busca = 1; 
    
    // Se o vento está a empurrar para a ESQUERDA (xspd < 0 ou o vento vem da direita)
    if (xspd < 0 or (instance_exists(Obj_Tempestade) && Obj_Tempestade.forca_tempestade > 0)) {
        _bloco_dano = instance_place(x - _margem_busca, y, Obj_block_dano);
    } 
    // Se o vento estivesse a empurrar para a DIREITA
    else if (xspd > 0) {
        _bloco_dano = instance_place(x + _margem_busca, y, Obj_block_dano);
    }
}

//So toma dano qunado nao esta morto
if estado!="morto"{
	//Player so toma dano quando a invencibilidade acabar e o inimigo nao estiver morto
	if timer_invencivel == 0 {
		if _inimigo && dano == false{
			if _inimigo.dano == false && _inimigo.morto == false{
				dano = true;
				
				//Aqui eu digo para minha variavel de controle q eu posso levar dano
				posso_dano = true;

				//inicia o timer de dano
				timer_dano = tempo_dano;

				//quando o player leva dano, ele eh empurrado para tras na direcao oposta de seu movimento
				vel_movimento_vertical = -4;
				move = -move;
			}
		}
		/*Adiocionei aqui a parte do projétil: é basicamente a mesma coisa que acontece quando ele toca em em um
		inimigo pela lateral, mas de todos os ângulos! ~Bruno*/
		if _projetil && dano==false//Se eu toco em um projétil e eu não estou invencível:
		{
			dano = true; //Eu levo dano.
				
			//Aqui eu digo para minha variavel de controle q eu posso levar dano
			posso_dano = true;

			//inicia o timer de dano
			timer_dano = tempo_dano;

			//quando o player leva dano, ele eh empurrado para tras na direcao oposta de seu movimento
			vel_movimento_vertical = -4;
			move = -move;
		}
		if _bloco_dano && dano==false//Se eu toco em um projétil e eu não estou invencível:
		{
			dano = true; //Eu levo dano.
				
			//Aqui eu digo para minha variavel de controle q eu posso levar dano
			posso_dano = true;

			//inicia o timer de dano
			timer_dano = tempo_dano;

			//quando o player leva dano, ele eh empurrado para tras na direcao oposta de seu movimento
			vel_movimento_vertical = -4;
			move = -move;
		}
	}
}

#region Diálogo

if distance_to_object(Obj_par_npcs) <= 10{
	global.resenha = true;
	if keyboard_check_pressed(ord("E")) and global.dialogo == false and contador_de_debouncing <= 0{
		global.dialogo = true;
		var _npc = instance_nearest(x, y, Obj_par_npcs);
		var _dialogo = instance_create_layer(x, y, "Controladores", Obj_dialogo);
		_dialogo.npc_nome = _npc.nome;
		//global.pause = true;
	}
}else{
	global.resenha = false;
}

//Decrementador de debauncing
if contador_de_debouncing > 0 {
	contador_de_debouncing--;
}
#endregion


// Mecanica do vento

_inst = Obj_Tempestade;

if(instance_exists(_inst)) {
    var _tempestade = _inst.tempestade_ativa;
    
    if (!agachar) {
        xspd -= _inst.forca_tempestade * 0.8;
        
        velocidade_movimento = lerp(4,2,_inst.forca_tempestade);
    }
}