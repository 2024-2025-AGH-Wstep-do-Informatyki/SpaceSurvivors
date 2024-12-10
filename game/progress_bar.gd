extends ProgressBar

@onready var label = $Label

var max_health: int = 100
var current_health: int = 100

func _ready():
	self.max_value = max_health
	update_health(current_health)
	take_damage(10)

func update_health(new_health: int):
	current_health = clamp(new_health, 0, max_health)
	self.value = current_health
	label.text = str(current_health) + " / " + str(max_health) 

func take_damage(damage: int):
	update_health(current_health - damage)

func heal(heal_amount: int):
	update_health(current_health + heal_amount)
