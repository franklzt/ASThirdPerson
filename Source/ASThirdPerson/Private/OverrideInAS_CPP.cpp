// Fill out your copyright notice in the Description page of Project Settings.


#include "OverrideInAS_CPP.h"


// Sets default values
AOverrideInAS_CPP::AOverrideInAS_CPP()
{
	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void AOverrideInAS_CPP::BeginPlay()
{
	Super::BeginPlay();
	FunctionInCpp();
}

