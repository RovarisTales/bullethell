extends PlayerState

func enter(previous_state_path: String, data:= {}) -> void:
	player.velocity = Vector2.ZERO

func physics_update(_delta: float) -> void:
	player.get_movement_input()
	player.move_and_slide()
	
	if Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_up"):
		finished.emit(RUNNING)
	if Input.is_action_just_pressed("dash"):
		finished.emit(DASHING)
