extends CanvasLayer


onready var tween := get_node("Tween")
onready var rect := get_node("ColorRect")


func start_anim():
	tween.interpolate_property(rect,"modulate:a",1,0,0.5)
	tween.start()
