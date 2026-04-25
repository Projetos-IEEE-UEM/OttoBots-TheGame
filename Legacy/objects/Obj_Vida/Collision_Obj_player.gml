/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//O maximo de vida permito é 4
if global.vida < 4 {
	//Incrementa a vida do player
	global.vida++;
	
	//Cria a animacao de vida coletada
	instance_create_layer(x, y, layer, Obj_Vida_Coletada)

	//Destroi-se
	instance_destroy(self)
}








