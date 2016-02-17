/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach
[
	['AdvBanking_Client_ClientHandleIncomingMessage', 'AdvancedBanking\Functions\AdvBanking_Client_ClientHandleIncomingMessage.sqf'],
    ['AdvBanking_Client_CloseATM', 'AdvancedBanking\Functions\AdvBanking_Client_CloseATM.sqf'],
    ['AdvBanking_Client_CollectMoney', 'AdvancedBanking\Functions\AdvBanking_Client_CollectMoney.sqf'],
    ['AdvBanking_Client_CreditCardShow', 'AdvancedBanking\Functions\AdvBanking_Client_CreditCardShow.sqf'],
    ['AdvBanking_Client_Deposit', 'AdvancedBanking\Functions\AdvBanking_Client_Deposit.sqf'],
	['AdvBanking_Client_ExamineMoney', 'AdvancedBanking\Functions\AdvBanking_Client_ExamineMoney.sqf'],
    ['AdvBanking_Client_InviteHandleResponseATM', 'AdvancedBanking\Functions\AdvBanking_Client_InviteHandleResponseATM.sqf'],
    ['AdvBanking_Client_InviteHandleResponseXM8', 'AdvancedBanking\Functions\AdvBanking_Client_InviteHandleResponseXM8.sqf'],
    ['AdvBanking_Client_onATMLoad', 'AdvancedBanking\Functions\AdvBanking_Client_onATMLoad.sqf'],
    ['AdvBanking_Client_Slide_SharedBankingOnOpen', 'AdvancedBanking\Functions\AdvBanking_Client_Slide_SharedBankingOnOpen.sqf'],
    ['AdvBanking_Client_SwitchAccountInUse','AdvancedBanking\Functions\AdvBanking_Client_SwitchAccountInUse.sqf'],
    ['AdvBanking_Client_Withdrawal','AdvancedBanking\Functions\AdvBanking_Client_Withdrawal.sqf'],
    ['AdvBanking_Client_DiagLog','AdvancedBanking\Functions\AdvBanking_Client_DiagLog.sqf'],
    ['AdvBanking_Client_PacketMuncher','AdvancedBanking\Functions\AdvBanking_Client_PacketMuncher.sqf'],
    ['AdvBanking_Client_ATMUpdate','AdvancedBanking\Functions\AdvBanking_Client_ATMUpdate.sqf']
];

waitUntil{uiSleep 0.1; ExileClientSessionId != "";};
// Get the players stats
["getStats",ExileClientSessionId,[(getPlayerUID player)]] call AdvBanking_Client_PacketMuncher;
