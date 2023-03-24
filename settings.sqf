// CBA settings
// https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System
// https://cbateam.github.io/CBA_A3/docs/files/settings/fnc_addSetting-sqf.html#CBA_fnc_addSetting

[
    "LootToVehicle_LootDistance",
    "SLIDER",
    ["Looting distance", "Distance from vehicle in meters"],
    "Loot To Vehicle",
    [1, 250, 30, 0, false],
    1
] call CBA_fnc_addSetting;

[
    "LootToVehicle_IgnoreCargoLoad",
    "CHECKBOX",
    ["Ignore vehicle inventory capacity", "Allows an unlimited amount of items to be looted"],
    "Loot To Vehicle",
    false,
    1
] call CBA_fnc_addSetting;
[
    "LootToVehicle_CargoLoadMultiplier",
    "SLIDER",
    ["Vehicle inventory capacity", "Only affects how much can be added to the vehicle by this mod"],
    "Loot To Vehicle",
    [0.5, 5, 1, 0, true],
    1
] call CBA_fnc_addSetting;