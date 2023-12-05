extends State

@export var map: TileMap

@onready var walkable_tile_atlas_coord: Vector2i = Vector2i(5,0)
@onready var non_walkable_tile_atlas_coord: Vector2i = Vector2i(2,0)

@onready var navigation_tiles_layer: int = 0

@onready var tile_size: Vector2 = map.tile_set.tile_size
@onready var tile_size_half: Vector2 = tile_size/2


func Enter():
	make_area_non_walkable(Vector2(20,40), Vector2i(2,3))


func Exit():
	pass


func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	pass


func Handle_Input(event):
	pass


func make_area_walkable(area_position: Vector2, area_size: Vector2i) -> void:
	var target_area_coordinates = map.local_to_map(area_position)
	var target_position = Vector2.ZERO
	
	# Calculate the position of each cell in the area
	for x in area_size.x:
		for y in area_size.y:
			target_position.x = area_position.x + (x-y) * (tile_size_half.x) # Calc the screen x position
			target_position.y = area_position.y + (x+y) * (tile_size_half.y) # Calc the screen y position
			
			make_tile_position_walkable(target_position)


func make_area_non_walkable(area_position: Vector2, area_size: Vector2i) -> void:
	var target_area_coordinates = map.local_to_map(area_position)
	var target_position = Vector2.ZERO
	
	# Calculate the position of each cell in the area
	for x in area_size.x:
		for y in area_size.y:
			target_position.x = area_position.x + (x-y) * (tile_size_half.x) # Calc the screen x position
			target_position.y = area_position.y + (x+y) * (tile_size_half.y) # Calc the screen y position
			
			make_tile_position_non_walkable(target_position)


func make_tile_coordinate_walkable(tile_coordinate: Vector2i) -> void:
	map.set_cell(navigation_tiles_layer, tile_coordinate, 0, walkable_tile_atlas_coord)


func make_tile_position_walkable(tile_position: Vector2) -> void:
	var target_tile_coordinates = map.local_to_map(tile_position)
	map.set_cell(navigation_tiles_layer, target_tile_coordinates, 0, walkable_tile_atlas_coord)


func make_tile_coordinate_non_walkable(tile_coordinate: Vector2i) -> void:
	map.set_cell(navigation_tiles_layer, tile_coordinate, 0, non_walkable_tile_atlas_coord)


func make_tile_position_non_walkable(tile_position: Vector2) -> void:
	var target_tile_coordinates = map.local_to_map(tile_position)
	map.set_cell(navigation_tiles_layer, target_tile_coordinates, 0, non_walkable_tile_atlas_coord)
