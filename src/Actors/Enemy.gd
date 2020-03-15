extends KinematicBody2D

const FLOOR_NORMAL: = Vector2.UP;

export var speed: = Vector2(100.0, 1000.0);
export var gravity: =  3000.0;
var _velocity: = Vector2.ZERO;

func _ready() -> void:
	_velocity.x = speed.x;

func _physics_process(delta: float) -> void:
	$AnimatedSprite.flip_h = _velocity.x < 0;
	move_and_slide(_velocity, FLOOR_NORMAL);
