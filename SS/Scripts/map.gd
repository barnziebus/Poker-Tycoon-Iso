extends Node2D

@export var map_node: TileMap

@onready var walkable_tile_atlas_coord: Vector2i = Vector2i(5,0)
@onready var non_walkable_tile_atlas_coord: Vector2i = Vector2i(2,0)

var show_grid: bool = true


func _ready():
	error_handle_onload()
	print('Map Handler Loaded')


func _process(delta):
	pass


func error_handle_onload():
	if not map_node:
		print_debug("No map scene loaded to varable map_node")
