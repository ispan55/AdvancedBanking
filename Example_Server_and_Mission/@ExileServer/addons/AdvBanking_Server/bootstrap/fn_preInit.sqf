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
	['AdvBanking_Server_HandleRequest', 'AdvBanking_Server\code\AdvBanking_Server_HandleRequest.sqf'],
    ['AdvBanking_Server_GetStats', 'AdvBanking_Server\code\AdvBanking_Server_GetStats.sqf'],
    ['AdvBanking_Server_SetStats', 'AdvBanking_Server\code\AdvBanking_Server_SetStats.sqf'],
    ['AdvBanking_Server_CreateBankAccount', 'AdvBanking_Server\code\AdvBanking_Server_CreateBankAccount.sqf'],
    ['AdvBanking_Server_JoinSharedBank', 'AdvBanking_Server\code\AdvBanking_Server_JoinSharedBank.sqf'],
    ['AdvBanking_Server_KickFromSharedBank', 'AdvBanking_Server\code\AdvBanking_Server_KickFromSharedBank.sqf'],
    ['AdvBanking_Server_SendToClient', 'AdvBanking_Server\code\AdvBanking_Server_SendToClient.sqf'],
    ['AdvBanking_Server_DiagLog', 'AdvBanking_Server\code\AdvBanking_Server_DiagLog.sqf'],
	['AdvBanking_Server_SetStats', 'AdvBanking_Server\code\AdvBanking_Server_SetStats.sqf'],
	['AdvBanking_Server_updateBank', 'AdvBanking_Server\code\AdvBanking_Server_updateBank.sqf'],
	['AdvBanking_Server_updateWallet', 'AdvBanking_Server\code\AdvBanking_Server_updateWallet.sqf'],
    ['AdvBanking_Server_PlaceATM', 'AdvBanking_Server\code\AdvBanking_Server_PlaceATM.sqf']
];

["Advanced Banking preInit Loading","PreInit"] call AdvBanking_Server_DiagLog;

true
