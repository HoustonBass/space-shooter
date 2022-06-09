extends CharacterBody2D
class_name Entity

var health: float
var max_health: float
var speed: float

signal die

func take_hit(damage):
	health -= damage
	if health <= 0:
		_die()

func _die():
	queue_free()
	die.emit()
