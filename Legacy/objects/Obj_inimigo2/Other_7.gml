/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if sprite_index == Spr_inimigo2_Dano {
	image_index = image_number-1
	morto = true;
}

//Se ele morreu, eu travo o sprite da animacao de morte no ultimo 
if sprite_index == Spr_inimigo2_Morre {
	//Destruo o objeto
	instance_destroy(self);
}




