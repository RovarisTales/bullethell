class_name PlayerState extends State

const IDLE = "Idle"
const RUNNING = "Running"
const DASHING = "Dashing"

var player: CharacterBody2D

func _ready() -> void:
	await owner.ready
	player = owner as CharacterBody2D
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
