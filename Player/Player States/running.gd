extends PlayerState

func enter(previous_state_path: String, data:= {}) -> void:
	pass

func physics_update(delta: float) -> void:
	
	player.get_movement_input()
	
	update_velocity(0,delta)
	update_velocity(1,delta)
	
	player.move_and_slide()
	
	if is_equal_approx(player.velocity.x, 0.0) and is_equal_approx(player.velocity.y, 0.0):
		finished.emit(RUNNING)
	if Input.is_action_just_pressed("dash"):
		finished.emit(DASHING, {"dash_direction": player.movement_input})
		

func update_velocity(index, delta):
	var target_velocity = player.speed * player.movement_input[index]
	
	var velocity_diferential = target_velocity - player.velocity[index]
	
	var acceleration_rate = player.acceleration if abs(target_velocity) > 0.1 else player.deacceleration
	
	var movement = velocity_diferential * acceleration_rate * delta
	
	player.velocity[index] += movement
