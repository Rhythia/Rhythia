extends Resource
class_name GameSettings

signal setting_changed

enum ApproachMode {
	DISTANCE_TIME,
	DISTANCE_RATE,
	RATE_TIME
}
const SETTINGS_CONFIG = [
	["first_time",Setting.Type.BOOLEAN,true],
	["fps_limit",Setting.Type.INT,0],
	["fullscreen",Setting.Type.BOOLEAN,false],
	["approach",Setting.Type.CATEGORY,[
		["time",Setting.Type.FLOAT,1.0],
		["distance",Setting.Type.FLOAT,50.0],
		["rate",Setting.Type.FLOAT,50.0],
		["mode",Setting.Type.ENUM,ApproachMode,ApproachMode.RATE_TIME]
	]],
	["parallax",Setting.Type.CATEGORY,[
		["camera",Setting.Type.FLOAT,1.0],
		["hud",Setting.Type.FLOAT,0.0]
	]],
	["skin",Setting.Type.CATEGORY,[
		["block",Setting.Type.CATEGORY,[
			["mesh",Setting.Type.STRING,"cube"],
			["colorset",Setting.Type.ARRAY,["#ff0000","#00ffff"]],
			["opacity",Setting.Type.FLOAT,1.0],
			["fade_in_time",Setting.Type.FLOAT,0.25],
			["fade_in_amount",Setting.Type.FLOAT,1.0],
			["fade_out_time",Setting.Type.FLOAT,0.0],
			["fade_out_amount",Setting.Type.FLOAT,0.0]
		]],
		["background",Setting.Type.CATEGORY,[
			["world",Setting.Type.STRING,"tunnel"]
		]]
	]],
	["volume",Setting.Type.CATEGORY,[
		["master",Setting.Type.FLOAT,0.5],
		["master_menu",Setting.Type.FLOAT,1.0],
		["menu_music",Setting.Type.FLOAT,1.0],
		["menu_sfx",Setting.Type.FLOAT,1.0],
		["master_game",Setting.Type.FLOAT,1.0],
		["game_music",Setting.Type.FLOAT,1.0],
		["game_sfx",Setting.Type.FLOAT,1.0]
	]],
	["controls",Setting.Type.CATEGORY,[
		["sensitivity",Setting.Type.CATEGORY,[
			["mouse",Setting.Type.FLOAT,1.0],
			["absolute",Setting.Type.FLOAT,1.0]
		]],
		["lock",Setting.Type.BOOLEAN,true],
		["drift",Setting.Type.BOOLEAN,false],
		["absolute",Setting.Type.BOOLEAN,false]
	]],
	["folders",Setting.Type.CATEGORY,[
		["maps",Setting.Type.ARRAY,[]]
	]]
]

func _init(config=SETTINGS_CONFIG):
	for setting_config in config:
		var setting = Setting.new(setting_config)
		settings[setting_config[0]] = setting

var settings:Dictionary = {}

func get_setting(property):
	if !settings.has(property): return null
	return settings[property]
func _get(property):
	if !settings.has(property): return null
	if settings[property].type == Setting.Type.CATEGORY: return settings[property]
	return settings[property].value
func _set(property,value):
	if !settings.has(property): return false
	if settings[property].type == Setting.Type.CATEGORY: return false
	settings[property].value = value
	return true
