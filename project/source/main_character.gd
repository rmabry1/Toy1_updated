extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d = $Sprite2D

var jump_count = 0
var max_jump = 2


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
		
	else:
		sprite_2d.animation = "default"
		
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = 'jumping'
	
	if is_on_floor():
		jump_count = 0


	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jump:
		velocity.y = JUMP_VELOCITY
		$JumpSound.play()
		jump_count += 1
		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left","move_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, 10)

	move_and_slide()

	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft


func _on_sprite_2d_animation_finished():
	$ImpactSound.play()
