extends Area2D

const HEIGHT := 16
const flare_scn := preload("res://source/scenes/Flare.tscn")

export var velocity := Vector2(0,-600)

func fire(dt):
	position += velocity * dt 
	
func _process(delta):
	fire(delta)
	if global_position.y < -24:
		queue_free()
	
func _on_LaserPlayer_area_entered(area):
	if area.is_in_group("enemy"):
		area.health -= 25
		queue_free()
			
func create_flare(pos):
	var new_flare  = flare_scn.instance()
	new_flare.position = pos
	Utils.main_node.add_child(new_flare)
