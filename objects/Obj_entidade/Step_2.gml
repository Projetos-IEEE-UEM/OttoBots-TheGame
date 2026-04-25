// O objeto "entidade" é onde todo o código básico tem sua fundação e cuida de coisas como as colisões e a gravidade que agem sobre eles.
if(global.pause){ // Essa aqui é flag de pause que indica se o jogo está ou não pausado. Neste caso, ele faz com que o sprite do objeto em questão pare de
	// de se mexer e que toda sua programação seja interrompida.
	image_speed = 0; // Sprite para de se mexer;
	exit // Toda programação é interrompida.
}
else{ // Caso a flag seja abaixada, o jogo continua como antes. O único comando dentro deste bloco restaura o movimento dos sprites.
	image_speed = 1;
}

// COLISÃO HORIZONTAL
if(place_meeting(x + xspd, y, Obj_block)){
    while(abs(xspd) > .1){
        xspd *= .5;
        if(!place_meeting(x + xspd, y, Obj_block)) x += xspd;
    }
    xspd = 0;
}
x += xspd;

// COLISÃO VERTICAL
if(place_meeting(x, y + vel_movimento_vertical, Obj_block)){
    while(abs(vel_movimento_vertical) > .1){
        vel_movimento_vertical *= .5;
        if(!place_meeting(x, y + vel_movimento_vertical, Obj_block)) y += vel_movimento_vertical;
    }
    vel_movimento_vertical = 0;
}
y += vel_movimento_vertical;
