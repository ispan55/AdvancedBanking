/*

 	Name: AdvBanking_Client_Withdrawal.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Handles withdrawal of money

*/
private ["_display","_editBox","_amount","_fromAccount","_wallet","_newWallet","_bankAmount","_newBankAmount","_exception"];
disableSerialization;
_display = uiNameSpace getVariable ["AdvBankingATM", displayNull];
_editBox = (_display displayCtrl 1400);
_amount = parseNumber(ctrlText _editBox);
_fromAccount = "ExileClientBank";

try {
    if (_fromAccount isEqualTo "") then {
        throw "Account undefined, can't withdrawl from nothing!";
    };
    if (_amount isEqualTo 0) then {
        throw "Hey, don't worry. Zero isn't the loneliest number";
    };
    _wallet = ExileClientPlayerMoney;
    _newWallet = _wallet + _amount;
	player setVariable ["ExileClientPlayerMoney", _newWallet, true];
    ["updateWallet",ExileClientSessionId,[(getPlayerUID player),_newWallet]] call AdvBanking_Client_PacketMuncher;
    if (_fromAccount isEqualTo "ExileClientBank") then {
        _bankAmount = ExileClientBank;
        _newBankAmount = _bankAmount - _amount;
        if (_newBankAmount < 0) then {
            throw "Does it look like we are the mafia? You can't have a negative balance!";
            _newBankAmount = ExileClientBank;
        };
        ["updateBank",ExileClientSessionId,[(getPlayerUID player),_newBankAmount]] call AdvBanking_Client_PacketMuncher;
        ["getStats",ExileClientSessionId,[(getPlayerUID player)]] call AdvBanking_Client_PacketMuncher;
    };
} catch {
    [_exception,"WithdrawlMoney"] call AdvBanking_Client_DiagLog;
};
