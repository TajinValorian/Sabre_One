params ["_player", "_jip"];
{
	_x addCuratorEditableObjects [[_player], false];
} count allCurators;