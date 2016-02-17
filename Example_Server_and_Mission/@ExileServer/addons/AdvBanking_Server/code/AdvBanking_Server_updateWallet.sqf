/*

 	Name: AdvBanking_Server_updateWallet.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Updates just the players wallet

    _package = [_sessionid,[_playerUID,_wallet]];
    ['setStats',ExileClientSessionId,[(getPlayerUID player),(player getVariable "ExileClientPlayerMoney")]] remoteExecCall ['AdvBanking_Server_HandleRequest', 2];

*/
private["_sessionid","_package","_playerUID","_wallet"];

_sessionid = _this select 0;
_package = _this select 1;

_playerUID = _package select 0;
_wallet = _package select 1;

try {
    ["Player Update Wallet Request", "updateWallet"] call AdvBanking_Server_DiagLog;

    if (_package isEqualTo []) then {
        throw "Package is empty!";
    };

    if (_playerUID isEqualTo 0) then {
        throw "Player UID not defined, cannot update!";
    };

    format["updateWallet:%1:%2",_wallet,_playerUID] call ExileServer_system_database_query_fireAndForget;

} catch {
    [_exception,"setStats"] call AdvBanking_Server_DiagLog;
};
