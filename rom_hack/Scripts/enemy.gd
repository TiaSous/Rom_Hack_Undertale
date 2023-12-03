extends RigidBody2D
@onready var enemy = $"."

var speed = 400
var player_pos
var pente = 0

func player_info(player):
	player_pos = player.position
	pente = player_pos - enemy.position
	enemy.linear_velocity = pente.normalized() * speed

