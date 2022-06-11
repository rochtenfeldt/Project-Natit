extends KinematicBody2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export (int) var speed = 200
export (float) var rotationSpeed = 1.5
export (float) var xBounds;
export (float) var yBounds;
var velocity = Vector2()
var rotationDirection = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

func GetInput():
	rotationDirection = 0
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x += -1
	if Input.is_action_pressed("ui_up"):
		velocity.y -=1
	if Input.is_action_pressed("ui_down"):
		velocity.y +=1
	velocity = velocity.normalized() * speed
	
	


func _physics_process(delta):
	GetInput()
	rotation += rotationDirection * rotationSpeed * delta
	velocity = move_and_slide(velocity)
	

		
	
