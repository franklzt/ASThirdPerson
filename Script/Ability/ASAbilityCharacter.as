
class ASAbilityCharacter : AAngelscriptGASCharacter
{
	UPROPERTY(Category="ASCharacter")
	TArray<TSubclassOf<UGameplayAbility>> Abilities;
	
	UFUNCTION(BlueprintOverride)
	void BeginPlay()
	{
		for (int i = 0; i < Abilities.Num(); i++)
		{
			UGameplayAbility Ability = Cast<UGameplayAbility>(Abilities[i].GetDefaultObject());
			this.AbilitySystem.GiveAbility(FGameplayAbilitySpec(Ability, 1, i));
		}
		
		
		APlayerController PlayerController = Cast<APlayerController>( GetController());
		if(PlayerController != nullptr)
		{
			UEnhancedInputLocalPlayerSubsystem EnhanceSystem = UEnhancedInputLocalPlayerSubsystem::Get(PlayerController);
			EnhanceSystem.AddMappingContext(DefaultMappingContext,0,FModifyContextOptions());
		}
		
	}
	
	UPROPERTY()
	UInputAction JumpAction;
	
	 UPROPERTY(Category="ASCharacter")
	UInputMappingContext DefaultMappingContext;
	
	UFUNCTION(BlueprintOverride)
	void SetupCharacterInput(UInputComponent PlayerInputComponent)
	{
		UEnhancedInputComponent EnhancedInputComponent = Cast<UEnhancedInputComponent>(PlayerInputComponent);
		if (EnhancedInputComponent != nullptr)
		{
			 EnhancedInputComponent.BindAction(JumpAction, ETriggerEvent::Started,FEnhancedInputActionHandlerDynamicSignature(this, n"Jump_Action"));
		}
	}
	
	UFUNCTION()
	void Jump_Action(FInputActionValue ActionValue, float32 ElapsedTime, float32 TriggeredTime, UInputAction SourceAction)
	{
		Print("Jump Action");
		this.AbilitySystem.TryActivateAbilityByClass(Abilities[0].DefaultObject.Class);
	}
}