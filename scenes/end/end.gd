extends Node2D

@export_file("*.tscn") var next_level: String

@onready var end_trigger = $EndTrigger as Area2D

func _ready():
	assert(next_level, "Level nicht gesetzt")
	end_trigger.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(next_level)
