extends Area2D

const WIDHT := 16

export var speed := 25
onready var sound := get_node("snd")

func _process(delta):
	if position.y  > Utils.screen_size.y + WIDHT*1.5:
		queue_free()
	position.y += speed*delta
	
#
#func _on_Power_up_healt_body_entered(body):	




func _on_Power_ups_body_entered(body):
	if body.health <= 0:
		return
	body.health = 100
	sound.play()
	$Shape.set_deferred("disabled",true)
	visible = false
	yield(sound,"finished")
	queue_free() 
