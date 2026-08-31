function controlsSetup() {
    jumpBufferTime = 5; // Atrasa tantos frames por input
    jumpKeyBuffered = 0; // Verifica se tem atraso no pulo
    jumpKeyBufferedTimer = 0; // Conta o tempo até chegar no bufferTime
}

function getControls() {
    // Inputs de direção
        // Recebe o input para direita, sendo "D", setinha pra direita, ou no controle para a direita
        rightKey = keyboard_check(ord("D")) + keyboard_check(vk_right) + gamepad_button_check(0, gp_padr);
            // Faz com que o valor minimo do input seja 0, e o máximo 1
            rightKey = clamp(rightKey, 0, 1);
         
        // Recebe o input para esquerda, sendo "A", setinha pra esquerda, ou no controle para a esquerda
        leftKey = keyboard_check(ord("A")) + keyboard_check(vk_right) + gamepad_button_check(0, gp_padl);
            leftKey = clamp(leftKey, 0, 1);
    
    // Inputs de ação
        // Pulo
            // Verifica se o botão de pulo foi pressionado apenas uma vez
            jumpKeyPressed = keyboard_check_pressed(vk_space) + gamepad_button_check_pressed(0, gp_face1);
                jumpKeyPressed = clamp(jumpKeyPressed, 0, 1);
           
            // Verifica se o botão de pulo continua sendo pressionado
            jumpKey = keyboard_check(vk_space) + gamepad_button_check(0, gp_face1);
                jumpKey = clamp(jumpKey, 0, 1);
           
            // Buffering do pulo 
            // (Se o pulo foi pressionado alguns frames antes de chegar no chão, pula novamente)
            if jumpKeyPressed {
                jumpKeyBufferedTimer = jumpBufferTime;
            }
            if jumpKeyBufferedTimer > 0 {
                jumpKeyBuffered = 1;
                jumpKeyBufferedTimer--;
            }
            else {
                jumpKeyBuffered = 0;
            }
        
        // Agachar
            crouchKey = keyboard_check(ord("S")) + keyboard_check(vk_down) + gamepad_button_check(0, gp_face3);
                crouchKey = clamp(crouchKey, 0, 1);
    
            crouchKeyPressed = keyboard_check_pressed(ord("S")) + keyboard_check_pressed(vk_down) + gamepad_button_check_pressed(0, gp_face3);
                crouchKeyPressed = clamp(crouchKeyPressed, 0, 1);
}

