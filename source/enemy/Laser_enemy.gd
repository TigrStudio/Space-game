extends Area2D

export (Vector2) var velocity = Vector2(0,0) 

onready var hit_snd := get_node("hit")

func _process(delta):
	position += velocity*delta   # same as translate(velocity*delta)

	if position.y > Utils.screen_size.y :
		queue_free()
	


func _on_Laser_enemy_body_entered(body):
	if body.is_in_group("player"):
		visible = false
		body.health -= 25
		hit_snd.play()
		yield(hit_snd,"finished")
		queue_free()


