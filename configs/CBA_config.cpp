class Extended_PreInit_EventHandlers {
    class LootToVehicle {
        // CBA automatically keeps track of saved settings values
        init = "call compile preprocessFileLineNumbers 'LootToVehicle\settings.sqf'";
    };
};
class Extended_PostInit_EventHandlers {
    class LootToVehicle {
        init = "call compile preprocessFileLineNumbers 'LootToVehicle\main.sqf'";
    };
};