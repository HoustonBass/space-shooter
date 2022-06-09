extends Resource
class_name ScoreData

@export var score: int

signal score_changed

func _on_enemy_die():
	score += 1
	score_changed.emit()	
