// CBA settings
// https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System
// https://cbateam.github.io/CBA_A3/docs/files/settings/fnc_addSetting-sqf.html#CBA_fnc_addSetting

_modName = "Loot to vehicle";
// Loot settings are global set by server

_category = "Distance";
[
    "LootToVehicle_LootDistance",
    "SLIDER",
    ["Distance in meters", "Usually from center of vehicle"],
    [_modName, _category],
    [10, 100, 30, 0, false],
    1 // Global setting
] call CBA_fnc_addSetting;


_category = "Inventory capacity";
[
    "LootToVehicle_CargoLoadMultiplier",
    "SLIDER",
    ["Vehicle inventory capacity", "Only affects how much can be added to the vehicle by this mod"],
    [_modName, _category],
    [0.5, 5, 1, 0, true], // Show as percentage
    1 // Global setting
] call CBA_fnc_addSetting;
[
    "LootToVehicle_IgnoreCargoLoad",
    "CHECKBOX",
    ["Unlimited vehicle inventory capacity", "Allows the vehicle to be filled by an unlimited amount of items"],
    [_modName, _category],
    false,
    1 // Global setting
] call CBA_fnc_addSetting;


_category = "Time";
[
    "LootToVehicle_TimeBody",
    "SLIDER",
    ["Time per body", "How many seconds it takes to loot a single body"],
    [_modName, _category],
    [0, 10, 1, 1, false],
    1 // Global setting
] call CBA_fnc_addSetting;
[
    "LootToVehicle_TimeMax",
    "SLIDER",
    ["Max total time", "Total looting time will not exceed this many seconds"],
    [_modName, _category],
    [0, 30, 10, 0, false],
    1 // Global setting
] call CBA_fnc_addSetting;


_category = "Scrollmenu";
[
    "LootToVehicle_ScrollmenuColor",
    "COLOR",
    ["Color", "Color of the scrollmenu item"],
    [_modName, _category],
    [0.9, 1, 0.68],
    0, // Client setting
    { call LootToVehicle_fnc_updateColor; }
] call CBA_fnc_addSetting;