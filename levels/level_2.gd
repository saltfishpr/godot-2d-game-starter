extends Node

signal level_won
signal level_lost

const max_mobs = 300 # 指定最大 mob 数量
var current_mob_count = 0 # 用于跟踪当前 mobs 的数量

func _ready() -> void:
	spawn_mob()
	spawn_mob()
	spawn_mob()

func _process(delta: float) -> void:
	$Player/Label.text = "Time left: %.2f" % [$WinTimer.time_left]

func spawn_mob() -> void:
	var new_mob = preload("res://levels/level2/mob.tscn").instantiate()
	new_mob.player = $Player
	$Player/Path2D/PathFollow2D.progress_ratio = randf()
	new_mob.global_position = $Player/Path2D/PathFollow2D.global_position
	add_child(new_mob)
	current_mob_count += 1 # 每生成一个 mob 就增加计数

func _on_mob_spawn_timer_timeout() -> void:
	if current_mob_count >= max_mobs:
		$MobSpawnTimer.stop()
		return
	spawn_mob()

func _on_win_timer_timeout() -> void:
	level_won.emit()

func _on_player_health_depleted() -> void:
	level_lost.emit()
