// Alterações se estiver agachado
if agachar {
    jumpSpd = -5;
    velMove = 4;
}
else { // Não está agachado
    jumpSpd = -7;
    velMove = 3;
}


// Pegar os movimentos
getControls();


// Movimenta no eixo X
    // Verifica a direção
    moveDir = rightKey - leftKey;
    /*
    rightKey = 0 & leftKey = 0  |  moveDir = 0 (parado)
    rightKey = 0 & leftKey = 1  |  moveDir = -1 (vai pra esquerda)
    rightKey = 1 & leftKey = 0  |  moveDir = 1 (vai pra direita)
    rightKey = 1 & leftKey = 1  |  moveDir = 0 (parado)
    */
    
    // Atualiza a direção que o player está olhando
    if moveDir != 0 { facing = moveDir; }
    
    xspd = moveDir * velMove;
    
    // Colide com a parede perfeitamente
    var _subPixel = 0.5; // Valor de meio pixel para verificar quao longe da parede está
    if place_meeting(x + xspd, y, Obj_block) {
        // Encosta precisamente na parede
        var _pixelCheck = _subPixel * sign(xspd);
        while !place_meeting(x + _pixelCheck, y, Obj_block) {
            x += _pixelCheck;
        }
        xspd = 0;
    }

    // Mecanica do vento
    _inst = Obj_Tempestade; // Inicia a tempestade
    
    if(instance_exists(_inst)) {
        var _tempestade = _inst.tempestade_ativa;
        
        if (!agachado) {
            xspd -= _inst.forca_tempestade * 0.8;
            
            velocidade_movimento = lerp(4,2,_inst.forca_tempestade);
        }
    }
    
    x += xspd;


// Movimenta no eixo Y
    // Gravidade
        // Se o timer do buffer não acabou não aplicar gravidade até ele acabar
         if bufferQuedaTimer > 0 {
            bufferQuedaTimer--;
        }
        else {
            // O buffer acabou, aplica a gravidade no player
            yspd += grav;
            if yspd > vel_terminal { yspd = vel_terminal; }
            setNoChao(false);
        }
    
    // Verifica se o pulo começa no chão
    if noChao { 
        qtdPulos = 0;
        bufferPuloTimer = bufferFramesPulo;
    }
    // Se o player está no ar
    else {
        // Se o player estiver no ar e não tiver pulado ainda, perde o primeiro pulo
        bufferPuloTimer--;
        if qtdPulos == 0 && bufferPuloTimer <= 0 {
            qtdPulos = 1;
        }
    }
    
    // Pula
    if jumpKeyBuffered && qtdPulos < qtdMaxPulos { 
        
        // Reseta o buffer
        jumpKeyBuffered = false;
        jumpKeyBufferedTimer = 0;
        
        // Aumenta a quantia de pulos realizados
        qtdPulos++;
        
        // noChao = false
        pulou = true;
        setNoChao(false);
        
        yspd = jumpSpd;
    }
    
    // Colide com o chão ou o teto com precisão (sólido)
    var _subPixel = 0.5;
    if place_meeting(x, y + yspd, Obj_block) {
        var _pixelCheck = _subPixel * sign(yspd);
        while !place_meeting(x, y + _pixelCheck, Obj_block) {
            y += _pixelCheck;
        }
        // Colide com o bloco
        yspd = 0;
    }
    
    // Verifica se o player está no chão (sólido)
    if yspd >= 0 && place_meeting(x, y+1, Obj_block) {
        setNoChao(true);
    }
    
    y += yspd;




// Maquina de estados
    // Player agachado
    if crouchKey {
        agachar = true;
    }
    else {
        // Verifica se não tem um teto acima do jogador para parar de agachar
        if agachar && place_meeting(x, y-16, Obj_block) {
            // Se tiver um teto mantem agachado
            agachar = true; 
        }
        else { agachar = false; }
    }
    
    // Player invunerável (tomou dando)
    
    
    // Player morreu




// Modificações de sprite
    // Andando
    if abs(xspd) > 0 { sprite_index = sprWalk; }
    // Parado
    if abs(xspd == 0) { sprite_index = sprIdle; }
    if !noChao {
        // Se o player estiver agachado não será usada as sprites em pé
        if !agachar {
            // Coloca a mascara correta nas sprites
            mask_index = maskSprStanding;
            // Pulando
            if yspd < 0 {
                sprite_index = sprJump;
                // Para a sprite na imagem com o braço pra cima
                if image_index >= image_number - 1 { 
                    image_index = image_number-1; 
                }
            }
            // Caindo
            else { sprite_index = sprFall; }
        }
    }
    // Agachado
    if agachar {
        // Arrumar a mascara para o player agachado
        mask_index = maskSprCrouch;
        sprite_index = sprCrouch;
    }

