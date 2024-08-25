# Godot 游戏模板

适用于 Godot 4.2

此模板包含主菜单、选项菜单、暂停菜单、致谢、场景加载器、额外工具和示例游戏场景。
[示例在 itch.io](https://maaack.itch.io/godot-game-template)

#### 视频

[![快速介绍视频](https://img.youtube.com/vi/U9CB3vKINVw/hqdefault.jpg)](https://youtu.be/U9CB3vKINVw)  
[![安装视频](https://img.youtube.com/vi/-QWJnZ8bVdk/hqdefault.jpg)](https://youtu.be/-QWJnZ8bVdk)  
[所有视频](/addons/maaacks_game_template/docs/Videos.md)

#### 截图

![主菜单](/addons/maaacks_game_template/media/Screenshot-3-1.png)  
![键盘重新绑定](/addons/maaacks_game_template/media/Screenshot-3-2.png)  
![音频控制](/addons/maaacks_game_template/media/Screenshot-3-4.png)  
![暂停菜单](/addons/maaacks_game_template/media/Screenshot-3-6.png)  
[所有截图](/addons/maaacks_game_template/docs/Screenshots.md)

## 使用场景

在 15 分钟内设置菜单和可访问性功能。

核心组件可以支持更大的项目，但模板最初是为了支持小型项目和游戏竞赛而构建的。

## 功能

### 基础

`base/` 文件夹包含菜单应用程序的核心组件。

-   主菜单    
-   选项菜单
-   致谢
-   加载屏幕
-   持久设置
-   简单配置界面
-   键盘/鼠标支持
-   游戏pad 支持
-   UI 声音控制器
-   背景音乐控制器

### extras

`extras/` 文件夹包含扩展核心应用程序的组件。

-   暂停菜单
-   打开场景
-   赢得和输掉场景
-   记录脚本
-   附加 autoloaded 类型脚本
-   用于测试和发布的脚本

### 例子 

`examples/` 文件夹包含一个使用继承场景从 `base/` 和 `extras/` 的示例项目。

-   示例游戏场景
-   等级推进
-   结束字幕
-   附加继承场景：
    -   游戏选项菜单 w/ 重置按钮
    -   主要选项菜单 w/ 游戏选项标签 
    -   主菜单 w/ 动画
    -   暂停菜单 w/ 链接场景
    -   加载屏幕 w/ 预缓存着法

### 如何工作 

- `AppConfig.tscn` 被设置为第一个 autoload。它调用 `AppSettings.gd` 来加载所有配置设置从 config 文件 (如果存在) 通过 `Config.gd`。
- `SceneLoader.tscn` 被设置为第二个 autoload。 它可以在背景中加载场景或使用加载屏幕 (`LoadingScreen.tscn` 由 default）。   
- `Opening.tscn` 是一个简单的场景用来淡入/淡出几个图像开始游戏。这之后加载下一个场景 (`MainMenu.tscn`)。
- `MainMenu.tscn` 是玩家可以启动游戏、更改设置、观看字幕或退出的地方。它可以链接到路径中的游戏场景来播放，以及封装的选项菜单来使用场景。
- `OptionControl.tscn` 和其继承场景用于大多数可配置选项在菜单中。它们与 `Config.gd` 一起工作来保留设置之间运行时保持持续性。
- `Credits.tscn` 读取 `ATTRIBUTION.md` 来自动生成滚动文本标签的内容。  
- `UISoundController` 节点可以自动附加声音到按钮、选项卡条、滑块和行编辑在场景中。 `ProjectUISoundController.tscn` 是一个 autoload 被应用 UI 项目中的声音。
- `ProjectMusicController.tscn` 是一个 autoload 保持音乐播放之间场景。它检测音频流播放器加入到场景树时，重新父化他们，混响的音频流。  
- `InGameMenuController.gd` 控制打开和关闭菜单以及在后台暂停游戏。
- 暂停菜单控制器节点将加载 `PauseMenu.tscn` （使用 `InGameMenuController.gd`) 当触发 `ui-cancel`.
- `GameUI.tscn` 是一个演示场景，显示识别出的动作输入，并且特征了 `PauseMenuController` 节点、 `LevelLoader` 节点来推进等级、以及 `InGameMenuController.gd` 来展示 `WinScreen.tscn` 或 `LoseScreen.tscn`.

## 安装

### Godot 资产库
这个包被同时作为模板和插件，意味着它可以用来开始一个新的项目或者添加到现有的项目中。
![Package Icon](/addons/maaacks_game_template/media/Game-Icon-black-transparent-256x256.png)  

当开始一个新的项目：
1.  在 `Asset Library Projects` 选项卡。
2.  搜索 "Maaack's Game Template"。
3.  点击结果打开模板详情页。
4.  点击下载。
5.  给这个新项目一个名字并且选择位置。
6.  点击安装 & 编辑。
7.  按照 [新建项目指南](/addons/maaacks_game_template/docs/NewProject.md) 继续。

当编辑一个现有的项目：

1.  在 `AssetLib` 选项卡。
2.  搜索 "Maaack's Game Template Plugin"。
3.  点击结果打开插件详情页。
4.  点击下载。
5.  确保内容被安装到 `addons/` 并且没有冲突。
6.  点击安装。
7.  reload 项目（可能在此之前会看到错误）。
8.  在 项目设置 > 插件选项卡中启用这个插件。  
    如果这是第一次启用，
    1.  会弹出一个对话框询问你复制示例场景到 `addons/`.
    2.  另一个对话框会询问更新项目的主场景。
9.  按照 [现有项目指南](/addons/maaacks_game_template/docs/ExistingProject.md) 继续。

## 安装

### GitHub

1.  从 [GitHub](https://github.com/Maaack/Godot-Game-Template/releases/latest) 下载最新版本的包。  
2.  解压包中的内容。
3.  将 `addons/maaacks_game_template` 文件夹移动到你的项目中 `addons/` 文件夹中。  
4.  打开/重新加载项目。  
5.  从 项目设置 > 插件选项卡启用插件。  
    如果这是第一次启用，
    1.  会弹出一个对话框询问你复制示例场景到 `addons/`.
    2.  另一个对话框会询问更新项目的主场景。
6.  按照 [现有项目指南](/addons/maaacks_game_template/docs/ExistingProject.md) 继续。

#### 最小

想要最少特性集的用户可以尝试 [Maaack's Menus Template](https://github.com/Maaack/Godot-Menus-Template)。  

## 使用方法

可以在场景和脚本外面直接进行修改。 

在第一次启用插件时复制到 `addons/` 的示例场景文件夹将会被拷贝到项目根目录下。但如果跳过，这很可能会导致开发者遗失更改。推荐的做法是继承要使用的场景，然后保存这些继承过来的场景到项目根目录下。这样可以避免在包更新或被 .gitignore 的情况下发生的变化丢失。

### 新建项目

本指南假设使用整个项目文件夹内容进行新建项目。这将适用于克隆仓库或者从 Godot Asset Library 中下载模板。

[新建项目指南](/addons/maaacks_game_template/docs/NewProject.md)

### 现有项目

本指南假设使用 `addons/` 的内容来编辑现有的项目。  

[现有项目指南](/addons/maaacks_game_template/docs/ExistingProject.md)  

## 链接

[Attribution](/addons/maaacks_game_template/ATTRIBUTION.md)  
[License](/addons/maaacks_game_template/LICENSE.txt)  
[Godot Asset Library - Template](https://godotengine.org/asset-library/asset/2703)  
[Godot Asset Library - Plugin](https://godotengine.org/asset-library/asset/2709)  
