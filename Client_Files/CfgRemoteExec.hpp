class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;
		class ExileServer_system_network_dispatchIncomingMessage { allowedTargets=2; };
		class AdvBanking_Client_ClientHandleIncomingMessage { allowedTargets=1; };
		class AdvBanking_Server_HandleRequest { allowedTargets=2; };
		
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};
