class_name ForestWind
extends Node3D

@export var wind_strength := 0.35
@export var gust_strength := 0.65
@export var gust_interval := 8.0

var wind_time := 0.0

func _process(delta):
	wind_time += delta

func get_wind_value(position: Vector3) -> float:
	return sin(wind_time * 0.6 + position.x * 0.05 + position.z * 0.05) * wind_strength

func get_gust_value() -> float:
	return sin(wind_time / gust_interval) * gust_strength
