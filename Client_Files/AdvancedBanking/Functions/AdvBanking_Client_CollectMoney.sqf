/*

 	Name: AdvBanking_Client_CollectMoney.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Handles when a player tries to collect money from the ground
*/
private ["_worth","_playerMoney","_newMoney","_exception"];

_worth = _this select 0;

try {
    if (_worth isEqualTo 0) then {
        throw "Instructions unclear, received zero, expected millions."
    };
    _playerWallet = ExileClientPlayerMoney;
    _newMoney = _playerWallet + _worth;
    if (_newMoney isEqualTo 0) then {
        throw "What's 0 plus 0? It's 0, you nimrod!";
    };
    ["updateWallet",ExileClientSessionId,[(getPlayerUID player),_newMoney]] call AdvBanking_Client_PacketMuncher;
    ExileClientPlayerMoney = _newMoney;
    player setVariable ["ExileClientPlayerMoney", _newMoney, true];
    deleteVehicle cursorTarget;
    ["Success",[format["You collected %1 caps from the wallet!",_worth]]] call ExileClient_gui_notification_event_addNotification;
} catch {
    [_exception,"CollectMoney"] call AdvBanking_Client_DiagLog;
    ["Whoops",["Houston, we done messed up. Please inform an admin"]] call ExileClient_gui_notification_event_addNotification;
};
