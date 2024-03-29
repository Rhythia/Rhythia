extends Object

signal changed

enum Type {
	BOOLEAN,
	INT,
	ENUM,
	FLOAT,
	STRING,
	ARRAY,
	CATEGORY
}
static func convert_type(_value:Variant,type:int):
	match type:
		Type.BOOLEAN: return bool(_value)
		Type.INT: return int(_value)
		Type.ENUM: return int(_value)
		Type.FLOAT: return float(_value)
		Type.STRING: return String(_value)
		Type.ARRAY: return Array(_value)
		Type.CATEGORY: return Dictionary(_value)
	return _value
static func validate_type(_value:Variant,type:int):
	match type:
		Type.BOOLEAN: return _value is bool
		Type.INT: return _value is int
		Type.ENUM: return _value is int
		Type.FLOAT: return _value is float
		Type.STRING: return _value is String
		Type.ARRAY: return _value is Array
		Type.CATEGORY: return _value is Dictionary
	return false
static func validate_enum(_value:Variant,_enum:Dictionary):
	return _value in _enum.values()

var name:String
var type:Type
var enum_type:Dictionary
var category_config:Array
var default:Variant
var value:Variant = {}:
	set(_value):
		if !validate_type(_value,type): _value = convert_type(_value,type)
		if type == Type.CATEGORY: return false
		value = _value
		call_deferred("emit_signal","changed",value)
		return true

func _init(config:Array):
	name = config[0]
	type = config[1]
	if type == Type.CATEGORY:
		category_config = config[2]
#		value = {}
		for setting_config in category_config:
			var setting = new(setting_config)
			value[setting_config[0]] = setting
	elif type == Type.ENUM:
		enum_type = config[2]
		default = config[3]
		value = default
	else:
		default = config[2]
		value = default

func get_setting(property):
	if !value.has(property): return null
	return value[property]
func _get(property):
	if type != Type.CATEGORY: return null
	if value == null: return null
	if !value.has(property): return null
	if value[property].type == Type.CATEGORY: return value[property]
	return value[property].value
func _set(property,_value):
	if type != Type.CATEGORY: return false
	if !value.has(property): return false
	if value[property].type == Type.CATEGORY: return false
	value[property].value = _value
	return true
