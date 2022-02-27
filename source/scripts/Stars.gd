extends Node2D


export (int) var speed_close_start := 10
export (int) var speed_far_start   := 2

onready var star_close_1  := get_node("star_close")
onready var star_close_2  := get_node("star_close2")
onready var star_close_3 := get_node("star_close3")
onready var star_far_1    := get_node("star_far")
onready var star_far_2    := get_node("star_far2")
onready var star_far_3    := get_node("star_far3")

var init_pos := -180

func _process(delta):
	if star_close_1.position.y > Utils.screen_size.y:
		star_close_1.position.y = init_pos
	if star_close_2.position.y > Utils.screen_size.y:
		star_close_2.position.y = init_pos
	if star_close_3.position.y > Utils.screen_size.y:
		star_close_3.position.y = init_pos
	
	if star_far_1.position.y > Utils.screen_size.y:
		star_far_1.position.y = init_pos
	if star_far_2.position.y > Utils.screen_size.y:
		star_far_2.position.y = init_pos
	if star_far_3.position.y > Utils.screen_size.y:
		star_far_3.position.y = init_pos
	move(delta)
	
	
	
func move(time):
	star_close_1.position.y += speed_close_start*time
	star_close_2.position.y += speed_close_start*time
	star_close_3.position.y += speed_close_start*time
	star_far_1.position.y += speed_far_start*time
	star_far_2.position.y += speed_far_start*time
	star_far_3.position.y += speed_far_start*time
