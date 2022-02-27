extends Node


const ENEMY_WIDTH       := 16
const ENEMY_HEIGHT      := 16
const OFFSET_X          := 8
const scn_enemy_clever  := preload("res://source/enemy/Enemy_clever.tscn")
const scn_enemy_mad     := preload("res://source/enemy/Enemy_mad.tscn")

var pos_clever := Vector2()
var pos_mad    := Vector2()

onready var cont := get_node("container")

func initial_pos():
	randomize()
	pos_clever.x = rand_range(ENEMY_HEIGHT + OFFSET_X,Utils.screen_size.x - ENEMY_HEIGHT)
	pos_clever.y = -ENEMY_HEIGHT*1.5
	pos_mad.x = rand_range(ENEMY_HEIGHT + OFFSET_X,Utils.screen_size.x - ENEMY_HEIGHT)
	pos_mad.y = -ENEMY_HEIGHT*1.5
	
	return [pos_clever , pos_mad]
	
func spawn_clever_enemy(pos_c:Vector2):
	var new_clever_enemy = scn_enemy_clever.instance()
	new_clever_enemy.position = pos_c
	cont.add_child(new_clever_enemy)
	
func spawn_mad_enemy(pos_m:Vector2):
	var new_mad_enemy = scn_enemy_mad.instance()
	new_mad_enemy.position = pos_m
	cont.add_child(new_mad_enemy)
	
func _on_timer_clever_enemy_timeout():
	spawn_clever_enemy(initial_pos()[0])
	
func _on_timer_mad_enemy_timeout():
	spawn_mad_enemy(initial_pos()[1])
