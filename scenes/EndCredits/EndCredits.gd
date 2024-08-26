@tool
extends Credits

@export_file("*.tscn") var main_menu_scene: String
@onready var init_mouse_filter = mouse_filter

func _unhandled_input(event):
	if not enabled: return
	if event.is_action_pressed("ui_cancel"):
		_end_reached()

func _end_reached():
	mouse_filter = Control.MOUSE_FILTER_STOP
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	super._end_reached()

func _on_end_reached() -> void:
	SceneLoader.load_scene(main_menu_scene)
