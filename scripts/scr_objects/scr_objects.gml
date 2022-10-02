function create_object(spr) {
	var obj = instance_create_depth(0, 0, 0, obj_object)
	obj.sprite_index = spr
}

function create_herring(spr) {
	var obj = instance_create_depth(0, 0, 0, obj_object)
	obj.sprite_index = spr
	obj.herring = true
}