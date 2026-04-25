draw_self();
draw_text(x, y, pulo);
draw_text(x, y+10, direcao);
//draw_text(x,y+20, contador);
//draw_text(x, y+30, vidas);
//draw_text(x, y+40, xspd);
draw_text(x, y-60, parede);
//draw_text(x, y-80, estado);

if x - Obj_player.x > 0{
	direcao = -1;
}
//Caso contrário, vou a esquerda.
else{
	direcao = 1;
}