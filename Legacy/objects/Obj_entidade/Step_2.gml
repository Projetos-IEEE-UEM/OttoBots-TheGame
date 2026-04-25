if(global.pause){
	image_speed = 0;
	exit
}
else{
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
