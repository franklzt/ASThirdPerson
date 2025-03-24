// Angscript Character Class


class AASCharacter : AAngelCharacter
{

	UPROPERTY(DefaultComponent)
	USpringArmComponent CameraBoom;

	UPROPERTY(DefaultComponent, Attach = CameraBoom)
	UCameraComponent FollowCamera;

	

	default CapsuleComponent.SetCapsuleSize(42.0f, 96.0f);
	default bUseControllerRotationPitch = false;
	default bUseControllerRotationYaw = false;
	default bUseControllerRotationRoll = false;

	default CameraBoom.TargetArmLength = 300.0;
	default CameraBoom.bUsePawnControlRotation = true;

	default CharacterMovement.bOrientRotationToMovement = true;
	default CharacterMovement.RotationRate = FRotator(0.0f, 500.0f, 0.0f);
	default CharacterMovement.JumpZVelocity = 700.0;
	default CharacterMovement.AirControl = 0.35;
	default CharacterMovement.MaxWalkSpeed = 500.0;
	default CharacterMovement.MinAnalogWalkSpeed = 20.0;
	default CharacterMovement.BrakingDecelerationWalking = 2000;
	default CharacterMovement.BrakingDecelerationFalling = 1500;

	default Mesh.SetRelativeLocation(FVector(0.0f, 0.0f, -90.0f));
	default Mesh.SetRelativeRotation(FRotator(0.0f, 270.0f, 0.0f));

	default FollowCamera.bUsePawnControlRotation = false;


	UPROPERTY(Category="ASCharacter")
	UInputMappingContext DefaultMappingContext;
	
	UPROPERTY(Category="ASCharacter")
	UInputAction JumpAction;
	
	UPROPERTY(Category="ASCharacter")
	UInputAction MoveAction;
	
	UPROPERTY(Category="ASCharacter")
	UInputAction LookAction;


	UFUNCTION(BlueprintOverride)
	void NotifyControllerChangedAS()
	{
		
		
		
		APlayerController PlayerController = Cast<APlayerController>( GetController());
		if(PlayerController != nullptr)
		{
			UEnhancedInputLocalPlayerSubsystem EnhanceSystem = UEnhancedInputLocalPlayerSubsystem::Get(PlayerController);
			EnhanceSystem.AddMappingContext(DefaultMappingContext,0,FModifyContextOptions());
		}
	}

	
	UFUNCTION(BlueprintOverride)
	void SetupPlayerInputComponentAS(UInputComponent PlayerInputComponent)
	{
		UEnhancedInputComponent InputComponent = Cast<UEnhancedInputComponent>(PlayerInputComponent);
		if(InputComponent != nullptr)
		{
			
			InputComponent.BindAction(JumpAction, ETriggerEvent::Started,FEnhancedInputActionHandlerDynamicSignature(this, n"Jump_Action"));
			InputComponent.BindAction(JumpAction, ETriggerEvent::Completed,FEnhancedInputActionHandlerDynamicSignature(this, n"StopJumppAction"));

			InputComponent.BindAction(MoveAction, ETriggerEvent::Triggered,FEnhancedInputActionHandlerDynamicSignature(this, n"Move_Action"));
			InputComponent.BindAction(LookAction, ETriggerEvent::Triggered,FEnhancedInputActionHandlerDynamicSignature(this, n"Look_Action"));
			
		}
	}


	// UFUNCTION(BlueprintOverride)
	// void BeginPlay()
	// {
	//     APlayerController PlayerController = Cast<APlayerController>( GetController());
	//     if(PlayerController != nullptr)
	//     {

	//         //Print("PlayerController Found");

			
	//         UEnhancedInputComponent InputComponent =   GetEnhanceInputComponent();// UEnhancedInputComponent::Create(this);           
	//         InputComponent.BindAction(JumpAction, ETriggerEvent::Started,FEnhancedInputActionHandlerDynamicSignature(this, n"Jump_Action"));
	//         InputComponent.BindAction(JumpAction, ETriggerEvent::Completed,FEnhancedInputActionHandlerDynamicSignature(this, n"StopJumppAction"));


	//         InputComponent.BindAction(MoveAction, ETriggerEvent::Triggered,FEnhancedInputActionHandlerDynamicSignature(this, n"Move_Action"));
	//         InputComponent.BindAction(LookAction, ETriggerEvent::Triggered,FEnhancedInputActionHandlerDynamicSignature(this, n"Look_Action"));          
	//     } 
	// }


	UFUNCTION()
	void Move_Action(FInputActionValue ActionValue, float32 ElapsedTime, float32 TriggeredTime, UInputAction SourceAction)
	{
	   // input is a Vector2D
		FVector2D MovementVector = ActionValue.GetAxis2D();// ActionValue.Get<FVector2D>();

		if (Controller != nullptr)
		{
			// find out which way is forward
			const FRotator Rotation = Controller.GetControlRotation();
			const FRotator YawRotation(0, Rotation.Yaw, 0);

			// get forward vector
			 FVector ForwardDirection =  Rotation.GetForwardVector();// FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		
			// get right vector 
			const FVector RightDirection = Rotation.GetRightVector();//GetActorRightVector();//FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);

			// add movement 
			AddMovementInput(ForwardDirection, MovementVector.Y);
			AddMovementInput(RightDirection, MovementVector.X);
		}
	}

	UFUNCTION()
	void Look_Action(FInputActionValue ActionValue, float32 ElapsedTime, float32 TriggeredTime, UInputAction SourceAction)
	{
		// input is a Vector2D
		FVector2D LookAxisVector = ActionValue.GetAxis2D();

		if (Controller != nullptr)
		{
			// add yaw and pitch input to controller
			AddControllerYawInput(LookAxisVector.X);
			AddControllerPitchInput(LookAxisVector.Y);
		}
	}


	UFUNCTION()
	void Jump_Action(FInputActionValue ActionValue, float32 ElapsedTime, float32 TriggeredTime, UInputAction SourceAction)
	{
		//FString TempLog = FString::Format("Jump_Action TriggeredTime {0}  ElapsedTime {1}", TriggeredTime, ElapsedTime);
	   // Print(TempLog);
		this.Jump();
	}

	UFUNCTION()
	void StopJumppAction(FInputActionValue ActionValue, float32 ElapsedTime, float32 TriggeredTime, UInputAction SourceAction)
	{
	   // Print("StopJumppAction");
		this.StopJumping();
	}


	UFUNCTION(BlueprintCallable)
	USpringArmComponent UGetCameraBoom()
	{
		return USpringArmComponent::Get(Owner, n"CameraBoom");
	}

	UFUNCTION(BlueprintCallable)
	UCameraComponent GetFollowCamera()
	{
		return UCameraComponent::Get(Owner, n"FollowCamera");
	}


}