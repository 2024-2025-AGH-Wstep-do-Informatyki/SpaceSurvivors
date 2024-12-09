extends CharacterBody2D 

var speed: float = 100.0

# Timer do zmiany kierunku
var direction = Vector2.ZERO
var rng = RandomNumberGenerator.new() 

func _ready():
	# Upewnij się, że postać zaczyna losowo się poruszać
	randomize_direction()

	# Użyj timera do zmiany kierunku co określony czas
	var timer = Timer.new()
	timer.one_shot = false
	timer.wait_time = 2.0 # Czas między zmianami kierunku

	add_child(timer)
	timer.start()

func _process(delta):
	# Poruszaj postacią
	if direction != Vector2.ZERO:
		velocity = direction * speed
		move_and_slide()

func randomize_direction():
	# Losuj nowy kierunek ruchu
	direction = Vector2(
		rng.randf_range(-1, 1),
		rng.randf_range(-1, 1)
	).normalized()

func _on_timer_timeout():
	# Zmień kierunek, gdy timer się skończy
	randomize_direction()
