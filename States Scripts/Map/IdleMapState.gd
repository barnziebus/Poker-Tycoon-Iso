extends State

@export var map: TileMap

@onready var show_grid: bool = true

func Enter():
	error_handle_onload()


func Exit():
	pass


func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	pass


func Handle_Input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		Transitioned.emit(self, "EditMapState")


func error_handle_onload():
	if not map:
		print_debug("No map scene loaded to varable map")
