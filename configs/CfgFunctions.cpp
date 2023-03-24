// Register functions with Arma 3 Functions Library
// https://community.bistudio.com/wiki/Arma_3:_Functions_Library
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
        class Loot{
            class lootStart{ file = "LootToVehicle\functions\loot\fn_lootStart.sqf"; };

            file = "LootToVehicle\functions\loot\functions";
            class lootBodies{};
            class lootGround{};            
            class emptyAddedBackpacks{};
            class lootContainer{};
            class clearContainer{};
            class isVehicleFull{};
        };
        class Scrollmenu{
            file = "LootToVehicle\functions\scrollmenu";
            class createScrollmenuItem{};
            class removeScrollmenuItem{};
        };
    };
};