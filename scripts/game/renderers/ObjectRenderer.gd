extends MultiMeshInstance3D
class_name ObjectRenderer

@onready var manager:ObjectManager = get_parent()
@onready var game:GameScene = manager.game

func _process(_delta):
	var objects = manager.objects_to_process
	self.render_objects(objects)

func prepare():
	pass
func render_objects(_objects:Array):
	pass
