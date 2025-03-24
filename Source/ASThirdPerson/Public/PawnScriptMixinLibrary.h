// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "EnhancedInputComponent.h"
#include "GameFramework/GameModeBase.h"
#include "GameFramework/Pawn.h"
#include "UObject/NoExportTypes.h"
#include "PawnScriptMixinLibrary.generated.h"

/**
 * 
 */
UCLASS(Meta = (ScriptMixin = "APawn"))
class ASTHIRDPERSON_API UPawnScriptMixinLibrary : public UObject
{
	GENERATED_BODY()

public:
	
	UFUNCTION(ScriptCallable)
	static UEnhancedInputComponent* GetEnhanceInputComponent(APawn* Pawn)
	{
		if (UEnhancedInputComponent* TempEnhanceInput = Cast<UEnhancedInputComponent>(Pawn->InputComponent))
		{
			return TempEnhanceInput;
		}
		return nullptr;
	}
};
