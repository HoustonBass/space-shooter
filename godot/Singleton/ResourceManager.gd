extends Node

@export var score_data: Resource = ScoreData
#@export var level_data: Resource = LevelData

signal LevelEnd

var spawn_count

func _on_enemy_die():
	score_data._on_enemy_die()
	if score_data.score == spawn_count:
		LevelEnd.emit()

func set_spawn_count(_spawn_count):
	spawn_count = _spawn_count
