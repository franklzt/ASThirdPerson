// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/GameModeBase.h"
#include "GameFramework/Pawn.h"
#include "UObject/ConstructorHelpers.h"
#include "UObject/NoExportTypes.h"
#include "GameModeScriptMixinLibrary.generated.h"

/**
 * 
 */
UCLASS(Meta = (ScriptMixin = "AGameModeBase"))
class ASTHIRDPERSON_API UGameModeBaseScriptMixinLibrary : public UObject
{
	GENERATED_BODY()

public:

	// Add mixin function to extend function so that as can call the function 
	UFUNCTION(ScriptCallable)
	static TSubclassOf<APawn>  GetDefaultPawnByPath(AGameModeBase* InGameMode,const FString& Assetpath)
	{
		static ConstructorHelpers::FClassFinder<APawn> PlayerPawnBPClass(*Assetpath);
		if (PlayerPawnBPClass.Class != nullptr)
		{
			return PlayerPawnBPClass.Class;
		}
		UE_LOG(LogTemp, Error, TEXT("No Pawn Class"));
		return nullptr;
	}
};
