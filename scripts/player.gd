extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0

@onready var anim_sprite = $AnimatedSprite2D

var is_attacking = false

func _ready():
	anim_sprite.animation_finished.connect(_on_animation_finished)

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("hit") and is_on_floor() and not is_attacking:
		is_attacking = true
		anim_sprite.play("attack")
	
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		anim_sprite.flip_h = false
	elif direction < 0:
		anim_sprite.flip_h = true
	if not is_attacking:
		if is_on_floor():
			if direction == 0:
				anim_sprite.play("idle")
			else:
				anim_sprite.play("walk")
		else:
			anim_sprite.play("default")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

		
	move_and_slide()

func _on_animation_finished():
	if anim_sprite.animation == "attack":
		is_attacking = false
