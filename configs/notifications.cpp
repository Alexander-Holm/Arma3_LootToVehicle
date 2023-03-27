// Giving the notifications high priority because they are triggered by user action.
// You would expect to get feedback immediately even over other events that might be important.
// Priority only affects the order of notifications,
// lower priority will still get displayed eventually.
class CfgNotifications
{
    class LootToVehicle_Success
    {
        title = "Looting done";
        iconPicture = "a3\ui_f\data\map\mapcontrol\taskicondone_ca.paa";
        // Text slightly smaller than default
        description = "<t size='0.75'>Nearby loot was transferred to this vehicle's inventory</t>";
        color[] = { 0.72, 0.98, 0.28, 1 }; 
        duration = 4;
        priority = 10;
    };
    class LootToVehicle_FullInventory
    {
        title = "Some items could not be looted";
        iconPicture = "a3\ui_f\data\map\mapcontrol\taskiconcanceled_ca.paa";
        description = "Vehicle inventory is full";
        color[] = { 1, 0.94, 0.31, 1 }; 
        duration = 6;
        priority = 10;
    };
    class LootToVehicle_NotFound
    {
        title = "No loot found";
        iconPicture = "a3\ui_f\data\map\mapcontrol\taskiconfailed_ca.paa";
        description = "No loot found within %1 meters";
        color[] = { 1, 0.34, 0.28, 1 }; 
        duration = 4;
        priority = 10;
    };
}