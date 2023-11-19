extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -400.0

var life = 20

@onready var timer = $Timer
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directionY = Input.get_axis("ui_up", "ui_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()



func _on_can_take_damage_area_entered(area):
	if timer.is_stopped():
		life -= 1
		timer.start()
		animated_sprite_2d.play("damage")


func _on_timer_timeout():
	timer.stop()
	animated_sprite_2d.stop()
