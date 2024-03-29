extends Node3D
class_name GameObject

signal spawned
signal despawned

@export var game:GameScene
@export var manager:ObjectManager

@export var id:String
@export var permanent:bool = false
@export var spawn_time:float = 0
@export var despawn_time:float = 0
var force_despawn:bool = false

func _init(_id:String=str(Time.get_ticks_usec())):
	id = _id

func _process(_delta):
	if game == null or manager == null: return
	visible = get_visibility(game.sync_manager.current_time)
	if !visible: return
	update(game.sync_manager.current_time)
	update_transform()

func update(_current_time:float):
	pass

func get_visibility(current_time:float):
	return permanent or (spawn_time <= current_time and despawn_time >= current_time)

func update_transform():
	pass
