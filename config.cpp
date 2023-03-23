class CfgPatches
{
	class LootToVehicle
	{
		name = "Loot To Vehicle";
		author = "CseRoQ";
        requiredVersion = 2.02;
	};
};

class CfgFunctions
{
    // TAG
    // Every function registered here gets a name like:
    // TAG_fnc_functionName
    // Example calling the function: 
    // [param1, param2] call LootToVehicle_fnc_lootStart;
    class LootToVehicle
    {
        // Arma 3 function-viewer categories
        // Have to use backslash in file-/folderpath
        class Main{
            class main{ 
                file = "LootToVehicle\fn_main.sqf";
                postInit = 1;
            }
        }
        class Loot{            
            class lootStart{ file = "LootToVehicle\functions\loot\fn_lootStart.sqf"; };

            file = "LootToVehicle\functions\loot\functions";
            class lootBodies{};
            class lootGround{};            
            class emptyAddedBackpacks{};
            class lootContainer{};
            class clearContainer{};
        };
        class Scrollmenu{
            file = "LootToVehicle\functions\scrollmenu";
            class createScrollmenuItem{};
            class removeScrollmenuItem{};
        };
        class Hints{
            file = "LootToVehicle\functions\hints";
            class hintTimer{};
            class hintSuccess{};
            class hintNotFound{};
        }
    }
};