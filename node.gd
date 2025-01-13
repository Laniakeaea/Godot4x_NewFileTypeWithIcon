extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	save_to_file("a")


func _process(delta: float) -> void:
	pass

func save_to_file(content):
	var file = FileAccess.open("res://File.NewFile", FileAccess.WRITE)
	file.store_string(content)
	print("save")

func _on_button_pressed() -> void:
	var bat_file_path = ProjectSettings.globalize_path("res://FileIconRegister.bat")
	var arguments = [] # 如果需要传递参数，可以在此添加
	
	# 执行批处理文件
	var result = OS.execute(bat_file_path, arguments)
	
	if result == OK:
		print("批处理文件执行成功")
	else:
		print("批处理文件执行失败，错误代码: ", result)
		



func _on_button_2_pressed() -> void:
	var bat_file_path = ProjectSettings.globalize_path("res://DeleteFileIcon.bat")
	var arguments = [] # 如果需要传递参数，可以在此添加
	
	# 执行批处理文件
	var result = OS.execute(bat_file_path, arguments)
	
	if result == OK:
		print("批处理文件执行成功")
	else:
		print("批处理文件执行失败，错误代码: ", result)
