vscode配置及常用插件

中文菜单

    * 安装插件
        Chinese (Simplified) Language Pack for Visual Studio Code
        快捷键ctrl + shift + x 搜索后安装
    
    * 快捷键ctrl + shift + p
        输入display language后修改locale.json
        "locale":"zh-CN" // Changes will not take effect until VS Code has been restarted.
    
    解决注释中的中文显示乱码：
    点击 VSCode 左下角齿轮按钮进入设置，搜索Auto Guess Encoding
    勾选对应选项

plantuml画图工具

安装软件

1. 安装 Java 环境

2. GraphViz画图工具

    graphviz-2.38.msi

3. 安装VSCODE插件

    * PlantUML
    * Graphviz Preview
      
    点击 VSCode 左下角齿轮按钮进入设置，在用户设置脚本中添加 
    "graphviz-preview.dotPath": "C:/Program Files (x86)/Graphviz2.38/bin/dot.exe",

4. 环境配置测试

新建文档输入以下测试代码：

    @startuml
    [*] --> State1
    State1 --> [*]
    State1 : this is a string
    State1 : this is another string
    
    State1 -> State2
    State2 --> [*]
    
    @enduml

同时按下 Alt 键和字母 D 键，预览生成的 UML 状态图。

5. 导出图片

    右键点击文件，选择导出工作区图标，然后在上方提示框内选择导出文件格式。

plantuml语法说明

    参考目录下PDF文档
    PlantUML_Language_Reference_Guide_ZH.pdf












