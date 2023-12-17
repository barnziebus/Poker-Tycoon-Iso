extends State
class_name NPCPlaying

var facing = 'NW'

@export var _NPC: CharacterBody2D
@export var sprite: AnimatedSprite2D

var timer = 3

func Enter():
	facing = _NPC.seat.facing_direction
	timer = 10
	
	_NPC.seat.open = false
	_NPC.position = _NPC.seat.global_position
	_NPC.velocity = Vector2.ZERO
	
	animation_controller()

func Exit():
	_NPC.seat.open = true
	_NPC.seat = null


func Update(delta: float):
	pass


func Physics_Update(delta: float):
	timer -= delta
	if timer < 0:
		Transitioned.emit(self, "Leaving")


func Handle_Input(event):
	pass


func animation_controller():
	pass
