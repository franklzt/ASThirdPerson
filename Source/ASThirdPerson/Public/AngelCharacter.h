// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "AngelCharacter.generated.h"

UCLASS()
class ASTHIRDPERSON_API AAngelCharacter : public ACharacter
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	AAngelCharacter();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

protected:
	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;
	virtual void NotifyControllerChanged() override;


	// add function for as to override 
	UFUNCTION(BlueprintImplementableEvent)
	void NotifyControllerChangedAS();

	// add function for as to override 
	UFUNCTION(BlueprintImplementableEvent)
	void SetupPlayerInputComponentAS(class UInputComponent* PlayerInputComponent);
};
