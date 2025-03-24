class AMySGameMode :AGameModeBase
{
    TSubclassOf<APawn> CustomGetPawnClass(bool bInUseGloble = true)
    {        
        if(bInUseGloble)
        {
            // use bind globle function to get the default pawn class
            return GetDefaultPawnInAs("/Script/Engine.Blueprint'/Game/ASCharacter/BP_ASCharacter.BP_ASCharacter_C'");
        }
        else
        {
            // use bind mixin function to get the default pawn class
            return this.GetDefaultPawnByPath("/Script/Engine.Blueprint'/Game/ASCharacter/BP_ASCharacter.BP_ASCharacter_C'");
        }        
    }

    UPROPERTY(EditAnywhere)
    bool bUseGloble = true;

    default DefaultPawnClass = CustomGetPawnClass(bUseGloble);
}