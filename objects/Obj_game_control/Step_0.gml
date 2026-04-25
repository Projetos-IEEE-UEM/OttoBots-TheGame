// Aqui é onde a parte de reset da fase entra em ação - ele normalmente é acionado por algum outro elemento, mas também está associado a aluns botões como é
// possível ver no código abaixo. - Bruno

if resetar_fase == true { // Se a flag "resetar_fase" for ativa...
	room_restart(); // ... resete a sala na qual o jogador se encontra.
	resetar_fase = false; // Abaixe a flag de resete para false de novo, pois ela é permanente;
	global.vida = 1; // Resete as vidas do Otto para este valor.
}

if keyboard_check_released(ord("J")) or gamepad_button_check(0, gp_select){ // Caso o botão "J" ou o botão select de um controle seja pressionado...
	room_restart(); // resete a sala na qual o jogador se encontra.
}

if keyboard_check_pressed(vk_escape) { // Análogo ao anterior, mas desta vez com todo o game em vez da sala, ao pressionar a tecla "ESC".
    game_restart();
}