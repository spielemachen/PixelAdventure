extends Node2D

var player_scene = preload("res://scenes/player/player.tscn")
@onready var spawn_point = get_tree().get_first_node_in_group("PlayerSpawnPoint")

func _ready():
	var player = player_scene.instantiate()
	add_child(player)
	player.global_position = spawn_point.global_position
	
