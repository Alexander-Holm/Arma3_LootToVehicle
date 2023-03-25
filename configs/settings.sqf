// CBA settings
// https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System
// https://cbateam.github.io/CBA_A3/docs/files/settings/fnc_addSetting-sqf.html#CBA_fnc_addSetting


_category = "Looting";
// Loot settings are global set by server
[
    "LootToVehicle_LootDistance",
    "SLIDER",
    ["Looting distance", "Distance from vehicle in meters"],
    ["Loot To Vehicle", _category],
    [10, 100, 30, 0, false],
    1 // Global setting
] call CBA_fnc_addSetting;
[
    "LootToVehicle_CargoLoadMultiplier",
    "SLIDER",
    ["Vehicle inventory capacity", "Only affects how much can be added to the vehicle by this mod"],
    ["Loot To Vehicle", _category],
    [0.5, 5, 1, 0, true],
    1
] call CBA_fnc_addSetting;
[
    "LootToVehicle_IgnoreCargoLoad",
    "CHECKBOX",
    ["Ignore vehicle inventory capacity", "Allows an unlimited amount of items to be looted"],
    ["Loot To Vehicle", _category],
    false,
    1
] call CBA_fnc_addSetting;


_category = "Scrollmenu";
[
    "LootToVehicle_ScrollmenuColor",
    "COLOR",
    ["Color", "Color of the scrollmenu item"],
    ["Loot To Vehicle", _category],
    [0.9, 1, 0.68],
    0, // Client setting
    { call LootToVehicle_fnc_updateScrollmenuItem; }
] call CBA_fnc_addSetting;