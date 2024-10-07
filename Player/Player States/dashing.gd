extends PlayerState

var dash_direction: Vector2
var velocity_before_dash: Vector2
var timer

func enter(previous_state_path: String, data:= {}) -> void:
	dash_direction = player.movement_input
	velocity_before_dash = player.velocity
	
	timer = Timer.new()
	add_child(timer)
	timer.start(0.2)
	timer.timeout.connect(transition)
	player.velocity = 2000 * dash_direction
	
func physics_update(delta: float) -> void:
	player.move_and_slide()
	
func exit() -> void:
	player.velocity = velocity_before_dash

func transition():
	timer.queue_free()
	if velocity_before_dash == Vector2.ZERO:
		finished.emit(IDLE)
	else:
		finished.emit(RUNNING)
