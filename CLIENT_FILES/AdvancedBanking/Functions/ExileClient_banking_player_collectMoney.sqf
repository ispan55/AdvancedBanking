/*

 	Name: ExileClient_banking_player_collectMoney.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.

 	Description:
    Handles when a player tries to collect money from the ground
*/
private ["_worth","_playerMoney","_newMoney","_exception"];

_worth = _this;

try {
    if (_worth < 0) then {
        throw "Instructions unclear, received zero, expected millions.";
    };
    if (typeOf cursorTarget == "Land_Money_F") then {
        deleteVehicle cursorTarget;
    };
    ["collectionRequest",[str(_worth)]] call ExileClient_system_network_send;
    if (ADVBANKING_CLIENT_DEBUG) then {[format["Collect some Money. Package: %1",_worth],"CollectMoney"] call ExileClient_banking_utils_diagLog;};
} catch {
    [_exception,"CollectMoney"] call ExileClient_banking_utils_diagLog;
    ["Whoops",["Houston, we done messed up. Please inform an admin"]] call ExileClient_gui_notification_event_addNotification;
};
