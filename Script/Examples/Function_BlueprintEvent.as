// prefixes   BP_, K2_ and Received_ UKismet UBlueprint 
// subfixes Statics, Library,BlueprintLibrary,BlueprintFunctionLibrary,FunctionLibrary
// Blueprint Event
class AExampleActor : AActor
{
	// angelscript function
	void MyMethod()
	{
		MyGlobalFunction(this);
	}

	// To make Blueprint Callable
	UFUNCTION()
	void MyMethodForBlueprint()
	{
		Print("I can be called from a blueprint!");
	}

	// to override cpp function in as script
	UFUNCTION(BlueprintOverride)
	void BeginPlay()
	{
		Print("I am a BeginPlay override");
	}

	// this function be overridden in blueprint
	UFUNCTION(BlueprintEvent)
	void OverridableFunction()
	{
		Print("This will only print if not overridden from a child BP.");
	}

	// best practice to call the for blueprint and angelscript
	// Tip: Separate Blueprint Events and Angelscript functions
	void PickedUp()
	{
		// We always want this script code to run, even if our blueprint child wants to do something too
		Print(f"Pickup {this} was picked up!");
		SetActorHiddenInGame(false);

		// Call the separate blueprint event
		BP_PickedUp();
	}

	// Allows blueprints to add functionality, does not contain any code
	UFUNCTION(BlueprintEvent, DisplayName = "Picked Up")
	void BP_PickedUp() {}

}

// Global function
void MyGlobalFunction(AActor Actor)
{
	if (!Actor.IsHidden())
	{
		Actor.DestroyActor();
	}
}

// Example global function that moves an actor somewhat,this can be called from a blueprint
UFUNCTION()
void ExampleGlobalFunctionMoveActor(AActor Actor, FVector MoveAmount)
{
	Actor.ActorLocation += MoveAmount;
}

// Calling Super Methods, Angelscript can call script super methods, not cpp super methods
class AScriptParentActor : AActor
{
	void PlainMethod(FVector Location)
	{
		Print("AScriptParentActor::PlainMethod()");
	}

	UFUNCTION(BlueprintEvent)
	void BlueprintEventMethod(int Value)
	{
		Print("AScriptParentActor::BlueprintEventMethod()");
	}
}

/**
 Note: When overriding a C++ BlueprintNativeEvent,
 it is not possible to call the C++ Super method due to a technical limitation.
 You can either prefer creating BlueprintImplementEvents,
 or put the base implementation in a separate callable function.
 */

class AScriptChildActor : AScriptParentActor
{
	// Any script method can be overridden
	void PlainMethod(FVector Location) override
	{
		Super::PlainMethod(Location);
		Print("AScriptChildActor::PlainMethod()");
	}

	// Overriding a parent BlueprintEvent requires BlueprintOverride
	UFUNCTION(BlueprintOverride)
	void BlueprintEventMethod(int Value)
	{
		Super::BlueprintEventMethod(Value);
		Print("AScriptChildActor::BlueprintEventMethod()");
	}
}