#include "./RepairKit.zs" // Repait Kit
#include "./ShoulderCannon.zs" // Shoulder Cannon
#include "./Jetpack.zs" // Jetpack
#include "./UpgradeBot.zs" // Upgrade Bot

const PBX_ITEM_HELP_FLAG = "PBX_Armory_itemHelpFlags";
enum PBX_Items_TipFlags
{
	PBX_Armory_Tip_RepairKit		    = 1 << 0
	,PBX_Armory_Tip_Adrenaline          = 1 << 1
	,PBX_Armory_Tip_ShoulderCannon      = 1 << 2
	,PBX_Armory_Tip_JetPack         	= 1 << 3
	,PBX_Armory_Tip_UpgradeBot         	= 1 << 4
}

class PBX_Items_Handler : EventHandler
{
	// Handles the Shoulder Cannon and JetPack input
	override void NetworkProcess(ConsoleEvent e)
	{
		if (e.Player < 0 || !playeringame[e.Player]) 
		{
			return;
		}

		let pmo = players[e.Player].mo; if (!pmo) return;

		checkShoulderCannon(e,pmo);
		checkJetpack(e,pmo);
		
	}

	void checkShoulderCannon(ConsoleEvent e, PlayerPawn pmo)
	{
		let cannon = PBX_ShoulderCannon(pmo.FindInventory("PBX_ShoulderCannon"));
		if (!cannon) return;

		if (e.Name ~== "PBX_UseFlameBelch")
		{
			cannon.RequestFire(PBX_ShoulderCannon.EQUIP_FLAMEBELCH);
		}
		else if (e.Name ~== "PBX_UseIceBomb")
		{
			cannon.RequestFire(PBX_ShoulderCannon.EQUIP_ICEBOMB);
		}
	}

	void checkJetpack(ConsoleEvent e, PlayerPawn pmo)
	{
		let jetpack = PBX_Jetpack(pmo.FindInventory("PBX_Jetpack")); if (!jetpack) return;

		if (e.Name ~== "PBX_ToggleJetpack")
		{
			jetpack.toggleJetpack();
		}
	}

}

// --- Adrenaline ---
class PBX_Adrenaline : PB_Inventory
{
	Default
	{
		Inventory.AltHudIcon "ADRNA0";
		Inventory.PickupMessage "$ADRENAL_PICKUP";
		Inventory.PickupSound "misc/p_pkup";
		Tag "$ADRENAL_TAG";
	}

	override bool Use(bool pickup)
	{
		if(PBX_Armory_SendTip)
		{
			Array<String> tips;
			tips.Push("$PBX_Adrenaline_Tip1");
			PBXCore_TipsManager.SendTipArrayIfNeeded(tips,PBX_ITEM_HELP_FLAG,PBX_Armory_Tip_Adrenaline);
		}
		owner.A_SetBlend("Red",0.75,16);
		owner.A_GiveInventory("PBX_Items_AdreSpdGiver");
		owner.A_GiveInventory("PBX_Items_AdrePowGiver");
		return true;
	}

	States
	{
		Spawn:
			ADRN A -1;
			stop;
	}
}
class PBX_Items_AdreSpdGiver : PB_HasteGiver {mixin PBX_Armory_Duration;}
class PBX_Items_AdrePowGiver : PB_DoomGiver  {mixin PBX_Armory_Duration;}