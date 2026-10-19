#include "./HelmetDrops.zs" // Helmet Drops
#include "./PBX_Armors.zs" // Armor Pickups

enum PBX_Armors_ArmorValues
{
    RED_PERCENT              = 90
    ,RED_AMOUNT              = 160

    ,PURPLE_PERCENT          = 90
    ,PURPLE_AMOUNT           = 140

    ,WHITE_PERCENT           = 100
    ,WHITE_AMOUNT            = 200
    ,REGEN_STRENGTH          = 8

    ,ORANGE_PERCENT          = 70
    ,ORANGE_AMOUNT           = 160

    ,YELLOW_PERCENT          = 50
    ,YELLOW_AMOUNT           = 130

    ,BLACK_PERCENT           = 70
    ,BLACK_AMOUNT            = 160

    ,DEMON_PERCENT           = 100
    ,DEMON_AMOUNT            = 200

    ,CYAN_PERCENT            = 100
    ,CYAN_AMOUNT             = 40

    ,DPURPLE_PERCENT         = 33
    ,DPURPLE_AMOUNT          = 100

    ,DRED_PERCENT            = 100
    ,DRED_AMOUNT             = 200

    ,GOLD_PERCENT            = 100
    ,GOLD_AMOUNT             = 70

    // Gray Armor values are randomized 
    // between 1 and this value below
    ,GRAY_AMOUNT             = 150

    ,LBLUE_PERCENT           = 50
    ,LBLUE_AMOUNT            = 150

    // Light Green will give the player the Guardian Armor
    // If they're below a threshold
    ,LGREEN_PERCENT          = 33
    ,LGREEN_AMOUNT           = 100
    ,GUARDIAN_HP             = 200
    ,GUARDIAN_PERCENT        = 100
    ,GUARDIAN_AMOUNT         = 200

    ,PINK_PERCENT            = 100
    ,PINK_AMOUNT             = 200
    ,STUN_FREQ               = 15    // How frequent should the debuff happens (in tics)  

}

const PBX_ARMOR_HELP_FLAG = "PBX_Armory_armorHelpFlags";
enum PBX_Armors_TipFlags
{
    PBX_Armors_DemonArmorTip      = 1 < 0
    ,PBX_Armors_DarkRedArmorTip   = 1 < 1
    ,PBX_Armors_GrayArmorTip      = 1 < 2
    ,PBX_Armors_LBlueArmorTip     = 1 < 3
    ,PBX_Armors_LGreenArmorTip    = 1 < 4
    ,PBX_Armors_PinkArmorTip      = 1 < 5
}

class PBX_Armors_TipsManager : PBXCore_TipsManager
{
	override bool HandlePickup(Inventory item)
	{
        bool returnValue = super.HandlePickup(item);
        if(!PBX_Armory_SendTip) return returnValue;

        switch(item.getClassName())
        {
            default:
                break;

            case 'PBX_DemonArmor':
            {
                Array<String> tips;
                tips.Push("$PBX_Armors_Demon_Tip1");
                PBXCore_TipsManager.SendTipArrayIfNeeded(tips, PBX_ARMOR_HELP_FLAG, PBX_Armors_DemonArmorTip);
            }
            break;

            case 'PBX_DarkRedArmor':
            {
                Array<String> tips;
                tips.Push("$PBX_Armors_DarkRed_Tip1");
                PBXCore_TipsManager.SendTipArrayIfNeeded(tips, PBX_ARMOR_HELP_FLAG, PBX_Armors_DarkRedArmorTip);
            }
            break;

            case 'PBX_GrayArmor':
            {
                Array<String> tips;
                tips.Push("$PBX_Armors_Gray_Tip1");
                PBXCore_TipsManager.SendTipArrayIfNeeded(tips, PBX_ARMOR_HELP_FLAG, PBX_Armors_GrayArmorTip);
            }
            break;

            case 'PBX_LightBlueArmor':
            {
                Array<String> tips;
                tips.Push("$PBX_Armors_LBlue_Tip1");
                PBXCore_TipsManager.SendTipArrayIfNeeded(tips, PBX_ARMOR_HELP_FLAG, PBX_Armors_LBlueArmorTip);
            }
            break;

            case 'PBX_LightGreenArmor':
            {
                Array<String> tips;
                tips.Push("$PBX_Armors_LGreen_Tip1");
                tips.Push(String.Format(StringTable.Localize("$PBX_Armors_LGreen_Tip2"),PBX_LGreenArmor_duration, GUARDIAN_HP, GUARDIAN_AMOUNT, GUARDIAN_PERCENT));
                PBXCore_TipsManager.SendTipArrayIfNeeded(tips, PBX_ARMOR_HELP_FLAG, PBX_Armors_LGreenArmorTip);
            }
            break;

            case 'PBX_PinkArmor':
            {
                Array<String> tips;
                tips.Push("$PBX_Armors_Pink_Tip1");
                PBXCore_TipsManager.SendTipArrayIfNeeded(tips, PBX_ARMOR_HELP_FLAG, PBX_Armors_PinkArmorTip);
            }
            break;

        }

		return returnValue;
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