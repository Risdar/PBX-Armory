enum PBX_Armory_PowerupSpawns
{
	DisableMegaBerserk			= 1 << 0
	,DisableSuperSphere			= 1 << 1
	,DisableUltraSphere			= 1 << 2
	,DisableHyperSphere			= 1 << 3
	,DisableMiniSphere			= 1 << 4

	,DisableBlackBlur			= 1 << 5
	,DisableDeflectSphere        = 1 << 6
	,DisableElectricAura         = 1 << 7
	,DisableGoldInvul            = 1 << 8
	,DisableLegendSPhere         = 1 << 9
	,DisableLifestealOrb         = 1 << 10
	,DisableTerrorSphere         = 1 << 11
	,DisableAmmoSphere           = 1 << 12
	,DisableGuardSphere          = 1 << 13
	,DisableRegenSphere          = 1 << 14
	,DisableTimeSphere           = 1 << 15

	,DisableRedSoul              = 1 << 16
	,DisableDarkMega             = 1 << 17

	,DisableHaste                = 1 << 18
	,DisableQuadDamage           = 1 << 19

	,DisableFrostAura            = 1 << 20
	,DisableFireAura             = 1 << 21

	,DisableFlightSphere         = 1 << 22

}

enum PBX_Armory_ItemSpawns
{
	DisableRepairKit			= 1 << 0
	,DisableAdrenaline          = 1 << 1
	,DisableShoulderCannon      = 1 << 2
	,DisableJetPack             = 1 << 3
	,DisableUpgradeBot          = 1 << 4
	,DisableSmartScav           = 1 << 5

}

enum PBX_Armory_ArmorSpawns
{
	DisableRed			= 1 << 0
	,DisablePurple		= 1 << 1
	,DisableWhite		= 1 << 2
	,DisableOrange		= 1 << 3
	,DisableYellow		= 1 << 4
	,DisableBlack		= 1 << 5
	,DisableDemon		= 1 << 6
	,DisableCyan		= 1 << 7
	,DisableDarkPurple	= 1 << 8
	,DisableDarkRed		= 1 << 9
	,DisableGold		= 1 << 10
	,DisableGray		= 1 << 11
	,DisableLightBlue	= 1 << 12
	,DisableLightGreen	= 1 << 13
	,DisablePink		= 1 << 14
	,DisableHelmetDrop	= 1 << 15
}

class PBX_Armory_Injector : PBInjector	//your injector needs to inherit from PBInjector
{
	override void Init(PB_EventHandler handler)		//override this
	{
        name powerupsFlag = "PBX_Armory_powerupfilter";
        name itemsFlag = "PBX_Armory_itemFilter";
        name armorsFlag = "PBX_Armory_armorFilter";

//////////////////////////// POWERUPS ///////////////////////////////////////////////////////////////////////////////
        if(!CheckFlag(DisableMegaBerserk,powerupsFlag))
        {
            handler.InjectSpawn('PB_BerserkSpawnerT2', 'PBX_MegaBerserk', 255, 1);
            handler.InjectSpawn('PB_BerserkSpawnerT3', 'PBX_MegaBerserk', 255, 1);
            handler.InjectSpawn('PB_BerserkSpawnerT4', 'PBX_MegaBerserk', 255, 1);
        }

        if(!CheckFlag(DisableSuperSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT2', 'PBX_SuperSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_SuperSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_SuperSphere', 255, 1);
        }

        if(!CheckFlag(DisableUltraSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_UltraSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_UltraSphere', 255, 1);
        }

        if(!CheckFlag(DisableHyperSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_MegaSpawnerT2', 'PBX_HyperSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT3', 'PBX_HyperSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT4', 'PBX_HyperSphere', 255, 1);
        }

        if(!CheckFlag(DisableMiniSphere,powerupsFlag))
        {
		    handler.InjectSpawn('PB_GreenSpawnerT3', 'PBX_MiniSphere', 255, 1);
		    handler.InjectSpawn('PB_GreenSpawnerT4', 'PBX_MiniSphere', 255, 1);
        }

        if(!CheckFlag(DisableBlackBlur,powerupsFlag))
        {
            handler.InjectSpawn('PB_BlurSpawnerT1', 'PBX_BlackBlur', 255, 1);
            handler.InjectSpawn('PB_BlurSpawnerT2', 'PBX_BlackBlur', 255, 1);
            handler.InjectSpawn('PB_BlurSpawnerT3', 'PBX_BlackBlur', 255, 1);
            handler.InjectSpawn('PB_BlurSpawnerT4', 'PBX_BlackBlur', 255, 1);
        }

        if(!CheckFlag(DisableDeflectSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT1', 'PBX_DeflectSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT2', 'PBX_DeflectSphere', 255, 1);
        }

        if(!CheckFlag(DisableElectricAura,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_ElectricAuraSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_ElectricAuraSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT2', 'PBX_ElectricAuraSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT3', 'PBX_ElectricAuraSphere', 255, 1);
        }
        
        if(!CheckFlag(DisableGoldInvul,powerupsFlag))
        {
            handler.InjectSpawn('PB_InvulSpawnerT1', 'PBX_GoldInvul', 255, 1);
            handler.InjectSpawn('PB_InvulSpawnerT2', 'PBX_GoldInvul', 255, 1);
            handler.InjectSpawn('PB_InvulSpawnerT3', 'PBX_GoldInvul', 255, 1);
            handler.InjectSpawn('PB_InvulSpawnerT4', 'PBX_GoldInvul', 255, 1);
        }
        
        if(!CheckFlag(DisableLegendSPhere,powerupsFlag))
        {
            handler.InjectSpawn('PB_InvulSpawnerT1', 'PBX_LegendSphere', 255, 1);
            handler.InjectSpawn('PB_InvulSpawnerT2', 'PBX_LegendSphere', 255, 1);
            handler.InjectSpawn('PB_InvulSpawnerT3', 'PBX_LegendSphere', 255, 1);
            handler.InjectSpawn('PB_InvulSpawnerT4', 'PBX_LegendSphere', 255, 1);
        }
        
        if(!CheckFlag(DisableLifestealOrb,powerupsFlag))
        {
            handler.InjectSpawn('PB_BerserkSpawnerT1', 'PBX_MegaBerserk', 255, 1);
            handler.InjectSpawn('PB_BerserkSpawnerT2', 'PBX_MegaBerserk', 255, 1);
            handler.InjectSpawn('PB_BerserkSpawnerT3', 'PBX_MegaBerserk', 255, 1);
            handler.InjectSpawn('PB_BerserkSpawnerT4', 'PBX_MegaBerserk', 255, 1);
        }
        
        if(!CheckFlag(DisableTerrorSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT1', 'PBX_TerrorSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT2', 'PBX_TerrorSphere', 255, 1);

        }
        
        if(!CheckFlag(DisableAmmoSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT1', 'PBX_AmmoSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT2', 'PBX_AmmoSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_AmmoSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_AmmoSphere', 255, 1);
        }
        
        if(!CheckFlag(DisableGuardSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT1', 'PBX_GuardSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT2', 'PBX_GuardSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_GuardSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_GuardSphere', 255, 1);
        }
        
        if(!CheckFlag(DisableRegenSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT1', 'PBX_RegenSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT2', 'PBX_RegenSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_RegenSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_RegenSphere', 255, 1);

            handler.InjectSpawn('PB_MediSpawnerT4', 'PBX_RegenSphere', 255, 1);
        }
        
        if(!CheckFlag(DisableTimeSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_TimeSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT4', 'PBX_TimeSphere', 255, 1);
            handler.InjectSpawn('PB_InvulSpawnerT4', 'PBX_TimeSphere', 255, 1);
        }

        if(!CheckFlag(DisableRedSoul,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT1', 'PBX_RedSoulSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT2', 'PBX_RedSoulSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_RedSoulSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_RedSoulSphere', 255, 1);
        }

        if(!CheckFlag(DisableDarkMega,powerupsFlag))
        {
            handler.InjectSpawn('PB_MegaSpawnerT1', 'PBX_DarkMegaSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT2', 'PBX_DarkMegaSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT3', 'PBX_DarkMegaSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT4', 'PBX_DarkMegaSphere', 255, 1);

        }

        if(!CheckFlag(DisableHaste,powerupsFlag))
        {
            handler.InjectSpawn('PB_BlurSpawnerT1', 'PB_Haste', 255, 1);
            handler.InjectSpawn('PB_BlurSpawnerT2', 'PB_Haste', 255, 1);
        }

        if(!CheckFlag(DisableQuadDamage,powerupsFlag))
        {
            handler.InjectSpawn('PB_BlurSpawnerT3', 'PB_Doomsphere', 255, 1);
            handler.InjectSpawn('PB_BlurSpawnerT4', 'PB_Doomsphere', 255, 1);
        }

        if(!CheckFlag(DisableFrostAura,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_FrostAuraSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_FrostAuraSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT2', 'PBX_FrostAuraSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT3', 'PBX_FrostAuraSphere', 255, 1);
        }

        if(!CheckFlag(DisableFireAura,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_FireAuraSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_FireAuraSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT2', 'PBX_FireAuraSphere', 255, 1);
            handler.InjectSpawn('PB_MegaSpawnerT3', 'PBX_FireAuraSphere', 255, 1);
        }

        if(!CheckFlag(DisableFlightSphere,powerupsFlag))
        {
            handler.InjectSpawn('PB_SoulSphereSpawnerT3', 'PBX_FlightSphere', 255, 1);
            handler.InjectSpawn('PB_SoulSphereSpawnerT4', 'PBX_FlightSphere', 255, 1);
        }

//////////////////////////// ITEMS ///////////////////////////////////////////////////////////////////////////////
        if(!CheckFlag(DisableRepairKit,itemsFlag))
        {
            handler.InjectSpawn('PB_PackSpawnerT1', 'PBX_RepairKit', 255, 1);
            handler.InjectSpawn('PB_PackSpawnerT2', 'PBX_RepairKit', 255, 1);
            handler.InjectSpawn('PB_PackSpawnerT3', 'PBX_RepairKit', 255, 1);
            handler.InjectSpawn('PB_PackSpawnerT4', 'PBX_RepairKit', 255, 1);
        }

        if(!CheckFlag(DisableAdrenaline,itemsFlag))
        {
            handler.InjectSpawn('PB_BerserkSpawnerT1', 'PBX_Adrenaline', 255, 1);
            handler.InjectSpawn('PB_BerserkSpawnerT2', 'PBX_Adrenaline', 255, 1);
            handler.InjectSpawn('PB_BerserkSpawnerT3', 'PBX_Adrenaline', 255, 1);
            handler.InjectSpawn('PB_BerserkSpawnerT4', 'PBX_Adrenaline', 255, 1);
        }

        if(!CheckFlag(DisableShoulderCannon,itemsFlag) && !PBXCore_GlorykillLoaded)
        {
            handler.InjectSpawn('PB_PackSpawnerT2', 'PBX_ShoulderCannon', 255, 1);
            handler.InjectSpawn('PB_PackSpawnerT3', 'PBX_ShoulderCannon', 255, 1);
            handler.InjectSpawn('PB_PackSpawnerT4', 'PBX_ShoulderCannon', 255, 1);
        }

        if(!CheckFlag(DisableJetPack,itemsFlag))
        {
            handler.InjectSpawn('PB_RocketBoxSpawnerT2', 'PBX_Jetpack', 255, 1);
            handler.InjectSpawn('PB_RocketBoxSpawnerT3', 'PBX_Jetpack', 255, 1);
        }

        if(!CheckFlag(DisableUpgradeBot,itemsFlag))
        {
            // handler.InjectSpawn('PB_UpgradeSpawnerT1', 'PBX_Armory_UpgradeBot', 255, 1);
            handler.InjectSpawn('PB_UpgradeSpawnerT2', 'PBX_Armory_UpgradeBot', 255, 1);
            handler.InjectSpawn('PB_UpgradeSpawnerT3', 'PBX_Armory_UpgradeBot', 255, 1);
            // handler.InjectSpawn('PB_UpgradeSpawnerT4', 'PBX_Armory_UpgradeBot', 255, 1);
        }

//////////////////////////// ARMORS ///////////////////////////////////////////////////////////////////////////////
        // Red 0
        if(!CheckFlag(DisableRed,armorsFlag))
		{
			handler.InjectSpawn('PB_BlueSpawnerT2', 'PBX_RedArmor', 255, 1);
			handler.InjectSpawn('PB_BlueSpawnerT3', 'PBX_RedArmor', 255, 1);
		}

		// Purple 1
        if(!CheckFlag(DisablePurple,armorsFlag))
		{
			handler.InjectSpawn('PB_GreenSpawnerT3', 'PBX_PurpleArmor', 255, 1);
			handler.InjectSpawn('PB_GreenSpawnerT4', 'PBX_PurpleArmor', 255, 1);
		}

		// White 2
        if(!CheckFlag(DisableWhite,armorsFlag))
		{
			handler.InjectSpawn('PB_BlueSpawnerT1', 'PBX_WhiteArmor', 255, 1);
		}

		// Orange 3
        if(!CheckFlag(DisableOrange,armorsFlag))
		{
			handler.InjectSpawn('PB_BlueSpawnerT1', 'PBX_OrangeArmor', 255, 1);
		}

		// Yellow 4
        if(!CheckFlag(DisableYellow,armorsFlag))
		{
			handler.InjectSpawn('PB_GreenSpawnerT2', 'PBX_YellowArmor', 255, 1);
			handler.InjectSpawn('PB_GreenSpawnerT3', 'PBX_YellowArmor', 255, 1);
		}

		// Black 5
        if(!CheckFlag(DisableBlack,armorsFlag))
		{
			handler.InjectSpawn('PB_BlueSpawnerT1', 'PBX_BlackArmor', 255, 1);
			handler.InjectSpawn('PB_BlueSpawnerT2', 'PBX_BlackArmor', 255, 1);
		}
		
		// Demon 6
        if(!CheckFlag(DisableDemon,armorsFlag))
		{
			handler.InjectSpawn('PB_BlueSpawnerT3', 'PBX_DemonArmor', 255, 1);
			handler.InjectSpawn('PB_BlueSpawnerT4', 'PBX_DemonArmor', 255, 1);
		}

		// Cyan 7
        if(!CheckFlag(DisableCyan,armorsFlag))
		{
			handler.InjectSpawn('PB_BlueSpawnerT3', 'PBX_CyanArmor', 255, 1);
			handler.InjectSpawn('PB_BlueSpawnerT4', 'PBX_CyanArmor', 255, 1);
		}

		// Dark Purple 8
        if(!CheckFlag(DisableDarkPurple,armorsFlag))
		{
			handler.InjectSpawn('PB_GreenSpawnerT4', 'PBX_DarkPurpleArmor', 255, 1);
		}

		// Dark Red 9
        if(!CheckFlag(DisableDarkRed,armorsFlag))
		{
			handler.InjectSpawn('PB_BlueSpawnerT4', 'PBX_DarkRedArmor', 255, 1);
		}
		
		// Gold 10
        if(!CheckFlag(DisableGold,armorsFlag))
		{
			handler.InjectSpawn('PB_GreenSpawnerT4', 'PBX_GoldArmor', 255, 1);
		}

		// Gray 11
        if(!CheckFlag(DisableGray,armorsFlag))
		{
			handler.InjectSpawn('PB_GreenSpawnerT1', 'PBX_GrayArmor', 255, 1);
			handler.InjectSpawn('PB_GreenSpawnerT2', 'PBX_GrayArmor', 255, 1);
			handler.InjectSpawn('PB_GreenSpawnerT3', 'PBX_GrayArmor', 255, 1);
			handler.InjectSpawn('PB_GreenSpawnerT4', 'PBX_GrayArmor', 255, 1);
		}

		// Light Blue 12
        if(!CheckFlag(DisableLightBlue,armorsFlag))
		{
			handler.InjectSpawn('PB_GreenSpawnerT2', 'PBX_LightBlueArmor', 255, 1);
			handler.InjectSpawn('PB_GreenSpawnerT3', 'PBX_LightBlueArmor', 255, 1);
		}

		// Light Green 13
        if(!CheckFlag(DisableLightGreen,armorsFlag))
		{
			handler.InjectSpawn('PB_BlueSpawnerT4', 'PBX_LightGreenArmor', 255, 1);
		}

		// Pink 14
        if(!CheckFlag(DisablePink,armorsFlag))
		{
			handler.InjectSpawn('PB_BlueSpawnerT2', 'PBX_PinkArmor', 255, 1);
		}
		
	}

    bool CheckFlag(int tipFlag, string name)
    {
        let check = CVar.FindCVar(name);
        return (check.GetInt() & tipflag) == tipflag;
    }
}

class PBX_SmartScavHandler : EventHandler
{
    override void CheckReplacement(ReplaceEvent e) 
	{
        if(PBX_Armory_itemFilter & DisableSmartScav) 
        {
            return;
        }

        switch(e.Replacee.GetClassName())
        {
            case 'PB_CellPack':   e.Replacement  = "Smartscav_Cells";    break;
            case 'PB_ShellBox':   e.Replacement  = "Smartscav_Shells";   break;
            case 'PB_RocketBox':  e.Replacement  = "Smartscav_Rockets";  break;
            case 'PB_HighCalBox': e.Replacement  = "Smartscav_HighCal";  break;
            case 'PB_LowCalBox':  e.Replacement  = "Smartscav_LowCal";   break;
            case 'PB_Medikit':    e.Replacement  = "Smartscav_Medikit";  break;
        }
    }

}