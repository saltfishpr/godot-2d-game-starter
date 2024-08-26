extends Node

signal level_won

func _on_timer_timeout() -> void:
	level_won.emit()

func _process(delta: float) -> void:
	$Label.text = "Time left: %.3f" % [$Timer.time_left]
