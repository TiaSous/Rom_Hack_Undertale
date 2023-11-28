extends RigidBody2D
@onready var enemy = $"."

@onready var player = $Player
var motion
func _ready():
	position=Vector2(0, 0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion = position.direction_to(player.position) * 10
	motion = move_and_collide(motion)
