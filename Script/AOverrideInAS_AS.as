class AAOverrideInAS_AS : AOverrideInAS_CPP
{
	UFUNCTION(BlueprintOverride)
	void FunctionInCpp()
	{
        Print("Override FunctionInCpp in AS");
        FunctionToCallInAs();
	}
}