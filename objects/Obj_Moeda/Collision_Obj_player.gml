// Aqui simplemente configuramos como funciona a interação entre o player e a moeda. -Bruno
instance_create_layer(x, y, layer, Obj_Coletada) // Caso haja colisão entre player e moeda, cria-se no objeto uma instância da animação "Obj_Coletada";
instance_destroy(self) //Destroi-se a moeda coletada;
Obj_game_control.coin++; // Incrementa-se o contador de moedas do objeto "game_control".