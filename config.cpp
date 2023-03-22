class CfgPatches
{
	class LootToVehicle
	{
		// Meta information for editor
		name = "Loot To Vehicle";
		author = "CseRoQ";
	};
};

class CfgFunctions
{
    // Tag
    class LootToVehicle
    {
        // Arma 3 function-viewer categories
        class Main{
            file = "LootToVehicle";
            class main{ postInit = 1;}
        }
        class Looting
        {
            file = "LootToVehicle\functions";
            class lootBodies{};
            class lootGround{};
            class emptyAddedBackpacks{};            
        };
        class Scrollmenu{
            file = "LootToVehicle\functions\scrollmenu";
            class createScrollmenuItem{};
            class removeScrollmenuItem{};
        };
    }
};