// Fill out your copyright notice in the Description page of Project Settings.


#include "AngelCharacter.h"


// Sets default values
AAngelCharacter::AAngelCharacter()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void AAngelCharacter::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called to bind functionality to input
void AAngelCharacter::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// will override this in as
	SetupPlayerInputComponentAS(PlayerInputComponent);
}

void AAngelCharacter::NotifyControllerChanged()
{
	Super::NotifyControllerChanged();
	// will override this in as
	NotifyControllerChangedAS();
}

