# ASThirdPerson
AngelScript code example of ThirdPerson Template <br>
第三人称项目的 Agnelscript 版本

This is an example of using angelscript to code one character class, mainly ported from third person character c++ template.

Usage: <br>
1.Create one c++ project and name it ASThirdPerson.<br>
2.Copy this project to the location where you create the project and overrite it.<br>
3.Reparent the BP_ThirdPersonCharacter to ASCharacter Under Content/ThirdPerson/Blueprints/BP_ThirdPersonCharacter,
    setup the input action and mapping in the blueprint.<br>
4.Create your gamemode and setup in world settings.<br>
5.Play Your Map can see the angelscript character in the map <br>
6.If you check the source,you can find the AngelCharacter.h where add bluepint function for angelscript to override.<br>

Addtion notes:<br>
1. The widget angelscript example is from https://www.predictable-paul.com/blog/unreal-angelscript-widgets/<br>
2. Check the project, you can see,this project has depandency to AngelscriptEnhancedInput,AngelscriptGAS. <br>You need to 
    enabled them mannually. In this case,they are enabled by default if you are using this project.<br>
3. Bind_AGameModeBase.cpp is an example for binding one global function.<br>
4.  PawnScriptMixinLibrary.cpp is an example for binding mixin function.<br>
5.  MySGameMode.as is one example of load uobject from anglescript. this is done by extend pawn class by mixin.<br>

本项目是个 Angelscript 第三人称的例子。<br>
用法：<br>
1。 下载本项目。<br>
2。 创建C++第三人称项目。<br>
3。 复制本项目到创建的第三人称项目并覆盖。<br>
4。 复制 Content/ThirdPerson/Blueprints/BP_ThirdPersonCharacter 并改名为 BP_AngleCharacter（你可以用任何的名字，只要在后面的设置做相应的调整。），<br>把父类改为 ASCharacter。
    设置 Input action, mapping。
5。 自行创建 GameMode 类。并把 Default pawn 改为 BP_AngleCharacter 类。这样就可以使用 Angelscript 类的 Character 了。<br>
6。 本项目使用了 AngelscriptEnhancedInput，AngelscriptGAS，两个插件。用于相应的例子中。<br>
7。 本项目也做也如何在C++中添加绑定的例子。比如，加载资源就是用了扩展方法，也有 全局函数的绑定例子。<br>
8。 UI 的例子源于 https://www.predictable-paul.com/blog/unreal-angelscript-widgets/<br>