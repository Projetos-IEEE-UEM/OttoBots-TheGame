// Funções do player

/*
Se _val for igual a true, quer dizer que estamos querendo trocar o valor de 
noChao para true, e o contrário para o false. 
Uma variavel com valor iniciado no parametro (_val = true, mas pode ser outras 
coisas) indica que o parametro passado na função é opcional (setNoChao() muda pra true tbm).
*/
function setNoChao(_val = true) {
    if _val == true {
        noChao = true;
        bufferQuedaTimer = bufferFramesQueda;
    }
    else {
        noChao = false;
        plataformaQueEstou = noone;
        bufferQuedaTimer = 0;
    }
}

/*
Verifica se o player está em cima de uma plataforma semisólida

_static diz se a plataforma será móvel ou não, deseja ver se a plataforma é 
exclusivamente móvel _static precisa ser true
*/
function estouSemiSolida(_static = true) {
    if _static == true {
        return plataformaQueEstou.object_index == Obj_SemiSolidBlock 
        || object_is_ancestor(plataformaQueEstou.object_index, Obj_SemiSolidBlock);
    }
    else {
        return plataformaQueEstou.object_index == Obj_movingSSB 
        || object_is_ancestor(plataformaQueEstou.object_index, Obj_movingSSB);
    }
     
}

// Sprites
maskSprStanding = spr_colision_player_idle;  // Mask pra quando o player estiver em pé (pulando, andando ou parado)
maskSprCrouch = spr_colision_player_crouch; // Mask pra quando o player estiver no modo carro
sprIdle = Spr_player;
sprWalk = Spr_player_walk;
sprJump = Spr_player_jump;
sprFall = Spr_player_fall;
sprCrouch = Spr_player_abaixa;
sprHit = Spr_player_hit;
sprDead = Spr_player_dead;

spritePuloBuffer = 20;
spritePuloTimer = 0;

// Configuração dos controles
controlsSetup();

facing = 1; // Direção que o player estará olhando na sprite (-1 -> esquerda, 1 -> direita)
moveDir = 0; // Direção do movimento (-1 -> esquerda, 0 -> parado, 1 -> direita)
velMove =  3;

// Velocidade de movimento nos eixos
xspd = 0;
yspd = 0;
  
// Pulo
    grav = 0.3;
    vel_terminal = 10; // Velocidade terminal da queda
    
    jumpSpd = -7;
    qtdMaxPulos = 2;
    qtdPulos = 0; // Indica quantos pulos foram feitos
    noChao = true; // Indica se o player está encima de um piso
    pulou = false; // Verificação se o player pulou pra mudar a sprite

// Buffer de tempo de queda
    // Buffer pra cair de uma plataforma
        bufferFramesQueda = 3;
        bufferQuedaTimer = 0;
    // Buffer pra poder dar o primeiro pulo sem perder o segundo
        bufferFramesPulo = 5;
        bufferPuloTimer = 0;

agachar = false; // Indica se o player está agachado

vidas = 1 // Começa com apenas uma vida e aumenta conforme coleta os raios

// Plataformas móveis
plataformaQueEstou = noone; // Indica a plataforma móvel que está no pé do player
platMovelXspd = 0;
platMovelYspMax = vel_terminal // O quão rápido o player segue a plataforma se movendo pra baixo