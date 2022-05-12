#include <multicolors>
#include <sdktools_sound>

#pragma newdecls required
#pragma semicolon 1

public Plugin myinfo =
{
	name        = "KACCM",
	author      = "ReyZ",
	description = "!kaccm komutu",
	version     = "1.0",
	url         = "https://github.com/ReyZ19/kaccm"
};

int cooldownTimes[MAXPLAYERS + 1] = { -1, ... };

public void OnPluginStart()
{
	RegConsoleCmd("kaccm", KomutKACCM, "KACCM");
}

public void OnClientPutInServer(int client)
{
	cooldownTimes[client] = -1;
}

public Action KomutKACCM(int client, int args)
{
	int currentTime = GetTime();
	if (cooldownTimes[client] != -1 && cooldownTimes[client] > currentTime)
	{
		EmitSoundToClient(client, "buttons/button11.wav");
		CReplyToCommand(client, "{white}Bu komutu {red}1 dakikada {white}bir kez kullanabilirsiniz.");
		return Plugin_Handled;
	}
	int randomnum = GetRandomInt(0, 31);
	switch (randomnum)
	{
		case 31:
		{
			CPrintToChatAllEx(client, "{teamcolor}%N {white}adlı oyuncunun çubuğu max seviyede {fullred}31CM {darkorange}(düşman götüne kurşun)", client);
		}
		case 0:
		{
			CPrintToChatAllEx(client, "{teamcolor}%N {white}adlı oyuncunun çubuğu yok {hotpink}0CM", client);
		}
		default:
		{
			CPrintToChatAllEx(client, "{teamcolor}%N {white}adlı oyuncunun çubuğu {limegreen}%dCM", client, randomnum);
		}
	}
	cooldownTimes[client] = currentTime + 60;
	return Plugin_Handled;
}