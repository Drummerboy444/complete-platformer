vsp = vsp + grv;

// Horizontal collision
if (place_meeting(x + hsp, y, oWall)) {
	while (!place_meeting(x + sign(hsp), y, oWall)) {
		x += sign(hsp);
	}
	hsp = -hsp;
}
x += hsp;

// Verticle collision
if (place_meeting(x, y + vsp, oWall)) {
	while (!place_meeting(x, y + sign(vsp), oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;


// Animation
if (!place_meeting(x, y + 1, oWall)) {
	image_speed = 0;
	sprite_index = sEnemyA;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
} else {
	image_speed = 0.6;
	if (hsp == 0) {
		sprite_index = sEnemy;
	} else {
		sprite_index = sEnemyR;
	}
}
if (hsp !=0) image_xscale = sign(hsp);
