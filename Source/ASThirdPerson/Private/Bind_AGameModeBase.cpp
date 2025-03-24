#include "AngelscriptBinds.h"
#include "AngelscriptManager.h"
#include "GameFramework/GameModeBase.h"
#include "Runtime/Engine/Classes/GameFramework/Pawn.h"
#include "UObject/ConstructorHelpers.h"
#include "UObject/GarbageCollectionSchema.h"

AS_FORCE_LINK const FAngelscriptBinds::FBind Bind_AGameModeBase(FAngelscriptBinds::EOrder::Late, [] {
#if !WITH_ANGELSCRIPT_HAZE

	
FAngelscriptBinds::BindGlobalFunction(
	"TSubclassOf<APawn> GetDefaultPawnInAs(const FString& Name)",
[](const FString& Name) ->TSubclassOf<APawn>
{
	static ConstructorHelpers::FClassFinder<APawn> PlayerPawnBPClass(*Name);
	if (PlayerPawnBPClass.Class != NULL)
	{
		return PlayerPawnBPClass.Class;
	}
	return nullptr;
});
#endif
});