extends Node


var screen_size setget, _get_view_size
var main_node setget , _get_main_node

var score = 0 


func create_timer(wait_time):
	var timer = Timer.new()
	timer.set_wait_time(wait_time)
	timer.set_one_shot(true)
	timer.connect("timeout", timer, "queue_free")
	add_child(timer)
	timer.start()
	return timer

func _get_view_size():
	return get_tree().get_root().get_visible_rect().size
	pass
func _get_main_node():
	var root = get_tree().get_root()
	return root.get_child( root.get_child_count()-1 )

func get_node_by_name(name):
	var root = get_tree().get_root()
	return root.get_node("Main" + "/" + name)
