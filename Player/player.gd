extends CharacterBody2D

@export_category("player_variables")
@export var speed := 600.0
@export var dash_speed = 800
@export var direction: Vector2
@export var acceleration: float = 10.0
@export var movement_input: Vector2
@export var deacceleration:float = 20.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func get_movement_input() -> void:
	movement_input = Vector2(
		int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")),
		int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	).normalized()
