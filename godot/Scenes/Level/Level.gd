extends Node2D

@onready var enemies = $Enemies
@onready var player = $Player
@onready var director = $TheDirector

func _ready():
	ResourceManager.connect("LevelEnd", self._on_level_end)

func _on_level_end():
	print("level is over!")
	pass

func _on_the_director_spawn_enemy(enemy)-> void:
	if enemies:
		enemies.add_child(enemy)
		enemy.position = director.get_spawn_location(player.global_position)

func _on_the_director_spawning_finished(_spawn_count):
	ResourceManager.set_spawn_count(_spawn_count)
