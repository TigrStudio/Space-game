extends Sprite

func _ready():
	get_node("anim").play("Flare")
	yield(get_node("anim"),"animation_finished")
	queue_free()
