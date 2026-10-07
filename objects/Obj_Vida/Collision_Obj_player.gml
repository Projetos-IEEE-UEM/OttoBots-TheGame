if Obj_Player.vidas < Obj_Player.maxVidas { // Se o player tem menos que 4 vidas...
	Obj_Player.vidas++; //Incrementa a vida do player
	instance_create_layer(x, y, layer, Obj_Vida_Coletada) // Cria-se uma instância da animação de coleta de vida;
	instance_destroy(self) // Destroi-se a instância da vida que acabou de ser coletada.
}
