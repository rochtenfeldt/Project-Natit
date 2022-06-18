extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$EnemyBody/EnemySprite.playing = true
	var mob_types = $EnemyBody/EnemySprite.frames.get_animation_names()
	$EnemyBody/EnemySprite.animation = mob_types[randi() % mob_types.size()]

func _on_visible_on_Screen_notifier_2d_screen_exited():
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
