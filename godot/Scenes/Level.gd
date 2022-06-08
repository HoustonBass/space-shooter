extends Node2D

@onready var enemies = $Enemies
@onready var player = $Player
@onready var director = $TheDirector

func _on_the_director_spawn_enemy(enemy)-> void:
	if enemies:
		enemies.add_child(enemy)
		enemy.position = director.get_spawn_location(player.global_position)
