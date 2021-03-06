extends Node

# Private constants

const __BOMB: Resource = preload("res://source/entities/projectiles/bomb.tscn")
const __PROJECTILE_QUAD: Resource = preload("res://source/entities/projectiles/projectile_quad.tscn")
const __PROJECTILE_VORTEX: Resource = preload("res://source/entities/projectiles/projectile_vortex.tscn")


# Private variables

var __target_dungeon: Dungeon


# Lifecycle methods

func _ready() -> void:
	Event.connect("dungeon_changed", self, "__dungeon_changed")


# Public methods

func spawn_bomb(position: Vector2) -> bool:
	if !__target_dungeon:
		return false

	var instance: Bomb = __BOMB.instance()
	instance.position = position - __target_dungeon.position

	__target_dungeon.add_projectile(instance)

	return true


func spawn_projectile_quad(position: Vector2, direction: Vector2) -> bool:
	if !__target_dungeon:
		return false

	var instance: ProjectileQuad = __PROJECTILE_QUAD.instance()
	instance.position = position
	instance._direction = direction

	__target_dungeon.add_projectile(instance)

	return true


func spawn_projectile_vortex(position: Vector2, direction: Vector2) -> bool:
	if !__target_dungeon:
		return false

	var instance: ProjectileVortex = __PROJECTILE_VORTEX.instance()
	instance.position = position
	instance._direction = direction

	__target_dungeon.add_projectile(instance)

	return true


# Private methods

func __dungeon_changed(dungeon: Dungeon) -> void:
	__target_dungeon = dungeon

