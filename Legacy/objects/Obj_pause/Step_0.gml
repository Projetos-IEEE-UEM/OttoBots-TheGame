//Vou definir que a tecla que pausa o jogo é a letra "P". Portanto:
if(keyboard_check_pressed(ord("P")) or gamepad_button_check_pressed(0, gp_start)){
	global.pause = !global.pause;
}
