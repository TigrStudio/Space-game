extends Control

const stage := preload("res://source/stage/Main.tscn")

onready var start_btn := get_node("Start_btn")
onready var exit_btn  := get_node("Exit_btn")
onready var gui_snd   := get_node("gui_snd")
onready var score     := get_node("Score")

func _ready():
	start_btn.visible = true
	exit_btn.visible = true
	score.text = str(Utils.score)
	
func _on_Start_btn_pressed():
	Utils.score = 0
	gui_snd.play()
	yield(gui_snd,"finished")
	return get_tree().change_scene_to(stage)

func _on_Exit_btn_pressed():
	gui_snd.play()
	var _x = OS.shell_open("https://itch.io/")


func _on_Twitter_button_up():
	gui_snd.play()
	var _x = OS.shell_open("https://twitter.com/huzaifa_here")

func _on_Itch_button_up():
	gui_snd.play()
	var _x = OS.shell_open("https://mohd-huzaifa-choudhary.itch.io/")

func _on_Insta_button_up():
	gui_snd.play()
	var _x = OS.shell_open("https://www.instagram.com/")
