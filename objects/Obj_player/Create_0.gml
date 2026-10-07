// Estados do jogador
enum PlayerState {
    Idle,
    Walking,
    Crouching,
    Hit,
    Dead
}

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

/*
Tenta atravessar a plataforma semisólida em que o player está.
Retorna true se conseguiu descer.
*/
function descerPlataforma() {
    // Só vale se estiver em cima de uma semisólida
    if !instance_exists(plataformaQueEstou) || !estouSemiSolida() { return false; }

    // Guarda a velocidade da plataforma antes do setNoChao(false) esquecê-la
    var _yPlat = plataformaQueEstou.yspd;

    // Quanto afundar: no mínimo 2px, mais se a plataforma estiver subindo
    var _desce = max(2, 1 - _yPlat);

    // Não desce se houver um bloco sólido logo abaixo
    if place_meeting(x, y + _desce + max(0, _yPlat), Obj_block) { return false; }

    y += _desce;
    yspd = max(yspd, _yPlat + 1); // herda a descida da plataforma para ela não "pegar" o player de volta
    setNoChao(false);
    return true;
}

// Funções de Dano

/*
Faz com que o player quique (la ele) depois de matar um inimigo, ou sofrer dano
*/
function playerBounce(_dano = false) {
    if _dano {
        var _dir = (moveDir == 0) ? facing : moveDir;
        xspd = knockbackSpd * (-_dir);
        yspd = knockbackYspd;
        knockbackTimer = knockbackFrames;
    }
    else {
        xspd = 3 * moveDir;
        yspd = jumpSpd + 2;
    }
    setNoChao(false);
}

/*
Diminui *vidas* do player conforme ele tome dano fora do intervalo de 
ivunerabilidade 
*/
function tomarDano(_bounce = true) {
    // Invulnerável ou já morto: ignora
    if dmgTimer > 0 || currentState == PlayerState.Dead { return; }

    vidas--;
    dmgTimer = dmgBuffer;
    if _bounce { playerBounce(true); }
    currentState = (vidas <= 0) ? PlayerState.Dead : PlayerState.Hit;
}

/*
Retorna true se o player estiver encostando (ou sobrepondo) um bloco de dano.
Checa 1 pixel de folga nos 4 lados porque blocos sólidos nunca se sobrepõem.
*/
function tocandoBlocoDano() {
    return place_meeting(x, y, Obj_block_dano)
        || place_meeting(x + 1, y, Obj_block_dano)
        || place_meeting(x - 1, y, Obj_block_dano)
        || place_meeting(x, y + 1, Obj_block_dano)
        || place_meeting(x, y - 1, Obj_block_dano);
}

// Funções de Estado

// Atualiza *currentState* 
function atualizarEstado() {
    // Se algo externo zerar a vida (espinhos), também morre
    if vidas <= 0 { currentState = PlayerState.Dead; }
    // Dead é terminal: nada tira o player daqui
    if currentState == PlayerState.Dead { return; }

    var _tetoAcima = place_meeting(x, y - 16, Obj_block);
    agachar = crouchKey || (agachar && _tetoAcima);

    if dmgTimer > 0 {
        dmgTimer--;
        currentState = PlayerState.Hit;
    }
    else if agachar {
        currentState = PlayerState.Crouching;
    }
    else if moveDir != 0 {
        currentState = PlayerState.Walking;
    }
    else {
        currentState = PlayerState.Idle;
    }
}

/*
Atualiza os valores do player de acordo com seu *currentState*
*/
function aplicarParametrosDoEstado() {
    switch currentState {
        case PlayerState.Idle:
        case PlayerState.Walking:
            velMove = 3;
            jumpSpd = -7;
            break;
        case PlayerState.Crouching:
            jumpSpd = -5;
            velMove = min(velMove + 0.2, velMax);
            break;
        case PlayerState.Hit:
            velMove = 0.3;
            jumpSpd = -4;
            break;
        case PlayerState.Dead:
            velMove = 0;
            break;
    }
}

// Funções de Sprite

/*
Atualiza a sprite do jogador de acordo com o *currentState*
*/
function atualizarSprite() {
    // A máscara depende só de estar agachado ou não
    mask_index = agachar ? maskSprCrouch : maskSprStanding;

    switch currentState {
        case PlayerState.Dead:
            if sprite_index != sprDead {
                sprite_index = sprDead;
                image_index = 0; // começa a animação de morte do início
            }
            if image_index >= image_number - 1 {
                image_speed = 0;                  // congela no último frame
                image_index = image_number - 1;
                image_alpha -= 0.05;              // só então faz o fade
            }
            break;

        case PlayerState.Hit:
            sprite_index = sprHit;
            break;

        case PlayerState.Crouching:
            sprite_index = sprCrouch;
            if moveDir == 0 { image_index = 1; }
            break;

        default: // Idle e Walking
            sprite_index = (abs(xspd) > 0) ? sprWalk : sprIdle;

            if !noChao {
                if yspd < 0 {
                    sprite_index = sprJump;
                    if image_index >= image_number - 1 {
                        image_index = image_number - 1;
                    }
                }
                else { sprite_index = sprFall; }
            }
            break;
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

currentState = PlayerState.Idle;

facing = 1; // Direção que o player estará olhando na sprite (-1 -> esquerda, 1 -> direita)
moveDir = 0; // Direção do movimento (-1 -> esquerda, 0 -> parado, 1 -> direita)
velMove = 3;

// Velocidade de movimento nos eixos
xspd = 0;
yspd = 0;
  
// Pulo
    grav = 0.3;
    velTerminal = 10; // Velocidade terminal da queda
    
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

agachar = false;

// Começa com apenas uma *vidas* e aumenta até *maxVidas* conforme coleta os raios
vidas = 1;
maxVidas = 4;
dmgTimer = 0;
dmgBuffer = 120;

// Knockback ao tomar dano
knockbackTimer = 0;
knockbackFrames = 12; // por quantos frames o empurrão dura
knockbackSpd = 5;     // velocidade horizontal inicial
knockbackYspd = -5.5;   // impulso vertical, independente do estado

moedas = 0;

// Plataformas móveis
plataformaQueEstou = noone; // Indica a plataforma móvel que está no pé do player
platMovelXspd = 0;
platMovelYspMax = velTerminal // O quão rápido o player segue a plataforma se movendo pra baixo]

// Aceleração
framesAcel = 10; // A cada 60, se passa um segundo
velAcel = 0.3;
velMax = 4;