
class USTestAbility : UAngelscriptGASAbility
{
	
	UFUNCTION(BlueprintOverride)
	void ActivateAbility()
	{
		Print("Ability Activated");
	}
}