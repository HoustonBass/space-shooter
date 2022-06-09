class_name PlayerData extends EntityData


signal health_changed

func take_damage(damage):
	super(damage)
	health_changed.emit(health)
