extends Node

@export var score_data: Resource = ScoreData
#@export var level_data: Resource = LevelData

func _on_enemy_die():
	score_data._on_enemy_die()
