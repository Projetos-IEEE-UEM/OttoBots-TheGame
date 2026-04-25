/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Se o sprite dele for o de ter tomado dano, significa que ele morreu.
if sprite_index == Spr_Vyper_Dano {
	morto = true;
}

//Se ele morreu, eu travo o sprite da animacao de morte no ultimo 
if sprite_index == Spr_Vyper_Morre {
	instance_destroy(self);
}
