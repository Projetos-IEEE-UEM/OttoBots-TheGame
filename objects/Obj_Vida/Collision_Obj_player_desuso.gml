// Aqui simplemente configuramos como funciona a interação entre o player e o pickup de vida. -Bruno
// O maximo de vida permito é 4, portanto, se o player tiver mais que 4 vidas, nada acontecerá devido ao "if" abaixo.
if global.vida < 4 { // Se o player tem menos que 4 vidas...
	global.vida++; //Incrementa a vida do player
	instance_create_layer(x, y, layer, Obj_Vida_Coletada) // Cria-se uma instância da animação de coleta de vida;
	instance_destroy(self) // Destroi-se a instância da vida que acabou de ser coletada.
}








