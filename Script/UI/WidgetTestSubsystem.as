
class UWidgetTestSubsystem : UScriptWorldSubsystem 
{
	
	UPROPERTY()
	TSubclassOf<UWidgetTest> WidgetTestClass;
	
	UFUNCTION(BlueprintOverride)
	void Initialize()
	{
		
		Print("UWidgetTestSubsystem Initialized!");
		
		System::SetTimerDelegate(FTimerDynamicDelegate(this,n"SpawnWidget"),0.1f, false);
		
	}
	
	UWidgetTest WidgetTest;
	UFUNCTION()
	void SpawnWidget()
	{
		Print("SpawnWidget");
		APlayerController PlayerController = Gameplay::GetPlayerController(0);
		if (PlayerController != nullptr)
		{
			WidgetTest = Cast<UWidgetTest>(WidgetBlueprint::CreateWidget(WidgetTestClass, PlayerController));
			if (WidgetTest != nullptr)
			{
				WidgetTest.AddToViewport();
				WidgetTest.ExampleButton.OnClicked.AddUFunction(this,n"OnTextButtonClicked");
			}
		}
	}
	
	UFUNCTION()
	void OnTextButtonClicked()
	{
		WidgetTest.OnUpdateTextDelegate.Execute(100);
	}
	
	UFUNCTION(BlueprintOverride)
	void DeInitialize()
	{
		Print("UWidgetTestSubsystem DeInitialize");
	}
	
}