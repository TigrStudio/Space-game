extends Node2D


onready var anim       := get_node("AnimationPlayer")
onready var blast_snd  := get_node("blast")

func _ready():
	anim.play("explosion")
	blast_snd.play()
	yield(blast_snd,"finished")
	queue_free()

