extends KinematicBody2D

const FLOOR_NORMAL: = Vector2.UP;

export var speed: = Vector2(150.0, 1000.0);
export var gravity: =  3000.0;
var _velocity: = Vector2.ZERO;

func _ready() -> void:
	set_physics_process(false)
	_velocity = speed;

func _physics_process(delta: float) -> void:
	_velocity.y += gravity*delta;
	if is_on_wall() :
		_velocity.x *= -1.0;
	$AnimatedSprite.flip_h = _velocity.x < 0;
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y;


func _on_PlayerDetector_body_entered(body: Node) -> void:
	if body.get_filename().get_file() == "Player.tscn":
		body.morrer()


func _on_PlayerDetector_area_entered(area):
	if area.get_filename().get_file() == "Chicote.tscn":
		queue_free()
