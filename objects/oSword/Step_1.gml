x = oPlayer.x;
y = oPlayer.y + 10;

// points sword towards mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

// shooting
firingDelay -= 1;
recoil = max(0, recoil - 1);
if (mouse_check_button(mb_left) && firingDelay < 0) {
	firingDelay = 10;
	recoil = 8;
	ScreenShake(2, 10);
	with (instance_create_layer(x, y, "Shots", oShot)) {
		speed = 25;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

// position for recoil
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

// flip image if pointing to the left
if (image_angle > 90 && image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}