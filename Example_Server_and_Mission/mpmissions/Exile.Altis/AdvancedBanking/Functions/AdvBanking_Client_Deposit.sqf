/*

 	Name: AdvBanking_Client_Deposit.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Handles depositing of money

*/

private ["_display","_editBox","_amount","_toAccount","_wallet","_newWallet","_bankAmount","_newBankAmount","_exception"];

disableSerialization;
_display = uiNameSpace getVariable ["AdvBankingATM", displayNull];
_editBox = (_display displayCtrl 1400);
_amount = parseNumber (ctrlText _editBox);
_toAccount = "ExileClientBank";

try {
    if (_toAccount isEqualTo "") then {
        throw "Account undefined, can't withdrawl from nothing!";
    };
    if (_amount isEqualTo 0) then {
        throw "Hey, don't worry. Zero isn't the loneliest number";
    };
    _wallet = ExileClientPlayerMoney;
    _newWallet = _wallet - _amount;
	player setVariable ["ExileClientPlayerMoney", _newWallet, true];
    if (_newWallet < 0) then {
        throw "Does it look like we are the mafia? You can't have a negative balance!";
        _newWallet = ExileClientPlayerMoney;
    };
    ["updateWallet",ExileClientSessionId,[(getPlayerUID player),_newWallet]] call AdvBanking_Client_PacketMuncher;

    if (_toAccount isEqualTo "ExileClientBank") then {
        _bankAmount = ExileClientBank;
        _newBankAmount = _bankAmount + _amount;
        ["updateBank",ExileClientSessionId,[(getPlayerUID player),_newBankAmount]] call AdvBanking_Client_PacketMuncher;
        ["getStats",ExileClientSessionId,[(getPlayerUID player)]] call AdvBanking_Client_PacketMuncher;
    };
} catch {
    [_exception,"WithdrawlMoney"] call AdvBanking_Client_DiagLog;
};
