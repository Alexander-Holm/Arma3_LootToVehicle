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
            file = "LootToVehicle\functions\looting"; 
            class lootStart{};
            class lootBodies{};
            class lootGround{};            
        };
        class LootingHelpers{
            file = "LootToVehicle\functions\looting\functions";                    
            class emptyAddedBackpacks{};
            class lootContainer{};
            class clearContainer{};
            class isVehicleFull{};
        };
        class Scrollmenu{
            file = "LootToVehicle\functions\scrollmenu";
            class createScrollmenuItem{};
            class removeScrollmenuItem{};
            class updateScrollmenuItem{};
        };
        class ScrollmenuComponents{
            file = "LootToVehicle\functions\scrollmenu\components";
            class scrollmenuTitle{};
            class scrollmenuIcon{};
        };
    };
};