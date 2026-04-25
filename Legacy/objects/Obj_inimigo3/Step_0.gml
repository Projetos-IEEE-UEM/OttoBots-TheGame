// Verifica se o jogo está pausado
if(global.pause){
	image_speed = 0; // Parar animação
	exit; // Parar execução do código
}
else {
	image_speed = 1; // Retomar animação
}

// MÁQUINA DE ESTADOS

//Orientacao de quando estou parado e atirando
if x - Obj_player.x > 0{
	direcao = -1;
}
//Caso contrário, vou a esquerda.
else{
	direcao = 1;
}

switch(estado){
    case "parado":
        sprite_index = Spr_inimigo3; // Sprite parado
        if xspd != 0 && perseguir {
            estado = "movendo";
        }
        if tempo_pulo > 0 {
            estado = "pulando";
        }
        if (contador == tempo_tiro-40 && !perseguir) {
            estado = "atirando";
        }
        break;

    case "movendo":
        sprite_index = Spr_inimigo3_movendo; // Sprite movendo
        if xspd == 0 && tempo_pulo == 0 {
            estado = "parado";
        }
        if pode_pular {
            estado = "pulando";
        }
        break;

    case "pulando":
        sprite_index = Spr_inimigo3_pulando; // Sprite pulando
        if (image_index < image_number - 1) {
            image_speed = 1; // Velocidade normal da animação
        } else {
            image_speed = 0; // Parar animação no último frame
        }
        if (xspd != 0 && tempo_pulo == 0) {
            estado = "movendo";
        }
        if (xspd == 0 && tempo_pulo == 0) {
            estado = "parado";
        }
        break;

    case "atirando":
        sprite_index = Spr_inimigo3_atirando; // Sprite atirando
        if (image_index >= image_number - 1) {
            estado = "parado";
            image_speed = 0; // Parar animação
        }
        break;
}

// Orientação do sprite
if (direcao != 0) image_xscale = -direcao;

// Colisão do inimigo com o chão
if place_meeting(x, y+1, Obj_block){
    gravidade = 0;
    pulo = 1;
} else {
    pulo = 0;
    gravidade = 2;
}

// Evitar glitch ao se aproximar do chão
if place_meeting(x, y+gravidade, Obj_block){
    while !place_meeting(x, y+sign(gravidade), Obj_block){
        y += sign(gravidade);
    }
    gravidade = 0; // Resetar gravidade ao tocar o chão
}
y += gravidade; // Aplicar gravidade

// Criar tiro
if (contador == tempo_tiro and !perseguir) {
    instance_create_layer(x, y-13, layer, Obj_tiro);
    contador = 0;
}

// Lógica de dano e perseguição
if (dano) {
    if (!perseguir) {
        perseguir = true;
    } else {
        vidas--;
    }
    dano = 0;
}

// Lógica de perseguição
if (perseguir) {
    if (Obj_player.x < x) {
        direcao = -1; // Esquerda
    } else {
        direcao = 1; // Direita
    }
    dano = 0;

    if (x == Obj_player.x) {
        xspd = 0; // Parar movimento horizontal para evitar tremor
    } else {
        xspd = 1;
    }

    if (!parede) {
        if (place_meeting(x+(direcao*20), y, Obj_block)) {
            pode_pular = true;
            tempo_pulo = 50;
            parede = true;
        }
    }

    if (tempo_pulo > 0) {
        if (tempo_pulo == 50 && pulo != 0) {
            vel_movimento_vertical = velocidade_pulo;
            pulo = 0;
        }
        if (tempo_pulo == 20) {
            vel_movimento_vertical = 0; // Zerar velocidade vertical
        }
        tempo_pulo--;
        if (tempo_pulo == 1) {
            parede = false;
            pode_pular = false;
        }
    }

    if place_meeting(x+xspd, y, Obj_block){
        while !place_meeting(x+sign(xspd), y, Obj_block){
            x += sign(xspd);
        }
        xspd = 0;
    }
    
    x += direcao*xspd;
    y += vel_movimento_vertical;
}

// Destruir inimigo sem vidas
if vidas == 0 {
    instance_destroy(self);
}

// Incrementar contador se não estiver perseguindo
if (!perseguir) {
    contador++;
}

// Decrementar contador de pulo
if (parede) {
    tempo_pulo--;
}
