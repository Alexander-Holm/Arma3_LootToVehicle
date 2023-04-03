params ["_position", "_distance"];
	
_people = _position nearObjects["Man", _distance];
_vehicles = [];
_vehicles append (_position nearObjects["LandVehicle", _distance]);
_vehicles append (_position nearObjects["Air", _distance]);
_vehicles append (_position nearObjects["Ship", _distance]);
{ _people append (crew _x) } forEach _vehicles;

_lootableBodies = [];
{ 
    _person = _x;
    _hasLoot = _person call LootToVehicle_fnc_bodyHasLoot;
    if(!alive _person && _hasLoot) then{
        _lootableBodies append [_person];
    };
} forEach _people;

_lootableBodies; // Return