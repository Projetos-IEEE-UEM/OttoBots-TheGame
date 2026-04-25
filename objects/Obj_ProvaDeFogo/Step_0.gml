// Os objetos dentro desta pasta funcionam como transição para diferentes salas dentro do jogo. Neste caso,
// Caso o jogador pressione E ou o botão em seu controle, ele deve ser teletrtansportado para outra sala
// dentro do jogo -Bruno
if (keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(0, gp_padu)) and (distance_to_object(Obj_player) < 30) {
	room_goto(ProvaDeFogo);
}