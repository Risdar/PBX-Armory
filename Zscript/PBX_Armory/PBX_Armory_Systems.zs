mixin class PBX_Armory_Duration
{
    override void BeginPlay()
	{
		super.BeginPlay();
		name cvr = getDuration(self);
		EffectTics = cvr != '' ? PBXCore_Duration.GetByCVar(cvr) : 0;
	}

    name getDuration(actor mActor)
	{
		switch(mActor.getClassName())
		{
            // Powerups
			case 'PBX_Powerups_InvulTaintedGiver': 	return 'PBX_Powerups_GoldInv_duration';
			case 'PBX_Powerups_FrightenerGiver': 	return 'PBX_Powerups_Terror_duration';
			case 'PBX_Powerups_InfAmmoGiver': 	    return 'PBX_Powerups_Infammo_duration';
			case 'PBX_Powerups_TimeFreezeGiver': 	return 'PBX_Powerups_Timefreeze_duration';
            // Items
			case 'PBX_Items_AdreSpdGiver':
			case 'PBX_Items_AdrePowGiver': 		    return 'PBX_Items_Adrenaline_duration';
            // Armors
            case 'WhiteArmor_Regeneration': 	    return 'PBX_Armors_White_duration';
			case 'DemonArmor_Frightener': 		    return 'PBX_Armors_Demon_duration';
			case 'CyanArmor_TimeFreezer':
			case 'CyanArmor_Haste': 	            return 'PBX_Armors_Cyan_duration';
			case 'DPurpleArmor_InfAmmo': 	        return 'PBX_Armors_DPurple_duration';
			case 'LGreenArmor_Invul': 	            return 'PBX_Armors_LGreen_duration';
		}
		return '';
	}

}

class PBX_Armory_Handler : EventHandler
{
	// Gives the player shoulder cannon if enabled
	Override void PlayerEntered(PlayerEvent e)
    {
		// Get player pointer
        let pm = players[e.PlayerNumber].mo;
		if(!pm) return;

		// Dont continue if its the titlemap
        if (level.MapName == "TITLEMAP") return;
		
		PBXCore_Handler.TryGiveInventory(pm,whatToGive:'PBX_Armors_TipsManager', diffCheck:false);

        if(PBX_Items_ShouldCanStart && !PBXCore_GlorykillLoaded) 
		{
			PBXCore_Handler.TryGiveInventory(pm,whatToGive:'PBX_ShoulderCannon', diffCheck:false);
		}

    }
}

class PBX_ArmorBase : PB_Armor abstract
{
    Default
    {
        PBX_ArmorBase.ArmorToken '';
        Inventory.PickupSound "ARMOR"; 
        Scale 0.2; 
    }

    name armortoken;
    property ArmorToken : armortoken;

    static const name ArmorInvTokens[] = { 'RepulsorToken', 'SecondChanceToken' };
    static const name ArmorBehaviors[] = { 'ReactiveArmorBehavior', 'MagneticBehavior', 'AquaticBehavior' };

    void giveArmorTokens(Actor toucher)
    {
        // Clear Tokens & Behaviors
        for (int i = 0; i < ArmorInvTokens.Size(); i++)
            toucher.TakeInventory(ArmorInvTokens[i], 1);

        for (int i = 0; i < ArmorBehaviors.Size(); i++)
            toucher.RemoveBehavior(ArmorBehaviors[i]);

        if (armortoken == '') return;

        // armortoken may name either an Inventory token or a Behavior
        class<Behavior> bc = (class<Behavior>)(armortoken);
        if (bc)
            toucher.AddBehavior(bc);
        else
            toucher.GiveInventory(armortoken, 1);
    }

    override bool TryPickup(in out Actor toucher)
    {
        bool pickup = Super.TryPickup(toucher);
        if (pickup)
            giveArmorTokens(toucher);

        return pickup;
    }

    override string PickupMessage()
    {
        return String.Format(StringTable.Localize("$PBX_ArmorPickup"), StringTable.Localize(pickupMsg),int(self.SavePercent),int(self.SaveAmount));
    }

}

// Dies when the owner has no armor left
class PBXArmorBehavior : Behavior abstract
{
    virtual void ArmorTick() {}

    override void Tick()
    {
        if (!Owner || Owner.CountInv("BasicArmor") <= 0)
        {
            Destroy();
            return;
        }
        ArmorTick();
    }
}