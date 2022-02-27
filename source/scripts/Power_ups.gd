extends Area2D

signal power_up

const WIDHT := 16

export var speed := 25
onready var sound := get_node("snd")

func _process(delta):
	if position.y  > Utils.screen_size.y + WIDHT*1.5:
		queue_free()
	position.y += speed*delta

func _on_Power_ups_body_entered(body):
	sound.play()	
	connect('power_up',body,"power_up_bullets")
	emit_signal("power_up")
	visible = false
	$Shape.set_deferred("disabled",true)
	yield(sound,"finished")
	queue_free()
