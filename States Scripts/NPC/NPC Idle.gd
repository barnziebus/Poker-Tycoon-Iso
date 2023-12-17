extends State
class_name NPCIdle

var move_direction : Vector2
var wander_time : float
var target_position: Vector2

@export var _NPC: CharacterBody2D
@export var navigation: NavigationAgent2D
@export var move_speed := 50.0
@export var sprite: AnimatedSprite2D

var map_x_extents = Vector2(200,800)
var map_y_extents = Vector2(200,500)

func Enter():
	call_deferred("actor_setup")
	
	randomize_wander()


func Exit():
	_NPC.velocity = Vector2(200,200)


func Update(delta: float):
	var seat = find_seat()



func Physics_Update(delta: float):
	await get_tree().physics_frame
	
	if _NPC:
		if navigation.is_navigation_finished():
			if _NPC.seat:
				if _NPC.seat.open:
					print("NPC has seat")
					Transitioned.emit(self, "NPCMoveToSeat")
			else:
				randomize_wander()
		
		move()
	
	#animation_handler()


func Handle_Input(event: InputEvent):
	pass


func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame


func randomize_wander():
	var random_x = randi_range(map_x_extents[0], map_x_extents[1])
	var random_y = randi_range(map_y_extents[0], map_y_extents[1])
	navigation.target_position = Vector2(random_x, random_y)


func animation_handler():
	if _NPC.velocity > Vector2.ZERO:
		sprite.play('walk-right')
	else:
		sprite.play('walk-left')


func move():
	var current_agent_position: Vector2 = _NPC.global_position
	var next_path_position: Vector2 = navigation.get_next_path_position()
	
	var new_velocity: Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * move_speed
	
	_NPC.velocity = new_velocity


func find_seat():
	var chairs = get_tree().get_nodes_in_group("Seats")
	for seat in chairs:
		if seat.open:
			_NPC.seat = seat
			seat.open = false
			Transitioned.emit(self, "MovingToSeat")
			return seat
	

