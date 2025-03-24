// Copyright Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;

public class ASThirdPerson : ModuleRules
{
	public ASThirdPerson(ReadOnlyTargetRules Target) : base(Target)
	{
		PrivateDependencyModuleNames.AddRange(new string[] { "AngelscriptCode"});
		PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

		PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore", "EnhancedInput" });
	}
}
