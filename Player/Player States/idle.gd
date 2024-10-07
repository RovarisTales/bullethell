extends PlayerState

func enter(previous_state_path: String, data:= {}) -> void:
	player.velocity = Vector2.ZERO
