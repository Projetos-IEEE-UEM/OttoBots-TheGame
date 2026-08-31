// Pegar os movimentos
getControls();


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
    // Alterações se estiver agachado
   if agachar {
       jumpSpd = -5;
       velMove += 0.2
       if velMove > velMax { // Aceleração
           velMove = 4;
       }
   }
   else { // Não está agachado
       jumpSpd = -7;
       velMove = 3;
   }
    
    // Player invunerável (tomou dando)
    
    
    // Player morreu




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
    //_inst = Obj_Tempestade; // Inicia a tempestade
    
    //if(instance_exists(_inst)) {
    //    var _tempestade = _inst.tempestade_ativa;
    //    
    //    if (!agachar) {
    //       xspd -= _inst.forca_tempestade * 0.8;
    //        
    //        velMove = lerp(4,2,_inst.forca_tempestade);
    //    }
    //}
    
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
    
    // Colide com o teto com precisão
    var _subPixel = 0.5;
    if place_meeting(x, y + yspd, Obj_block) {
        var _pixelCheck = _subPixel * sign(yspd);
        while !place_meeting(x, y + _pixelCheck, Obj_block) {
            y += _pixelCheck;
        }
        // Colide com o bloco
        yspd = 0;
    }
    
    // Player colide com o chão
        // Verifica se o player está em uma plataforma semisolida ou sólida
        var _clampYspd = max(0, yspd);
        
        // Verifica todas as plataformas que o player está colidindo
            /* Essa lista é uma lista encadeada com as plataformas que colidem com o 
            player, precisa liberar a memoria dela dps */
            var _listaPlatColide = ds_list_create(); 
            
            // Esse aqui é um array com os diferentes tipos de plataformas que podemos colidir
            var _arrayPlat = array_create(0);
            array_push(_arrayPlat, Obj_block, Obj_SemiSolidBlock);
            
            // Faz a verificação e coloca na lista _listaPlatColide 
            var _tamLista = instance_place_list(x, y+1 +_clampYspd + platMovelYspMax, _arrayPlat, _listaPlatColide, false);
            
            // Verifica todas as instancias da lista e retorna uma que a parte de cima está abaixo do player
            for (var i = 0; i < _tamLista; i++) {
                // Coleta uma instancia de Obj_block ou Obj_SemiSolidBlock da lista
                var _instLista = _listaPlatColide[| i]; // Forma de pegar o indice em uma lista [| pos]
                
                // Evita uma magnetização do chão (o player grudar bruscamente no chão)
                if ((_instLista.yspd <= yspd || instance_exists(plataformaQueEstou))
                    && (_instLista.yspd > 0 || place_meeting(x, y+1 + _clampYspd, _instLista))){
                    // Retorna as instancias de Obj_block ou Obj_SemiSolidBlock
                    if (_instLista.object_index == Obj_block 
                        || object_is_ancestor(_instLista.object_index, Obj_block)
                        || floor(bbox_bottom) <= ceil(_instLista.bbox_top - _instLista.yspd) )  
                    {
                        // Retorna a "mais alta"
                        if (!instance_exists(plataformaQueEstou) ||
                            _instLista.bbox_top + _instLista.yspd <= plataformaQueEstou.bbox_top + plataformaQueEstou.yspd ||
                            _instLista.bbox_top + _instLista.yspd <= bbox_bottom) {
                            plataformaQueEstou = _instLista;
                        }
                    }
                }
            }
            // Destroi a lista pra não ter memory leak
            ds_list_destroy(_listaPlatColide);
            
            // Ultima checagem se o chão está nos pés do player
            if (instance_exists(plataformaQueEstou) && !place_meeting(x, y + platMovelYspMax, plataformaQueEstou)) {
                plataformaQueEstou = noone;
            }
            
            // Cai na plataforma
            if (instance_exists(plataformaQueEstou)) {
                // Colide com o chão precisamente
                _subPixel = 0.5;
                while (!place_meeting(x, y+_subPixel, plataformaQueEstou) && 
                    !place_meeting(x, y, Obj_block)) {
                        y += _subPixel;
                    }
                // Ter certeza que não estamos abaixo da plataforma semisolida
                if estouSemiSolida() {
                        while (place_meeting(x, y, plataformaQueEstou)) {y -= _subPixel; }
                    }
                // Colocar o y no valor do piso de y
                y = floor(y);
                
                // Colide com o chão
                yspd = 0;
                setNoChao(true);
            }
            
    if crouchKey && jumpKeyPressed {
        if instance_exists(plataformaQueEstou) && estouSemiSolida() {
            var _yCheck = y + max(1, plataformaQueEstou.yspd + 1);
            if !place_meeting(x, _yCheck, Obj_block) {
                
            }
        }
    }
    
    y += yspd;


// Parte final da movimentação e da colisão
    // Snapping no eixo X na plataformaQueEstou se ela está se movendo horizontalmente
    // Faz com que o player se mova junto com a plataforma no eixo X
    platMovelXspd = 0;
    if instance_exists(plataformaQueEstou) { platMovelXspd = plataformaQueEstou.xspd; }
    
    // Move com a plataforma
    if place_meeting(x + platMovelXspd, y, Obj_block) { 
        var _subPixel = 0.5;
        var _pixelCheck = _subPixel * sign(platMovelXspd);
        while !place_meeting(x + _pixelCheck, y, Obj_block) {
            x += _pixelCheck;
        }
        platMovelXspd = 0;
    }
    x += platMovelXspd
    
    // Snapping no eixo Y na plataformaQueEstou se ela está se movendo verticalmente
    // Faz com que o player se mova junto com a plataforma no eixo Y
    if instance_exists(plataformaQueEstou) && (plataformaQueEstou.yspd != 0 
        || estouSemiSolida(false)) 
    {
        if !place_meeting(x, plataformaQueEstou.bbox_top, Obj_block) 
        && (plataformaQueEstou.bbox_top >= bbox_bottom - platMovelYspMax) 
        {
            y = plataformaQueEstou.bbox_top;
        }
        
        // Bater a cabeça em uma parede enquanto está numa plataforma semisolida
        if plataformaQueEstou.yspd < 0 && place_meeting(x, y + plataformaQueEstou.yspd, Obj_block) {
            if estouSemiSolida() {
                // Empurra pra baixo na plataforma semisolida
                var _subPixel = 0.25;
                while (place_meeting(x, y + plataformaQueEstou.yspd, Obj_block)) { y += _subPixel; }
                // Se encontrou uma plataforma sólida enquanto estava empurrando pra baixo, empurra pra cima novamente
                while (place_meeting(x, y, Obj_block)) { y -= _subPixel; }
                y = round(y);
            }
            setNoChao(false);
        } 
    }



// Modificações de sprite
    // Andando
    if abs(xspd) > 0 { sprite_index = sprWalk; }

    // Parado
    if abs(xspd == 0) { sprite_index = sprIdle; }

    // Se o player estiver agachado não será usada as sprites em pé
    if !agachar {
        if !noChao {
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
    else {
        // Arrumar a mascara para o player agachado
        mask_index = maskSprCrouch;
        sprite_index = sprCrouch;
        // As rodas não podem se mexer se o player estiver parado
        if moveDir == 0 {
            image_index = 1;
        }
    }

