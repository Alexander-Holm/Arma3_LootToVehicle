params ["_countBodies", "_countGround"];

hint parseText format ["
	<t align='left' size='1.25'Loot transferred to this vehicle</t> <br/>
	<t align='left'>%1 bodies looted</t> <br/>
	<t align='left'>%2 items looted from the ground</t>
", _countBodies, _countGround]; 

call LootToVehicle_fnc_hintTimer;