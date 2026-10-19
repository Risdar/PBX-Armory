#include "./PowerupSpheres.zs" // Powerup Spheres
#include "./AuraSpheres.zs" // Aura Spheres
#include "./TaintedSpheres.zs" // Tainted Spheres

enum PBX_Powerups_Values
{
    MEGABERSERK_HP      = 200
    ,MEGABERSERK_MAX    = 200

    ,SUPERSPHERE_HP     = 100
    ,SUPERSPHERE_MAX    = 200

    ,ULTRAARMOR_SV      = 70
    ,ULTRAARMOR_AMT     = 100

    ,HYPERSPHERE_HP     = 200
    ,HYPERSPHERE_MAX    = 200
    ,HYPERARMOR_SV      = 100
    ,HYPERARMOR_AMT     = 200

    ,MINISPHERE_HP      = 50
    ,MINISPHERE_MAX     = 200
    ,MINIARMOR_SV       = 60
    ,MINIARMOR_AMT       = 50

    ,REDSOUL_HP   		= 150
    ,REDSOUL_MAX   		= 200

	,DARKMEGA_HP   		= 200
    ,DARKMEGA_MAX   	= 200

    ,AURASPHERE_HP   	= 100
    ,AURASPHERE_MAX   	= 200

}

const PBX_POWERUP_HELP_FLAG = "PBX_Armory_powerupHelpFlags";
enum PBX_Powerups_TipFlags
{
	PBX_Powerups_Tip_BlackBlur			   = 1 << 0
	,PBX_Powerups_Tip_RedSoul              = 1 << 1
	,PBX_Powerups_Tip_DarkMega             = 1 << 2
	,PBX_Powerups_Tip_GoldInvul            = 1 << 3

	,PBX_Powerups_Tip_DeflectSphere        = 1 << 4
	,PBX_Powerups_Tip_LegendSphere         = 1 << 5
	,PBX_Powerups_Tip_TerrorSphere         = 1 << 6
	,PBX_Powerups_Tip_AmmoSphere           = 1 << 7
	,PBX_Powerups_Tip_GuardSphere          = 1 << 8


	,PBX_Powerups_Tip_FrostAura            = 1 << 9
	,PBX_Powerups_Tip_FireAura             = 1 << 10
	,PBX_Powerups_Tip_ElectricAura         = 1 << 11

	,PBX_Powerups_Tip_Adrenaline           = 1 << 12

}

mixin class PBX_PowerupTimer
{
	int time;
	bool lf;

	void PowerupTimer(color col, color col2 = 0)
	{
		time = EffectTics;
		switch(time)
		{
			case 105:
			case 70:
			case 35:
				lf = CVar.GetCVar("pb_lowflashesmode", owner.player).GetBool();
				owner.A_SetBlend(col, lf ? 0.08 : 0.25, lf ? 20 : 12, col2);
				owner.A_StartSound("powerup/countdown", CHAN_AUTO, CHANF_OVERLAP | CHANF_UI);
			default:
				break;
		}
	}
	
	void EndBlend(color col, color col2 = 0)
	{ 
		owner.A_SetBlend(col, lf ? 0.1 : 0.50, 35, col2);
		owner.A_StartSound("powerup/ranout", CHAN_AUTO, CHANF_OVERLAP | CHANF_UI); 
	}

	override void PlayPickupSound(actor toucher)
	{
		let hnd  = PB_EventHandler(EventHandler.Find("PB_EventHandler"));
		if(hnd)
		{
			if(hnd.pickuptic[toucher.PlayerNumber()]==gametic) return;
			hnd.pickuptic[toucher.PlayerNumber()] = gametic;
		}
		double atten;
		int flags = CHANF_OVERLAP|CHANF_MAYBE_LOCAL;
		if(bNoAttenPickupSound) atten = ATTN_NONE;
		else atten = ATTN_NORM;
		if(toucher && toucher.CheckLocalView()) flags |= CHANF_NOPAUSE;
		toucher.A_StartSound(PickupSound,1002,flags,1.0,atten);
	}
}