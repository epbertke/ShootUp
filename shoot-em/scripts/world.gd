class_name World extends Node2D

@onready var player_spawn_position = $PlayerSpawnPosition
@onready var bullet_resource = $BulletContainer
var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")
	assert(player!=null)
	player.global_position = player_spawn_position.global_position
	player.bullet_shot.connect(_on_player_bullet_shot)

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		
func _on_player_bullet_shot(bullet_scene, location):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = location
	bullet_resource.add_child(bullet)
	
	
