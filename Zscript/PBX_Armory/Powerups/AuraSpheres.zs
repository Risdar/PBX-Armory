//////////////////////////// ELECTRIC AURA ///////////////////////////////////////////////////////////////////////////////
class PBX_ElectricAuraSphere : PB_Inventory
{
	Default
	{
		Inventory.AltHudIcon "VELAA0";
		Inventory.PickupMessage "$ELECTAURA_PICKUP";
		Inventory.PickupSound "MEGASPH";
		+FLOATBOB
		floatbobstrength .4;
		Tag "$ELECTAURA_PICKUP";
	}

	override bool Use(bool pickup)
	{
		if(PBX_Armory_SendTip)
		{
			Array<String> tips;
			tips.Push("$PBX_ElectAura_Tip1");
			PBXCore_TipsManager.SendTipArrayIfNeeded(tips,PBX_POWERUP_HELP_FLAG,PBX_Armory_Tip_ElectricAura);
		}
		owner.GiveBody(AURASPHERE_HP,AURASPHERE_MAX);
		owner.A_SetBlend("RoyalBlue1",0.75,16);
		owner.A_GiveInventory("PBX_ElectricAuraGiver");
		return true;
	}

	States
	{
        Spawn:
            VELA ABCDEFGHDEF 3 bright;
            Loop;
	}
}

//////////////////////////// FROST AURA ///////////////////////////////////////////////////////////////////////////////
class PBX_FrostAuraSphere : PB_Inventory
{
	Default
	{
		Inventory.AltHudIcon "VFRAA0";
		Inventory.PickupMessage "$FROSTAURA_PICKUP";
		Inventory.PickupSound "MEGASPH";
		+FLOATBOB
		floatbobstrength .4;
		Tag "$FROSTAURA_PICKUP";
	}

	override bool Use(bool pickup)
	{
		if(PBX_Armory_SendTip)
		{
			Array<String> tips;
			tips.Push("$PBX_FrostAura_Tip1");
			PBXCore_TipsManager.SendTipArrayIfNeeded(tips,PBX_POWERUP_HELP_FLAG,PBX_Armory_Tip_FrostAura);
		}
		owner.GiveBody(AURASPHERE_HP,AURASPHERE_MAX);
		owner.A_SetBlend("LightCyan",0.75,16);
		owner.A_GiveInventory("PBX_FrostAuraGiver");
		return true;
	}

	States
	{
        Spawn:
            VFRA ABCDEFGHGFEDCB 3 bright;
            Loop;
	}
}

//////////////////////////// FIRE AURA ///////////////////////////////////////////////////////////////////////////////
class PBX_FireAuraSphere : PB_Inventory
{
	Default
	{
		Inventory.AltHudIcon "VFIAA0";
		Inventory.PickupMessage "$FIREAURA_PICKUP";
		Inventory.PickupSound "MEGASPH";
		+FLOATBOB
		floatbobstrength .4;
		Tag "$FIREAURA_PICKUP";
	}

	override bool Use(bool pickup)
	{
		if(PBX_Armory_SendTip)
		{
			Array<String> tips;
			tips.Push("$PBX_FireAura_Tip1");
			PBXCore_TipsManager.SendTipArrayIfNeeded(tips,PBX_POWERUP_HELP_FLAG,PBX_Armory_Tip_FireAura);
		}
		owner.GiveBody(AURASPHERE_HP,AURASPHERE_MAX);
		owner.A_SetBlend("firebrick4",0.75,16);
		owner.A_GiveInventory("PBX_FireAuraGiver");
		return true;
	}

	States
	{
        Spawn:
            VFIA ABCDEFGH 5 bright;
            Loop;
	}
}