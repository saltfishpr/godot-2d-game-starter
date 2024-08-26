extends Area2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and $CooldownTimer.is_stopped():
		shoot()

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())

func shoot() -> void:
	const BULLET = preload("res://levels/level2/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = $WeaponPivot/Pistol/ShootingPoint.global_position
	new_bullet.global_rotation = $WeaponPivot/Pistol/ShootingPoint.global_rotation
	$WeaponPivot/Pistol/ShootingPoint.add_child(new_bullet)
	$CooldownTimer.start()
