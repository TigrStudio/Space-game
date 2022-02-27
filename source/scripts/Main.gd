extends Node


const health_up         :=  preload("res://source/scenes/Power_up_health.tscn")
const bullet_double     :=  preload("res://source/scenes/Power_up_bullet.tscn")
onready var power_timer :=  get_node("power_ups_container/power_up_timer") 

onready var score_label          := get_node("Score/Label")
onready var enemy_clever_timer   := get_node("enemy_spanner/timer_clever_enemy")
onready var enemy_mad_timer      := get_node("enemy_spanner/timer_mad_enemy")
onready var player               := get_node("PlayerShip")
onready var armor                := get_node("armor")
onready var red_rect             := get_node("RED_bg/ColorRect")
onready var red                  := get_node("RED_bg")
onready var red_twin             := get_node("RED_bg/Tween")
onready var power_up_cont        := get_node("power_ups_container")

onready var music                := get_node("sounds/Music")
onready var pick_coin_snd        := get_node("sounds/coin_snd")

var score  =  0 setget , new_score


func _ready():
	red_rect.visible = false
	randomize()
	music.play()
	
func _process(_delta):
	if score > 20 and score < 40:
		enemy_clever_timer.wait_time = 1.5
		enemy_mad_timer.wait_time = 1.5
	elif score > 40 and score < 60:
		enemy_clever_timer.wait_time = 1
		enemy_mad_timer.wait_time = 1
	elif score > 60 and score < 80:
		enemy_clever_timer.wait_time = 0.5
		enemy_mad_timer.wait_time = 0.5
	elif score > 80:
		enemy_clever_timer.wait_time = 0.25
		enemy_mad_timer.wait_time = 0.25
		
	#________________________________________________________________________
	armor.region_rect.position.x = (player.health / 25) * 47
		
func _on_PlayerShip_died():
	red_rect.visible = true
	red.start_anim()
	yield(red_twin,"tween_completed")	
	get_tree().change_scene("res://source/ui/HUD.tscn")
	
func new_score():
	pick_coin_snd.play()
	score += 1
	Utils.score += 1
	var scr = str(score)
	score_label.text = scr
	
func _on_PlayerShip_score_is_increased():
	new_score()

func _on_power_up_timer_timeout():
	if randf() > 0.5:
		var new_health_power = health_up.instance()
		new_health_power.position = Vector2(rand_range(64,Utils.screen_size.x),-64)
		power_up_cont.add_child(new_health_power)
		return
	var new_bullet_power = bullet_double.instance()
	new_bullet_power.position = Vector2(rand_range(64,Utils.screen_size.x),-64)
	power_up_cont.add_child(new_bullet_power)
