extends Node2D

@export var open: bool = true
@export_enum("NW", "NE", "SW", "SE") var facing_direction: String = "NW"

@onready var chair_sprite = $ChairSprite
@onready var chair_back_sprite = $ChairBackSprite

func _ready():
	chair_sprite.play(facing_direction)
	chair_back_sprite.play(facing_direction)
