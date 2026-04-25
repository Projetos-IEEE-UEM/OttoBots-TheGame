// Basicamente, o que acontece aqui é um check para quando o jogador está próximo a porta e aperta o botão de interação perto dela:
if place_meeting(x,y, Obj_player) and (keyboard_check(ord("E")) or gamepad_button_check_pressed(0, gp_padu)){  // Se o jogador está próximo a porta e aperta
	// o botão de interação...
	room_goto_next(); // ... Vá para a próxima sala!
}

