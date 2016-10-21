fnc_handleCuratorVisibility = {
	private["_gather"];
	_gather = allUnits + vehicles;
	{
		if (player countEnemy [_x] isEqualTo 1) then {
			if (!isObjectHidden) then {
				_x hideObject true;
				curHiddenObjects pushBack _x;
			};
		};
	} count _gather;

	waitUntil {sleep 1; isNull findDisplay 312};
	{
		_x hideObject false;
	} count curHiddenObjects
};
publicVariable "fnc_handleCuratorVisibility";

{
	_x addEventHandler ["BIS_fnc_curatorObjectRegistered", {
		params["_cur","_list"];
		private["_player"];
		_player = getAssignedCuratorUnit _x;
		[] remoteExec ["fnc_handleCuratorVisibility",_player];
	}];
} count allCurators;