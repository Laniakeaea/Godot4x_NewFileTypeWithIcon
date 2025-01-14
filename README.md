# 修改注册表是有风险的!此类方法谨慎使用！
# Modifying the registry is risky! Use this method with caution!


原理：用批处理文件修改注册表，使得文件类型与图标相互关联，调用godot的系统执行函数，使其执行批处理文件
Principle: Modify the registry with a batch file, make the file type and icon associated with each other, call the godot system execution function, make it execute the batch file

关联图标与文件类型时：
你需要打开FileIconRegister.bat并且修改下图中红框内的部分
When associating ICONS with file types:You need to open FileIconRegister.bat and modify the red box in the image below
![FileIconRegister](https://github.com/user-attachments/assets/72f597bd-2025-4b2d-b046-dbf3a7dd5987)

取消关联时：
你需要打开DeleteFileIcon.bat并且修改下图中红框内的部分
并且重启电脑
When disassociating:
You need to open DeleteFileIcon.bat and change the part in the red box in the image below
And restart the computer.
