/*

 	Name: AdvBanking_Client_onATMLoad.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Handles loading of the ATM machine

*/
private ["_esc","_display","_loadingCtrls","_hide","_advCtrls","_setLoadingText","_progressBar","_curLoadingBarPos","_playerName","_setPlayerName","_setAdvancedBanking","_wallet","_setBanlance","_setSharedBalance","_bank","_setPersonalBalance","_setAccountInUse"];
if(isNil "ATMOpen")then{
    ATMOpen = true;
};
//Event handler to set ATMOpen to false if player presses esc
_esc = (findDisplay 0711) displayAddEventHandler ["KeyDown", "if(_this select 1 == 1)then{ATMOpen = false;}"];

disableSerialization;
_display = uiNameSpace getVariable ["AdvBankingATM", displayNull];
["getStats",ExileClientSessionId,[(getPlayerUID player)]] call AdvBanking_Client_PacketMuncher;

    _loadingCtrls = [1900,1120];
    {
        _hide = (_display displayCtrl _x);
        _hide ctrlSetFade 0;
        _hide ctrlCommit 0;
    } forEach _loadingCtrls;

    //hide all the ctrls
    _advCtrls = [1600,1607,1400,1103,1104,1604,1605,1107,1108,1109,1105,1106,1100,1102];
    {
        _hide = (_display displayCtrl _x);
        _hide ctrlSetFade 1;
        _hide ctrlCommit 0;
    } forEach _advCtrls;
    //Set Loading bar  text
    _setLoadingText = (_display displayCtrl 1120);
    _setLoadingText ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>Loading</t>"];

    _progressBar = (_display displayCtrl 1900);
    _curLoadingBarPos = 0;
    while {_curLoadingBarPos < 1} do {
        _curLoadingBarPos = _curLoadingBarPos + 0.01;
        _progressBar progressSetPosition _curLoadingBarPos;
        uiSleep 0.01;
    };

    {
        _hide = (_display displayCtrl _x);
        _hide ctrlSetFade 1;
        _hide ctrlCommit 0.25;
    } forEach _loadingCtrls;

    _advCtrls = [1600,1607,1400,1103,1104,1604,1605,1107,1108,1109,1105,1106,1100,1102];
    {
        _hide = (_display displayCtrl _x);
        _hide ctrlSetFade 0;
        _hide ctrlCommit 0.5;
    } forEach _advCtrls;

if !(ATMOpen)then{
    ATMOpen = true;
};

while {ATMOpen} do {
    //Set The palyer name (Top left)
    _playerName = name player;
    _setPlayerName = (_display displayCtrl 1100);
    _setPlayerName ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>%1</t>",toUpper _playerName];

    //Set Advanced banking title (Top center)
    _setAdvancedBanking = (_display displayCtrl 1101);
    _setAdvancedBanking ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>ADVANCED BANKING</t>"];

    //Set The players Balance (Top Right)
    _wallet = ExileClientPlayerMoney;
    _setBanlance = (_display displayCtrl 1102);
    _setBanlance ctrlSetStructuredText parseText Format["<t valign='middle' align='center' color='#00b2cd' font='OrbitronLight' size='2'>%1<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1.6' shadow='true' /></t>",_wallet];

    //set the Shared bank account balance
    _setSharedBalance = (_display displayCtrl 1107);
    _setSharedBalance ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='0.85' valign='middle' align='center' shadow='0'><br/><t font='OrbitronMedium' size='1.7' color='#ffffff'>NOT YET IMPLIMENTED</t><br/>SHARED BANK BALANCE</t>"];

    //set the Shared bank account balance
    _bank = ExileClientBank;
    _setPersonalBalance = (_display displayCtrl 1108);
    _setPersonalBalance ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='0.85' valign='middle' align='center' shadow='0'><br/><t font='OrbitronMedium' size='1.7' color='#ffffff'>%1<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1.6' shadow='true' /></t><br/>PERSONAL BANK BALANCE</t>",_bank];

    //set account in use
    _setAccountInUse = (_display displayCtrl 1109);
    _setAccountInUse ctrlSetStructuredText parseText Format["<t color='#00b2cd' font='OrbitronLight' size='0.7' valign='middle' align='center' shadow='0'><br/><t font='OrbitronMedium' size='1.7' color='#ffffff'>PERSONAL</t><br/>ACCOUNT IN USE</t>"];
};
