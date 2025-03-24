# ASThirdPerson
AngelScript code example of ThirdPerson Template

This is an example of using angelscript to code one character class, mainly ported from third person character c++ template.

Usage: 
1.Create one c++ project and name it ASThirdPerson.
2.Copy this project to the location where you create the project and overrite it.
3.Reparent the BP_ThirdPersonCharacter to ASCharacter Under Content/ThirdPerson/Blueprints/BP_ThirdPersonCharacter,
    setup the input action and mapping in the blueprint.
4.Create your gamemode and setup in world settings.
5.Play Your Map can see the angelscript character in the map 
6.If you check the source,you can find the AngelCharacter.h where add bluepint function for angelscript to override.

Addtion notes:
7. The widget angelscript example is from https://www.predictable-paul.com/blog/unreal-angelscript-widgets/
8. Check the project, you can see,this project has depandency to AngelscriptEnhancedInput,AngelscriptGAS. You need to 
    enabled them mannually. In this case,they are enabled by default if you are using this project.
9. Bind_AGameModeBase.cpp is an example for binding one global function.
10. PawnScriptMixinLibrary.cpp is an example for binding mixin function.
11. MySGameMode.as is one example of load uobject from anglescript. this is done by extend pawn class by mixin.

本项目是个 Angelscript 第三人称的例子。
用法：
1。 下载本项目。
2。 创建C++第三人称项目。
3。 复制本项目到创建的第三人称项目并覆盖。
4。 复制 Content/ThirdPerson/Blueprints/BP_ThirdPersonCharacter 并改名为 BP_AngleCharacter（你可以用任何的名字，只要在后面的设置做相应的调整。），把父类改为 ASCharacter。
    设置 Input action, mapping。
5。 自行创建 GameMode 类。并把 Default pawn 改为 BP_AngleCharacter 类。这样就可以使用 Angelscript 类的 Character 了。
6。 本项目使用了 AngelscriptEnhancedInput，AngelscriptGAS，两个插件。用于相应的例子中。
7。 本项目也做也如何在C++中添加绑定的例子。比如，加载资源就是用了扩展方法，也有 全局函数的绑定例子。
8。 UI 的例子源于 https://www.predictable-paul.com/blog/unreal-angelscript-widgets/