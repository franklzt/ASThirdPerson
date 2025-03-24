
delegate void FOnUpdateTextDelegate(int InValue);

UCLASS(Abstract)
class UWidgetTest : UUserWidget
{
	UPROPERTY(BindWidget)
	UTextBlock ExampleText;

	UPROPERTY(BindWidget)
	UButton ExampleButton;
	
	FOnUpdateTextDelegate OnUpdateTextDelegate;
		
	UFUNCTION(BlueprintOverride)
	void PreConstruct(bool bIsDesignTime)
	{
		const int RandomNumber = Math::Rand();
		const FText RandomNumberText = FText::AsCultureInvariant(f"{RandomNumber}");
		ExampleText.SetText(RandomNumberText);
		
		
	}
	
	UFUNCTION()
	void MyClickDelegate()
	{
		
	}
	
	UFUNCTION(BlueprintOverride)
	void Construct()
	{
		OnUpdateTextDelegate = FOnUpdateTextDelegate(this, n"UpdateText");
		//ExampleButton.OnClicked.AddUFunction(this, n"ExampleButtonClicked");
	}

	UFUNCTION()
	void UpdateText(int InValue)
	{
		const int RandomNumber = Math::Rand() + InValue ;
		const FText RandomNumberText = FText::AsCultureInvariant(f"{RandomNumber}");
		ExampleText.SetText(RandomNumberText);
	}
	
	// UFUNCTION()
	// private void ExampleButtonClicked()
	// {
	// 	OnExampleButtonClickedDelegate.Broadcast();
	// 	//const FText OverrideText = NSLOCTEXT("ExampleWidget", "Override", "Override!");
	// 	//ExampleText.SetText(OverrideText);
	// }
	
}