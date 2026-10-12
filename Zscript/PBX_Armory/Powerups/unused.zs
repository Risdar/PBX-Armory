// --- PowerHighJump ---
class PBX_BuddhaSphere : PB_Inventory
{
	Default
	{
		Inventory.PickupMessage "Legend Sphere";
		Inventory.PickupSound "MEGASPH";
		+FLOATBOB
		floatbobstrength .4;
		Scale .73;
	}

	override bool Use(bool pickup)
	{
		owner.A_SetBlend("DarkOrange",0.75,16);
		owner.A_GiveInventory("PBX_Armory_BuddhaGiver");
		return true;
	}

	States
	{
	Spawn:
		LESP ABCD 6 bright;
		loop;
	}
}

// --- PowerReflection ---
class PBX_BuddhaSphere : PB_Inventory
{
	Default
	{
		Inventory.PickupMessage "Legend Sphere";
		Inventory.PickupSound "MEGASPH";
		+FLOATBOB
		floatbobstrength .4;
		Scale .73;
	}

	override bool Use(bool pickup)
	{
		owner.A_SetBlend("DarkOrange",0.75,16);
		owner.A_GiveInventory("PBX_Armory_BuddhaGiver");
		return true;
	}

	States
	{
	Spawn:
		LESP ABCD 6 bright;
		loop;
	}
}