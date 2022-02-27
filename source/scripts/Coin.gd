extends Area2D

signal increase_score

const WIDHT := 16
export var speed := 25
onready var anim := get_node("coin")

func _ready():
	anim.play("rotate")
func _process(delta):
	if position.y  > Utils.screen_size.y + WIDHT*1.5:
		queue_free()
	position.y += speed*delta
	
func _on_Coin_body_entered(body):
	connect('increase_score',body,"send_increase_signal")
	emit_signal("increase_score")
	queue_free()
