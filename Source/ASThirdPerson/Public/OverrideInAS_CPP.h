// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "OverrideInAS_CPP.generated.h"

UCLASS()
class ASTHIRDPERSON_API AOverrideInAS_CPP : public AActor
{
	GENERATED_BODY()

public:
	// Sets default values for this actor's properties
	AOverrideInAS_CPP();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

	// example to call  function in as  
	UFUNCTION(BlueprintCallable)
	void FunctionToCallInAs(){ UE_LOG(LogTemp,Display,TEXT("FunctionToCallInAs")); };
	// example to extend function so that as can override 
	UFUNCTION(BlueprintImplementableEvent, meta=(DisplayName = "FunctionInCpp_AS"))
	void FunctionInCpp();
};
