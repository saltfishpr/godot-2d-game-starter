extends CharacterBody2D

var player: CharacterBody2D

var speed = 400
var health = 3

func _ready() -> void:
	$Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage() -> void:
	health -= 1
	$Slime.play_hurt()
	if health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://levels/level2/smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		smoke.global_position = global_position
		get_parent().add_child(smoke)
