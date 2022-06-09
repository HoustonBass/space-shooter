extends Node

@export var level_data: Resource = LevelData

@onready var enemy_queue = $EnemyQueue
@onready var enemy_spawn_timer = $EnemySpawnTimer

signal SpawnEnemy
signal SpawningFinished

var dist = 500
var rng = RandomNumberGenerator.new()
var spawn_count = 0

func _ready():
	rng.randomize()
	enemy_queue.queue_spawns(level_data.enemies)
	enemy_spawn_timer.set_wait_time(level_data.max_spawn_cooldown)
	enemy_spawn_timer.start()

func _on_enemy_spawn_timer_timeout():
	var next_spawn = enemy_queue.get_next_spawn()
	if next_spawn:
		SpawnEnemy.emit(next_spawn.instantiate())
		spawn_count += 1
	else:
		enemy_spawn_timer.set_paused(true)
		SpawningFinished.emit(spawn_count)

func get_spawn_location(point: Vector2) -> Vector2:
	var dir = rng.randf_range(0.0, 2*PI)
	return point + Vector2(dist * cos(dir), dist * sin(dir))
