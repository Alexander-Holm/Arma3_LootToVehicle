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
        // Files that are not linked explicitly by filepath need to start with fn_
        class Main{
            class main{ file = "LootToVehicle\main.sqf"; };
        }
        class Looting{            
            class lootStart{ file = "LootToVehicle\functions\looting\fn_lootStart.sqf"; };
            file = "LootToVehicle\functions\looting\loot";                      
            class lootBody{};
            class lootContainer{};            
        };
        class Looting_Find{
            file = "LootToVehicle\functions\looting\find";
            class findBodies{};
            class findGroundItems{};
        };
        class Looting_Checks{
            file = "LootToVehicle\functions\looting\checks";
            class bodyHasLoot{};
            class isVehicleFull{};
            class validateContinue{};
        };
        class Looting_Other{
            file = "LootToVehicle\functions\looting\other";
            class addBackpack{};  
            class calculateTime{};
            class clearContainer{};  
            class createProgressbar{};
        };
        class Scrollmenu{
            file = "LootToVehicle\functions\scrollmenu";
            class createAction{};
            class removeAction{};
            class hasAction{};
            class updateColor{};
        };
        class Scrollmenu_Components{
            file = "LootToVehicle\functions\scrollmenu\components";
            class actionTitle{};
            class actionIcon{};
        };
    };
};