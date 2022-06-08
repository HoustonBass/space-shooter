extends Node

@onready var enemy_map = $EnemyMap.enemy_map

var enemy_queue_data = [PatternData]
var enemy_queue = []

func queue_spawns(data):
	enemy_queue_data = data
	load_next_block()

func get_next_spawn():
	if enemy_queue.is_empty():
		if !enemy_queue_data.is_empty():
			load_next_block()
		else:
			return null
	return enemy_queue.pop_front()

func load_next_block():
	while !enemy_queue_data.is_empty():
		var block = enemy_queue_data.pop_front()
		for e in range(block.length):
			var type = block.pattern[e % block.pattern.size()] 
			enemy_queue.push_back(enemy_map[type])
