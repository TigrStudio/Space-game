extends KinematicBody2D

signal died
signal score_is_increased

var bullet_scn := preload("res://source/scenes/LaserPlayer.tscn") 

onready var screen_size       := get_viewport_rect().size
onready var bullet_container  := get_node("BULLET_CONTAINER")
onready var power_up_timer    := get_node("power_up_timer")

const WIDTH                   := 22.4
const HEIGHT                  := 22.4
const BULLET_OFFSET           := Vector2(0,5)

export (Vector2) var speed    := Vector2(200,200) 

var health := 100
var coins  := 0
var double_bullet_shot := false
#__________________________________functions________________________________________

func _ready():
	#______________setting initial values.
	position = Vector2(screen_size.x / 2 , screen_size.y - HEIGHT)

func _process(delta):
	
	
	if Input.is_action_pressed("right"):
		position.x += speed.x*delta
	elif Input.is_action_pressed("left"):
		position.x -= speed.x*delta
	elif Input.is_action_pressed("up"):
		position.y -= speed.y*delta
	elif Input.is_action_pressed("down"):
		position.y += speed.y*delta
	
	
	#______________player movement.
	position.x = clamp(position.x , WIDTH/2 , screen_size.x - WIDTH/2)
	position.y = clamp(position.y , HEIGHT/2 ,  screen_size.y - HEIGHT/2)
	# velocity = move_and_slide(velocity)
	
	#______________checking if player is dead/alive.
	if health <= 0:
		emit_signal("died")
			
#____________________________shoting mech..
func shot():
	var new_bullet_right   = bullet_scn.instance()
	var new_bullet_middle  = bullet_scn.instance()
	var new_bullet_left    = bullet_scn.instance()

	new_bullet_right.position   = position + BULLET_OFFSET
	new_bullet_middle.position  = position + BULLET_OFFSET
	new_bullet_left.position    = position + BULLET_OFFSET
		
	new_bullet_left.velocity.x    = -15
	new_bullet_middle.velocity.x  = 0
	new_bullet_right.velocity.x   = 15
	
	new_bullet_left.create_flare(position + BULLET_OFFSET + Vector2(0,-15))
	
	bullet_container.add_child(new_bullet_right)	
	bullet_container.add_child(new_bullet_left)
	bullet_container.add_child(new_bullet_middle)
	

func double_shot():
	var new_bullet_right    = bullet_scn.instance()
	var new_bullet_right_2  = bullet_scn.instance()
	var new_bullet_middle   = bullet_scn.instance()
	var new_bullet_left     = bullet_scn.instance()
	var new_bullet_left_2   = bullet_scn.instance()

	new_bullet_right.position    = position + BULLET_OFFSET
	new_bullet_right_2.position  = position + BULLET_OFFSET
	new_bullet_middle.position   = position + BULLET_OFFSET
	new_bullet_left.position     = position + BULLET_OFFSET
	new_bullet_left_2.position   = position + BULLET_OFFSET
		
	new_bullet_left.velocity.x     = -16
	new_bullet_left_2.velocity.x   = -8
	new_bullet_middle.velocity.x   = 0
	new_bullet_right.velocity.x    = 8
	new_bullet_right_2.velocity.x  = 16
	
	new_bullet_left.create_flare(position + BULLET_OFFSET + Vector2(0,-15))
	
	bullet_container.add_child(new_bullet_right)
	bullet_container.add_child(new_bullet_right_2)
	bullet_container.add_child(new_bullet_middle)
	bullet_container.add_child(new_bullet_left)
	bullet_container.add_child(new_bullet_left_2)
	
	
func _on_shotting_delay_timeout():
	if double_bullet_shot:
		double_shot()
		return
	shot()

func send_increase_signal():
	emit_signal("score_is_increased")
	
func power_up_bullets():
	double_bullet_shot = true
	power_up_timer.start()
		
func set_final_value():
	double_bullet_shot = false
	
	
func _on_Touch_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenDrag:#InputEventMouseMotion:
		position = event.position#get_global_mouse_position()	
#----------------X----------------X----------------X----------------X----------------


func _on_power_up_timer_timeout():
	set_final_value()
