#include "./RepairKit.zs" // Repait Kit
#include "./ShoulderCannon.zs" // Shoulder Cannon
#include "./Jetpack.zs" // Jetpack
#include "./UpgradeBot.zs" // Upgrade Bot
#include "./SmartScav.zs" // Smart Scavenger

const PBX_ITEM_HELP_FLAG = "PBX_Armory_itemHelpFlags";
enum PBX_Items_TipFlags
{
	PBX_Armory_Tip_RepairKit		    = 1 << 0
	,PBX_Armory_Tip_ShoulderCannon      = 1 << 1
	,PBX_Armory_Tip_JetPack         	= 1 << 2
	,PBX_Armory_Tip_UpgradeBot         	= 1 << 3
	,PBX_Armory_Tip_SmartScav         	= 1 << 4
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
