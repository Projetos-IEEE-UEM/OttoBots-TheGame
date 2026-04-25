// Como todo bom pause, queremos que ele aconteça de acordo com um botão. Neste caso, defini o "P" como o botão de pause do jogo, ou o "start" de um controle
// conectado ao PC. -Bruno
if(keyboard_check_pressed(ord("P")) or gamepad_button_check_pressed(0, gp_start)){ // Caso alguém pressione alguma dessas teclas, a variável abaixo muda de
	// estado.
	global.pause = !global.pause; // Esta variável recebe seu estado oposto, acionando a sequência de pausa.
}
