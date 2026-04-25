/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if resetar_fase == true {
	room_restart();
	//Como o objeto é persistente, sempre fica com as alteracoes, entao devo voltar ao estado de resetar = false
	resetar_fase = false;
	global.vida = 1;
}

if keyboard_check_released(ord("J")) or gamepad_button_check(0, gp_select){
	room_restart();
}