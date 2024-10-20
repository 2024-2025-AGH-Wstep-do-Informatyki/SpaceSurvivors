extends CharacterBody2D

#Nie const, ponieważ prędkość może się zmieniać
var movementSpeed = 600

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * movementSpeed
	
	move_and_slide()
	
	
