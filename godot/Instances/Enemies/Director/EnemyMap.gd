extends Node

var Enemies

@export var triangle: PackedScene
@export var square: PackedScene

var enemy_map

var enemy_queue_data = []
var enemy_queue = []

func _ready():
	enemy_map = {
		Enums.ENEMIES.TRIANGLE: triangle,
		Enums.ENEMIES.SQUARE: square
	}

func get_enemy_template(type: int) -> PackedScene:
	assert(type in Enums.ENEMIES)
	return enemy_map[type]
