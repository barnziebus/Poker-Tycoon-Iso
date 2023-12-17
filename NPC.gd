extends CharacterBody2D
class_name NPC

var seat = null

func _physics_process(delta):
	move_and_slide()
	$StateLabel.text = $"StateMachine".current_state.name

