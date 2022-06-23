extends Node2D

export var enemy_scene : PackedScene

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var rng = RandomNumberGenerator.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	new_game()
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	$StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_StartTimer_timeout():
	$EnemyTimer.start()
	
func _on_EnemyTimer_timeout():
	var enemyMob = enemy_scene.instance()
	var enemy_spawn_location = get_node("EnemyPath/EnemySpawnLocation")
	enemy_spawn_location.offset = randi()
	
	var direction = enemy_spawn_location.rotation + PI / 2
	
	enemyMob.position = enemy_spawn_location.position
	
	direction += rng.randf_range(-PI / 4, PI / 4)
	enemyMob.rotation = direction
	
	var velocity = Vector2(rng.randf_range(150.0, 250.0), 0.0)
	enemyMob.linear_velocity = velocity.rotated(direction)

	add_child(enemyMob)
