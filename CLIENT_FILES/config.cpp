class CfgInteractionMenus
{
    // Advance Money
    class MoneyPile
    {
        targetType = 2;
        target = "Land_Money_F";

        class Actions
        {
            class Examine: ExileAbstractAction
			{
				title = "Examine Wallet";
				condition = "((ExileClientInteractionObject getVariable ['DroppedAmount',0]) > 0)";
				action = "[(ExileClientInteractionObject getVariable ['PileOwner',0]),(ExileClientInteractionObject getVariable ['DroppedAmount',0])] call ExileClient_banking_player_examineMoney";
			};
            class Collect: ExileAbstractAction
			{
				title = "Collect Dropped Wallet";
				condition = "((ExileClientInteractionObject getVariable ['DroppedAmount',0]) > 0)";
				action = "(ExileClientInteractionObject getVariable ['DroppedAmount',0]) call ExileClient_banking_player_collectMoney";
			};
        };
    };
	class ATM
    {
        targetType = 2;
        target = "Land_Atm_01_F";

        class Actions
        {
            class Access: ExileAbstractAction
			{
				title = "Access ATM";
				condition = "true";
				action = "createDialog 'AdvBankingATM';";
			};
        };
    };
    // Advance Money
};