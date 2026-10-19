mixin class PBX_Armory_Duration
{
    override void BeginPlay()
	{
		super.BeginPlay();
		EffectTics = getDuration(self);
	}

    int getDuration(actor mActor)
	{
        if(!mActor) return 1; 
        
		name tmp;
		switch(mActor.getClassName())
		{
            // Tainted Spheres
			case 'PBX_PowerInvisTainted': 	    tmp = 'pbx_invistaint_duration'; 	break;
			case 'PBX_PowerDeflect': 		    tmp = 'pbx_deflect_duration'; 		break;
			case 'PBX_PowerInvulTainted': 	    tmp = 'pbx_invultaint_duration'; 	break;
			case 'PBX_PowerTaintedRegen': 	    tmp = 'pbx_taintregen_duration'; 	break;
			// Vanilla Powerups
			case 'PBX_PowerBuddha': 		    tmp = 'pbx_buddha_duration'; 		break;
			case 'PBX_PowerDrain': 		 	    tmp = 'pbx_drain_duration'; 		break;
			case 'PBX_PowerFlight': 		    tmp = 'pbx_flight_duration'; 		break;
			case 'PBX_PowerFrightener': 	    tmp = 'pbx_frightener_duration'; 	break;
			case 'PBX_PowerHighJump': 		    tmp = 'pbx_highjump_duration'; 		break;
			case 'PBX_PowerInfiniteAmmo': 	    tmp = 'pbx_infammo_duration'; 		break;
			case 'PBX_PowerProtection': 	    tmp = 'pbx_protect_duration'; 		break;
			case 'PBX_PowerReflection': 	    tmp = 'pbx_reflect_duration'; 		break;
			case 'PBX_PowerRegeneration': 	    tmp = 'pbx_regen_duration'; 		break;
			case 'PBX_PowerTimeFreezer': 	    tmp = 'pbx_timefreeze_duration'; 	break;
			// Aura Spheres
			case 'PBX_PowerElectAura': 	 	    tmp = 'pbx_electaura_duration'; 	break;
			case 'PBX_PowerFrostAura': 	 	    tmp = 'pbx_frostaura_duration'; 	break;
			case 'PBX_PowerFireAura': 		    tmp = 'pbx_fireaura_duration'; 		break;
			// Others
            case 'PBX_Adrenaline_Speed': 
			case 'PBX_Adrenaline_QuadGiver':    tmp = 'pbx_adrenaline_duration'; 	break;
            // Armors
            case 'WhiteArmor_Regeneration': 	tmp = 'PBX_WhiteArmor_duration';    break;
			case 'DemonArmor_Frightener': 		tmp = 'PBX_DemonArmor_duration';    break;
			case ';CyanArmor_TimeFreezer':
			case 'CyanArmor_Haste': 	        tmp = 'PBX_CyanArmor_duration';     break;
			case 'DPurpleArmor_InfAmmo': 	    tmp = 'PBX_DPurpleArmor_duration';  break;
			case 'LGreenArmor_Invul': 	        tmp = 'PBX_LGreenArmor_duration';   break;
		}

        let c = CVar.FindCVar(tmp);
        int mResult = c ? c.GetInt() * Object.TICRATE : 1;  // So its always in seconds
		PBXCore_Debug.PrintInt("Getting CVar %d",mResult);
        return mResult;
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

    override void NetworkProcess(ConsoleEvent e)
	{
		let pm = players[e.player].mo;
		if(!pm)
			return;
			
		if (e.Name ~== "PBX_AllPowerups")
		{
			pm.giveinventory("PB_PowerInvul",1);
			pm.giveinventory("PB_PowerIronFeet",1);
			pm.giveinventory("PB_PowerInvis",1);
			pm.giveinventory("PB_PowerLightAmp",1);
			pm.giveinventory("PB_PowerDoomDamage",1);
			pm.giveinventory("PB_PowerSpeed",1);

			pm.giveinventory("PBX_PowerInvisTainted",1);
			pm.giveinventory("PBX_PowerInvulTainted",1);
			pm.giveinventory("PBX_PowerTaintedRegen",1);

			pm.giveinventory("PBX_PowerDeflect",1);
			pm.giveinventory("PBX_PowerBuddha",1);
			pm.giveinventory("PBX_PowerDrain",1);
			pm.giveinventory("PBX_PowerFlight",1);
			pm.giveinventory("PBX_PowerFrightener",1);
			pm.giveinventory("PBX_PowerHighJump",1);
			pm.giveinventory("PBX_PowerInfiniteAmmo",1);
			pm.giveinventory("PBX_PowerProtection",1);
			pm.giveinventory("PBX_PowerReflection",1);
			pm.giveinventory("PBX_PowerRegeneration",1);
			pm.giveinventory("PBX_PowerTimeFreezer",1);

			pm.giveinventory("PBX_PowerElectAura",1);
			pm.giveinventory("PBX_PowerFrostAura",1);
			pm.giveinventory("PBX_PowerFireAura",1);
		}
		
	}
}