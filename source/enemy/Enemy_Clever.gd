extends "res://source/enemy/Enemy.gd"


const Width     := 10.8
const offset    := Vector2(0,10)

var  laser_scn := preload("res://source/enemy/Laser_enemy.tscn")



func _process(_delta):
	pass
#	if position.x > Utils.screen_size.x - Width:
#		velocity.x *= -1
#	elif position.x < Width:
#		velocity.x *= -1


func fire():
	var new_laser = laser_scn.instance()
	new_laser.position = position + offset
	Utils.get_node_by_name("Bullet_container").add_child(new_laser)


func _on_shotting_timer_timeout():
	fire()
