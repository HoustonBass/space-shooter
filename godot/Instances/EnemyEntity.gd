extends Entity
class_name EnemyEntity

func _ready():
	self.connect("die", ResourceManager._on_enemy_die)
