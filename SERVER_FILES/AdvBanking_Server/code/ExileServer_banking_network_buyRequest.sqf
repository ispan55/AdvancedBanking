/*

 	Name: ExileServer_banking_network_buyRequest.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.

 	Description:
    Processes handling generic sales. For use with other scripts.
    ["buyRequest",[str(AMOUNTTOREMOVE)]] call ExileClient_system_network_send;

*/
_sessionID = _this select 0;
_package = _this select 1;
_amount = parseNumber(_package select 0);

try {
    if (ADVBANKING_SERVER_DEBUG) then {["Buy Request enacted","BuyRequest"] call ExileServer_banking_utils_diagLog;};
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
	{
		throw 1;
	};
    if (_amount < 0 ) then {
        throw 3;
    };
    _wallet = _playerObject getVariable ["ExilePurse",0];
    if (_amount > _wallet) then {
        throw 4;
    };
    _wallet = _wallet - _amount;
    if (_wallet < 0) then {
        throw 5;
    };
    _playerObject setVariable ["ExilePurse",_wallet];
    format["updateWallet:%1:%2",_wallet,(getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
    [_sessionID,"updateWalletStats",[str(_wallet)]] call ExileServer_system_network_send_to;
    [format["Buy Request Invoked: Previous Player Wallet: %1 Amount to be Removed: %2 Final Wallet Amount: %3",(_wallet + _amount),_amount,_wallet],"BuyRequest"] call ExileServer_banking_utils_diagLog;
} catch {
    [_sessionID,"notificationRequest", ["Whoops", [format["%1",_exception]]]] call ExileServer_system_network_send_to;
    [_exception,"BuyRequest"] call ExileServer_banking_utils_diagLog;
};
