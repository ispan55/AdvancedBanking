/*

 	Name: AdvBanking_Client_CreditCard.hpp

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Dialog file for Advanced banking CreditCard

*/

class AdvBankingCreditCard {
	idd = -1;
	fadeout= 0;
	fadein= 0;
	duration = 20;
	name = "AdvBankingCreditCard";
	onLoad = "uiNamespace setVariable ['AdvBankingCreditCard', _this select 0]";

	class controlsBackground {
        class AdvBankingCreditcardBG: RscPicture
        {
        	idc = 1200;
        	text = "AdvancedBanking\images\IDCard.paa";
        	x = 0.79661 * safezoneW + safezoneX;
        	y = 0.640 * safezoneH + safezoneY;
        	w = 0.17526 * safezoneW;
        	h = 0.250 * safezoneH;
        };
		class AdvBankingProfilePic: RscPicture
		{
			idc = 1201;
			text = "AdvancedBanking\images\profile1.paa";
			x = 0.920000 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.04280 * safezoneW;
			h = 0.06435 * safezoneH;
		};
		class AdvBankingCardName: RscStructuredText
		{
			idc = 1100;
			text = "Name"; //--- ToDo: Localize;
			x = 0.806822 * safezoneW + safezoneX;
			y = 0.690 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AdvBankingInmate: RscStructuredText
		{
			idc = 1101;
			text = "INMATE"; //--- ToDo: Localize;
			x = 0.806822 * safezoneW + safezoneX;
			y = 0.710 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AdvBankingWalletAmmountHeader: RscStructuredText
		{
			idc = 1102;
			text = "WALLET AMMOUNT"; //--- ToDo: Localize;
			x = 0.80200 * safezoneW + safezoneX;
			y = 0.748 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AdvBankingWalletAmmount: RscStructuredText
		{
			idc = 1103;
			text = "50000"; //--- ToDo: Localize;
			x = 0.80300 * safezoneW + safezoneX;
			y = 0.761 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AdvBankingRandNum: RscStructuredText
		{
			idc = 1104;
			text = "W653ALN"; //--- ToDo: Localize;
			x = 0.853185 * safezoneW + safezoneX;
			y = 0.790 * safezoneH + safezoneY;
			w = 0.0722056 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class AdvBankingTransDate: RscStructuredText
		{
			idc = 1105;
			text = "TransDate"; //--- ToDo: Localize;
			x = 0.840398 * safezoneW + safezoneX;
			y = 0.805 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};
