extends Area2D

const coin_scn  := preload("res://source/scenes/Coin.tscn")
const blast_scn := preload("res://source/scenes/Blast.tscn")

export (Vector2) var velocity := Vector2()
var health := 100
onready var hit_snd := get_node("hit")
func _ready():
	$vis_not.connect("screen_exited",self,"queue_free")


func _process(delta):
	position += velocity*delta
	
	if health <= 0:
		var new_coin = coin_scn.instance()
		var new_blast = blast_scn.instance()
		new_blast.position = position
		new_coin.position = position
		Utils.get_node_by_name("Bullet_container").add_child(new_coin)
		Utils.get_node_by_name("Bullet_container").add_child(new_blast)
		queue_free()

func _on_Enemy_body_entered(body):
	if body.is_in_group("player"):
		var new_blast = blast_scn.instance()
		new_blast.position = position
		Utils.get_node_by_name("Bullet_container").add_child(new_blast)
		hit_snd.play()
		visible = false
		body.health -= 50
		yield(hit_snd,"finished")
		queue_free()
