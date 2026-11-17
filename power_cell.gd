class_name EnergyCell
extends Area2D


#when player gets close to the cell, start sliding towards the position of the player. Once collected shoot off a signal to the door to establish that one cell has been collected
@export var speed: float = 200.0
var player: Node2D = null

signal collected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if player:
		# Calculate direction vector from Area2D to player
		var direction = global_position.direction_to(player.global_position)
		# Move the Area2D towards the player
		global_position += direction * speed * delta

func _on_collection_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body


func _on_body_entered(_body: Node2D) -> void:
	collected.emit()
	queue_free()
