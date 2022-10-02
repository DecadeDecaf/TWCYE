image_angle += 6

image_xscale += sizevel
image_yscale += sizevel

sizevel -= 0.025

if (image_xscale <= 0) {
	instance_destroy()
}