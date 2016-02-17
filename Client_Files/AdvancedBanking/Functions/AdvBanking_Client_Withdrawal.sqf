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
    if(_amount <= ExileClientBank)then{
        _newWallet = ExileClientPlayerMoney + _amount;
        _newBank = ExileClientBank - _amount;
        ExileClientPlayerMoney = _newWallet;
        ExileClientBank = _newBank;
        player setVariable ["ExileClientPlayerMoney", _newWallet, true];
        player setVariable ["ExileClientBank", _newBank, true];
        ['setStats',ExileClientSessionId,[(getPlayerUID player),ExileClientPlayerMoney,ExileClientBank]] call AdvBanking_Client_PacketMuncher;
    };
} catch {
    [_exception,"WithdrawlMoney"] call AdvBanking_Client_DiagLog;
};

call AdvBanking_Client_ATMUpdate;
