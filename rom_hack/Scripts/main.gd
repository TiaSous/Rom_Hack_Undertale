extends Node2D

@onready var player = $Player
@onready var life = $Life
@export var enemy_scene: PackedScene
var direction_player
var motion
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	life.text = str(player.life)



func _on_time_attack_timeout():
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(600, 250)
	add_child(enemy)
	enemy.player_info(player)
