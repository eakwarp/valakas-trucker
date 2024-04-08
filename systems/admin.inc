
COMMAND:noooc(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1 && !noooc)
	{
		noooc = 1;
		SendClientMessageToAll(COLOR_GRAD2, "   OOC чат отключен администратором!");
	}
	else if (PlayerInfo[playerid][pAdmin] >= 1 && noooc)
	{
		noooc = 0;
		SendClientMessageToAll(COLOR_GRAD2, "   OOC чат включен администратором!");
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:makeadmin(playerid,params[])
{
	new para1,level,sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME],string[255];
	if(sscanf(params, "ui", para1,level))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /makeadmin [id_игрока/ЧастьИмени] [уровень(1-1339)]");
	if (PlayerInfo[playerid][pAdmin] >= 1337)
	{
	    if(IsPlayerConnected(para1))
	    {
	        if(para1 != INVALID_PLAYER_ID)
	        {
				GetPlayerName(para1, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				PlayerInfo[para1][pAdmin] = level;
				printf("AdmCmd: %s сделал %s админом уровня %d.", sendername, giveplayer, level);
				format(string, sizeof(string), "   Админом уровня %d сделал Вас %s", level, sendername);
				SendClientMessage(para1, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "   Вы сделали %s админом уровня %d.", giveplayer,level);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			}
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:makehelper(playerid,params[])
{
	new para1,level,sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME],string[255];
	if(sscanf(params, "ui", para1,level))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /makehelper [id_игрока/ЧастьИмени] [уровень]");
	if (PlayerInfo[playerid][pAdmin] >= 1337 || PlayerInfo[playerid][pHelper] >= 1339)
	{
	    if(IsPlayerConnected(para1))
	    {
	        if(para1 != INVALID_PLAYER_ID)
	        {
				GetPlayerName(para1, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				PlayerInfo[para1][pHelper] = level;
				printf("AdmCmd: %s сделал %s хелпером уровня %d.", sendername, giveplayer, level);
				format(string, sizeof(string), "   Хелпером уровня %d сделал Вас %s", level, sendername);
				SendClientMessage(para1, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "   Вы сделали %s хелпером уровня %d.", giveplayer,level);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "   %s сделал %s хелпером уровня %d!", sendername, giveplayer, level);
				ABroadCast(COLOR_LIGHTRED, string, 1);
			}
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:mute(playerid,params[])
{
	new playa,money,result[128],string[255],giveplayer[MAX_PLAYER_NAME],sendername[MAX_PLAYER_NAME];
	if(sscanf(params, "uis[64]", playa,money,result))
		return SendClientMessage(playerid, COLOR_GRAD2, "ИСПОЛЬЗУЙТЕ: /mute [id_игрока/ЧастьИмени] [время(минуты)] [причина]");
	if(IsPlayerNPC(playa))return 1;
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    if(IsPlayerConnected(playa))
	    {
	        if(playa != INVALID_PLAYER_ID)
	        {
		        GetPlayerName(playa, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "* Вас заглушил администратор %s на %d минут, причина: %s", sendername, money, (result));
				SendClientMessage(playa, COLOR_LIGHTRED, string);
				PlayerInfo[playa][pMutedTime] = money*60;
				format(string, sizeof(string), "AdmCmd: %s был заглушен администратором %s на %d минут, причина: %s",giveplayer ,sendername, money, (result));
				SendClientMessageToAll(COLOR_LIGHTRED, string);
			}
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:jail(playerid,params[])
{
	new playa,money,result[128];
	if(sscanf(params, "uis[64]", playa,money,result))
		return SendClientMessage(playerid, COLOR_GRAD2, "ИСПОЛЬЗУЙТЕ: /jail [id_игрока/ЧастьИмени] [time(minutes)] [reason/причина]");
	if(IsPlayerNPC(playa))return 1;
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    if(IsPlayerConnected(playa))
	    {
	        if(playa != INVALID_PLAYER_ID)
	        {
	            new giveplayer[MAX_PLAYER_NAME],sendername[MAX_PLAYER_NAME],string[255];
		        GetPlayerName(playa, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "* Вас заключил в тюрьму администратор %s, причина: %s", sendername, (result));
				SendClientMessage(playa, COLOR_LIGHTRED, string);
				ResetPlayerWeapons(playa);
				SetPlayerVirtualWorld(playa,playa);
				PlayerInfo[playa][pJailTime] = money*60;
				SetPlayerInterior(playa, 1);
				SetPlayerPos(playa, 2216.5884,-1071.6406,1050.4844);
				format(string, sizeof(string), "AdmCmd: %s был заключён в тюрьму администратором %s на %d минут, причина: %s ",giveplayer ,sendername, money, (result));
				SendClientMessageToAll(COLOR_LIGHTRED, string);
				format(string, sizeof(string), "*Вы заключены в тюрьму на %d минут.", money);
				SendClientMessage(playa, COLOR_LIGHTBLUE, string);
			}
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:dn(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz-2);
		return 1;
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:up(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz+2);
		return 1;
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:upp(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz+15);
		return 1;
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:uppfly(playerid,params[])
{
    new playa;
	if(sscanf(params, "u", playa))
		return SendClientMessage(playerid, COLOR_GRAD1, " ИСПОЛЬЗУЙТЕ: /uppfly [id игрока/ЧастьИмени]");
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playa, slx, sly, slz);
		SetPlayerPos(playa, slx, sly, slz+1500);
		SendClientMessage(playa, COLOR_GREY, " Пошел! Пошел! Пошел!");
        new name[MAX_PLAYER_NAME];
		GetPlayerName(playa,name,sizeof(name));
	}
	return 1;
}

COMMAND:fly(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:b_x, Float:b_y, Float:b_z, Float:b_a;
		GetPlayerPos(playerid, Float:b_x, Float:b_y, Float:b_z);
		GetPlayerFacingAngle(playerid, b_a);
		b_x += 5*floatsin(-b_a, degrees);
		b_y += 5*floatcos(-b_a, degrees);
		SetPlayerPos(playerid,Float:b_x, Float:b_y, Float:b_z+5.0);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:lt(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx-2, sly, slz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:rt(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx+2, sly, slz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:ft(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly+2, slz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:bk(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly-2, slz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}

COMMAND:restartserver(playerid,params[])
	return cmd_endround(playerid,params);

COMMAND:endround(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1337)
		GameModeExit();
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:gotocar(playerid,params[])
{
	new testcar;
	if(sscanf(params, "i", testcar))
		return SendClientMessage(playerid, COLOR_GRAD1, " ИСПОЛЬЗОВАНИЕ: /gotocar [id]");
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:cwx2,Float:cwy2,Float:cwz2;
		GetVehiclePos(testcar, cwx2, cwy2, cwz2);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, cwx2+2, cwy2+2, cwz2);
		}
		else
			SetPlayerPos(playerid, cwx2+2, cwy2+2, cwz2);
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы телепортированы к указанной машине!");
		SetPlayerInterior(playerid,0);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:getcar(playerid,params[])
{
	new Float:plocx,Float:plocy,Float:plocz;
	new plo;
	if(sscanf(params, "i", plo))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /getcar [id машины]");
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		GetPlayerPos(playerid, plocx, plocy, plocz);
		SetVehiclePos(plo,plocx,plocy+4, plocz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:entercar(playerid,params[])
{
    new testcar,testcarpos=1,testcarpl=playerid;
	if(sscanf(params, "iii", testcar,testcarpos,testcarpl))
		return SendClientMessage(playerid, COLOR_GRAD1, " ИСПОЛЬЗОВАНИЕ: /entercar [id машины] [сиденье] [игрок]");
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		PutPlayerInVehicle(testcarpl, testcar, testcarpos);
		SendClientMessage(testcarpl, COLOR_GRAD1, "   Вы телепортированы в указанную машину!");
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

new Float:TeleportDest[MAX_PLAYERS][3][10];
COMMAND:mark(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    new i=0;
	    sscanf(params,"i",i);
	    if(i>9)return 1;
		GetPlayerPos(playerid, TeleportDest[playerid][0][i],TeleportDest[playerid][1][i],TeleportDest[playerid][2][i]);
		new str[255];
		format(str,sizeof(str),"Пункт назначения телепорта [%d] установлен.",i);
		SendClientMessage(playerid, COLOR_GRAD1, str);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:gotomark(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    new i=0;
	    sscanf(params,"i",i);
	    if(i>9)return 1;
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, TeleportDest[playerid][0][i],TeleportDest[playerid][1][i],TeleportDest[playerid][2][i]);
		}
		else
			SetPlayerPos(playerid, TeleportDest[playerid][0][i],TeleportDest[playerid][1][i],TeleportDest[playerid][2][i]);
        new str[255];
        SetPlayerInterior(playerid,0);
		format(str,sizeof(str),"Вы телепортированы к назначенному телепорту [%d].",i);
		SendClientMessage(playerid, COLOR_GRAD1, str);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:goto(playerid,params[])
{
	new Float:plocx,Float:plocy,Float:plocz;
	new plo;
	new string[128];
	if(sscanf(params, "u", plo))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /goto [id_игрока/ЧастьИмени]");
	if (IsPlayerConnected(plo))
	{
	    if(plo != INVALID_PLAYER_ID)
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				GetPlayerPos(plo, plocx, plocy, plocz);
				SetPlayerInterior(playerid,GetPlayerInterior(plo));
				SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(plo));
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
				}
				else
					SetPlayerPos(playerid,plocx,plocy+2, plocz);
				format(string,sizeof(string),"   Вы телепортированы к указанному игроку (%d)!", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
			else
				SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
		}
	}
	else
	{
		format(string, sizeof(string), "   %d - нет такого игрока.", plo);
		SendClientMessage(playerid, COLOR_GRAD1, string);
	}
	return 1;
}

//----------------------------------[GETHERE]-----------------------------------------------

new Float:BackTelePosX[MAX_PLAYERS],Float:BackTelePosY[MAX_PLAYERS],Float:BackTelePosZ[MAX_PLAYERS],BackTeleInt[MAX_PLAYERS],BackTeleWorld[MAX_PLAYERS];

COMMAND:gethere(playerid,params[])
{
	new Float:plocx,Float:plocy,Float:plocz;
	new plo;
	new string[128];
	if(sscanf(params, "u", plo))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /gethere [id_игрока/ЧастьИмени]");
	if (IsPlayerConnected(plo))
	{
	    if(plo != INVALID_PLAYER_ID)
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
			    new interior=GetPlayerInterior(playerid);
			    new world=GetPlayerVirtualWorld(playerid);
				GetPlayerPos(playerid, plocx, plocy, plocz);
				GetPlayerPos(plo, BackTelePosX[plo],BackTelePosY[plo],BackTelePosZ[plo]);
			    BackTeleInt[plo]=GetPlayerInterior(plo);
	   		 	BackTeleWorld[plo]=GetPlayerVirtualWorld(plo);
				if (GetPlayerState(plo) == 2)
				{
					new tmpcar = GetPlayerVehicleID(plo);
					SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
					SetPlayerInterior(plo,interior);
					PlayerInfo[plo][pLocal] = PlayerInfo[playerid][pLocal];
					SetPlayerVirtualWorld(plo,world);
					LinkVehicleToInterior(tmpcar,interior);
					SetVehicleVirtualWorld(tmpcar,world);
				}
				else
				{
				    SetPlayerInterior(plo,interior);
					PlayerInfo[plo][pLocal] = PlayerInfo[playerid][pLocal];
					SetPlayerVirtualWorld(plo,world);
					SetPlayerPos(plo,plocx,plocy+1.5, plocz);
				}
				SendClientMessage(plo, COLOR_GRAD1, "   Вас телепортировали!");
			}
			else
				SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
		}
	}
	else
	{
		format(string, sizeof(string), "   %d - нет такого игрока.", plo);
		SendClientMessage(playerid, COLOR_GRAD1, string);
	}
	return 1;
}
COMMAND:backhere(playerid,params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    new plo,string[255];
		if(sscanf(params, "u", plo))
			return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /backhere [id_игрока/ЧастьИмени]");
		if (IsPlayerConnected(plo))
		{
	    	if(plo != INVALID_PLAYER_ID)
	    	{
	    	    if(BackTelePosZ[plo]!=0.0)
	    	    {
		    	    SetPlayerPos(plo, BackTelePosX[plo],BackTelePosY[plo],BackTelePosZ[plo]);
				    GetPlayerInterior(BackTeleInt[plo]);
		   		 	GetPlayerVirtualWorld(BackTeleWorld[plo]);
		   		 	SendClientMessage(plo, COLOR_GRAD1, " Вас телепортировали обратно!");
		   		 	SendClientMessage(playerid, COLOR_GRAD1, " Вы вернули игрока на место первоначальной телепортации!");
		   		 	BackTelePosZ[plo]=0.0;
	   		 	}
	   		 	else
	   		 		SendClientMessage(playerid, COLOR_GRAD1, " Этого игрока еще не телепортировали!");
	    	}
	    	else
			{
				format(string, sizeof(string), "   %d - нет такого игрока.", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
	    }
	    else
		{
			format(string, sizeof(string), "   %d - нет такого игрока.", plo);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:tpto(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
	    new string[255],sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME];
		new telename[MAX_PLAYER_NAME];
		new giveplayerid,teleid;
		new Float:pX, Float:pY, Float:pZ,interior,world;
		if (!sscanf(params, "uu", giveplayerid,teleid))
		{
			if (IsPlayerConnected(giveplayerid) && IsPlayerConnected(teleid))
			{
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				GetPlayerName(teleid, telename, sizeof(telename));
				GetPlayerPos(teleid, pX,pY,pZ);
				interior=GetPlayerInterior(teleid);
				world=GetPlayerVirtualWorld(teleid);
				SetPlayerInterior(giveplayerid,interior);
				SetPlayerVirtualWorld(giveplayerid,world);
				SetPlayerPos(giveplayerid, pX,pY,pZ);
				PlayerInfo[giveplayerid][pLocal] = PlayerInfo[teleid][pLocal];
				format(string, sizeof(string), " * Вы телепортировали %s'а (id: %d) к %s'у (id: %d).", giveplayer,giveplayerid,telename,teleid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), " * Вы были телепортированы к %s'у (id: %d) %s'ом (id: %d).", telename,teleid,sendername,playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
			}
			if (!IsPlayerConnected(giveplayerid))
			{
				format(string, sizeof(string), " * %d - неверный id игрока. (Игрок отсутствует на сервере)", giveplayerid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
			if (!IsPlayerConnected(teleid))
			{
				format(string, sizeof(string), " * %d - неверный id игрока. (Игрок отсутствует на сервере)", teleid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		}
		else
		    SendClientMessage(playerid, COLOR_WHITE, " * Используйте: /tpto [id игрока] [к id игрока]");
	}
	return 1;
}

COMMAND:check(playerid,params[])
{
	if(!PlayerInfo[playerid][pAdmin])return 1;
	new giveplayerid;
	if(sscanf(params,"u",giveplayerid))
	    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /check [id/имя игрока]");
	ShowStats(giveplayerid,playerid);
	return 1;
}
COMMAND:kick(playerid,params[])
{
	new hour,minuite,second;
	gettime(hour,minuite,second);
	new giveplayerid,result[128],sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME],string[255];
	if(sscanf(params, "us[64]", giveplayerid,result))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /kick [id_игрока/ЧастьИмени] [причина]");
	if(IsPlayerNPC(giveplayerid))return 1;
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(IsPlayerConnected(giveplayerid))
		{
		    if(giveplayerid != INVALID_PLAYER_ID)
		    {
			    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				new kickstring[64];
				new year, month,day;
				getdate(year, month, day);
				format(string, sizeof(string), "AdmCmd: %s был кикнут администратором %s, причина: %s", giveplayer, sendername, (result));
				SendClientMessageToAll(COLOR_LIGHTRED, string);
				print(string);
				format(kickstring, sizeof(kickstring), "** Вас кикнул: %s **", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Причина: %s **",(result));
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Время: %02d:%02d:%02d **",hour,minuite,second);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Дата: %d/%d/%d **",day,month,year);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				Kick(giveplayerid);
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d - нет такого игрока.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	}
	return 1;
}
COMMAND:ban(playerid,params[])
{
	new hour,minuite,second;
	gettime(hour,minuite,second);
	new giveplayerid,result[128],sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME],string[255];
	if(sscanf(params, "us[64]", giveplayerid,result))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /ban [id_игрока/ЧастьИмени] [причина]");
	if(IsPlayerNPC(giveplayerid))return 1;
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(IsPlayerConnected(giveplayerid))
		{
		    if(giveplayerid != INVALID_PLAYER_ID)
		    {
			    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				new kickstring[64];
				new year, month,day;
				getdate(year, month, day);
				format(string, sizeof(string), "AdmCmd: %s был забанен администратором %s, причина: %s", giveplayer, sendername, (result));
				SendClientMessageToAll(COLOR_LIGHTRED, string);
				print(string);
				format(kickstring, sizeof(kickstring), "** Вас забанил: %s **", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Причина: %s **",(result));
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Время: %02d:%02d:%02d **",hour,minuite,second);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Дата: %d/%d/%d **",day,month,year);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				PlayerInfo[giveplayerid][pBan]=1;
				Kick(giveplayerid);
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d - нет такого игрока.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	}
	return 1;
}

COMMAND:setstat(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin]<1)return 1;
	new giveplayerid,type,i,str[255];
	if(sscanf(params,"uii",giveplayerid,type,i))
	{
	    SendClientMessage(playerid, COLOR_GRAD2, "0 деньги 1 очки 2 телефон 3 пол 4 модель машины 5 цвет1 6 цвет2 7 пробег 8 туториал 9 тракстоп 10 голод 11 усталость 12 скин");
	    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /setstat [id_игрока/ЧастьИмени] [ключ] [значение]");
	}
	switch(type)
	{
	    case 0:
	    {
	        str="Деньги";
			PlayerInfo[giveplayerid][pMoney]=i;
		}
		case 1:
		{
		    str="Очки";
			PlayerInfo[giveplayerid][pPoints]=i;
		}
		case 2:
		{
		    str="Телефон";
			PlayerInfo[giveplayerid][pPhone]=i;
		}
		case 3:
		{
		    str="Пол";
			PlayerInfo[giveplayerid][pSex]=i;
		}
		case 4:
		{
		    str="Модель машины";
			PlayerInfo[giveplayerid][pCarModel]=i;
		}
		case 5:
		{
		    str="Цвет 1";
			PlayerInfo[giveplayerid][pCarColor1]=i;
		}
		case 6:
		{
		    str="Цвет 2";
			PlayerInfo[giveplayerid][pCarColor2]=i;
		}
		case 7:
		{
		    str="Пробег";
			PlayerInfo[giveplayerid][pCarMileage]=i*10000;
		}
		case 8:
		{
		    str="Туториал";
			PlayerInfo[giveplayerid][pTutorial]=i;
		}
		case 9:
		{
		    str="Тракстоп";
			PlayerInfo[giveplayerid][pTruckStop]=i;
		}
		case 10:
		{
		    str="Голод";
			PlayerInfo[giveplayerid][pHunger]=i;
		}
		case 11:
		{
		    str="Усталость";
			PlayerInfo[giveplayerid][pFatigue]=i;
		}
		case 12:
		{
		    str="Скин";
			PlayerInfo[giveplayerid][pModel]=i;
			SetPlayerSkin(playerid,PlayerInfo[playerid][pModel]);
		}
	}
	format(str,sizeof(str),"Вы изменили параметр [%s] на [%d]",str,i);
	SendClientMessage(playerid, COLOR_GRAD2,str);
	return 1;
}


enum specinfo
{
	InSpec,
	SpecID,
	Float:specx,
	Float:specy,
	Float:specz,
}
new SpecInfo[MAX_PLAYERS][specinfo];

stock Spec(playerid,targetid,bit)
{
	switch(bit)
	{
	    case 0://стартспек
	    {
	        SpecInfo[playerid][InSpec]=1;
	        GetPlayerPos(playerid,SpecInfo[playerid][specx],SpecInfo[playerid][specy],SpecInfo[playerid][specz]);
	        TogglePlayerSpectating(playerid,1);
	        Spec(playerid,targetid,1);
	        TextDrawShowForPlayer(playerid,ChangeText);
	    }
		case 1://плеерспек
		{
		    SpecInfo[playerid][SpecID]=targetid;
		    SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(targetid));
			SetPlayerInterior(playerid,GetPlayerInterior(targetid));
		    if(IsPlayerInAnyVehicle(targetid))
		    {
		        new vehid=GetPlayerVehicleID(targetid);
		        PlayerSpectateVehicle(playerid,vehid);
		    }
		    else
		    {
		    	PlayerSpectatePlayer(playerid,targetid);
		    }
			new string[128];
		    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~y~%s(ID:%d)",oGetPlayerName(targetid),targetid);
   			GameTextForPlayer(playerid, string, 4000, 3);
	    }
	    case 2://вечиклспек
	    {
	        SpecInfo[playerid][InSpec]=1;
	        TogglePlayerSpectating(playerid,1);
	        PlayerSpectateVehicle(playerid,targetid);
	        new model=GetVehicleModel(targetid);
	        new string[255];
	        format(string,sizeof(string),"~n~~n~~n~~n~~n~~n~~n~~y~%s(%d)ID:%d",CarName[model-400],model,targetid);
            GameTextForPlayer(playerid, string, 4000, 3);
		}
	    case 3://спекофф
	    {
	        SpecInfo[playerid][InSpec]=0;
	    	TogglePlayerSpectating(playerid,0);
	    	TextDrawHideForPlayer(playerid,ChangeText);
	    }
	    case 4://спекапдейт
		{
 			foreach (Player, i)
			{
				if(SpecInfo[i][InSpec])
				{
				    if(SpecInfo[i][SpecID]==playerid)
				    {
			   		    Spec(i,playerid,1);
					}
				}
			}
		}
		case 5://переключение вперед
		{
		    for(new i=SpecInfo[playerid][SpecID]; i<MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(IsPlayerNPC(i))
						continue;
				    if(GetPlayerState(i) == PLAYER_STATE_SPECTATING)
						continue;
					if(GetPlayerState(i) != 1 && GetPlayerState(i) != 2 && GetPlayerState(i) != 3)
						continue;
				    if(i>SpecInfo[playerid][SpecID]&&SpecInfo[playerid][SpecID]!=playerid)
				    {
				        Spec(playerid,i,1);
						return 1;
				    }
			    }
			}
		    SpecInfo[playerid][SpecID]=0;
		    //Spec(playerid,0,5);
		}
		case 6://переключение назад
		{
		    for(new i=SpecInfo[playerid][SpecID]; i>-1; i--)
			{
				if(IsPlayerConnected(i))
				{
					if(IsPlayerNPC(i))
						continue;
                    if(GetPlayerState(i) == PLAYER_STATE_SPECTATING)
						continue;
					if(GetPlayerState(i) != 1 && GetPlayerState(i) != 2 && GetPlayerState(i) != 3)
						continue;
				    if(i<SpecInfo[playerid][SpecID]&&SpecInfo[playerid][SpecID]!=playerid)
				    {
				        Spec(playerid,i,1);
						return 1;
				    }
			    }
			}
		    SpecInfo[playerid][SpecID]=MAX_PLAYERS;
		    //Spec(playerid,0,6);
		}
		case 7://выход спекаемого
		{
			foreach (Player, i)
			{
				if(SpecInfo[i][InSpec])
				{
				    if(SpecInfo[i][SpecID]==playerid)
				    {
						Spec(i,0,5);
					}
				}
			}
		}
		case 8:
		{
			ShowAllPlayersInRange(playerid,20.0);
		}
    }
    return 1;
}

stock SpecOnPlayerKeyStateChange(playerid, newkeys)
{
	if(SpecInfo[playerid][InSpec])
	{
	    switch(newkeys)
		{
		    case KEY_ANALOG_RIGHT:
			{
				Spec(playerid,0,5);
			}
			case KEY_ANALOG_LEFT:
			{
			    Spec(playerid,0,6);
			}
			case KEY_YES:
			{
				Spec(playerid,0,8);
			}
		}
	}
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	Spec(playerid,0,4);
	return 1;
}

stock ShowAllPlayersInRange(playerid,Float:range)
{
	new Float:dis2;
	new str[128];
	format(str,sizeof(str),"Игроки в радиусе %f от вас",range);
	SendClientMessage(playerid,COLOR_YELLOW,str);
	new Float:pos[3];
	GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	foreach (Player, x)
	{
		if(x != playerid)
		{
		    if(GetPlayerState(x)!=PLAYER_STATE_SPECTATING)
		    {
				dis2 = GetPlayerDistanceFromPoint(x,pos[0],pos[1],pos[2]);
				if(dis2 <= range)
				{
					format(str,sizeof(str),"%f - %s [%d]",dis2,oGetPlayerName(x),x);
					SendClientMessage(playerid,COLOR_GREY,str);
				}
			}
		}
	}
	return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
	    SetPlayerStartEngine(playerid,vehicleid);
	    if(PlayerInfo[playerid][pDeliveryID]==-1)
	    {
			if(PlayerInfo[playerid][pCarID]==vehicleid)
			{
				if(IsATruck(vehicleid))
				    SendClientMessage(playerid,COLOR_YELLOW,"Подцепите прицеп, для возможности получить заказ.");
				else
				    SendClientMessage(playerid,COLOR_YELLOW,"Используйте /delivery для получения заказа.");
			}
		}
	}
	Spec(playerid,0,4);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    Spec(playerid,0,4);
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    Spec(playerid,0,4);
    return 1;
}

COMMAND:spec(playerid,params[])
{
	new specid;
	if(sscanf(params, "u", specid))
		return SendClientMessage(playerid, COLOR_RED, " ИСПОЛЬЗУЙТЕ: /spec [id_игрока/ЧастьИмени]");
	if(specid == playerid)
		return SendClientMessage(playerid, COLOR_RED, " Нельзя наблюдать за самим собой!");

	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(IsPlayerConnected(specid))
		{
			if(GetPlayerState(specid) == PLAYER_STATE_SPECTATING)
				return SendClientMessage(playerid, COLOR_RED, " Этот игрок наблюдает за кем то!");
			if(GetPlayerState(specid) != 1 && GetPlayerState(specid) != 2 && GetPlayerState(specid) != 3)
				return SendClientMessage(playerid, COLOR_RED, " Игрок не вступил в игру!");
			Spec(playerid,specid,0);
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:specveh(playerid,params[])
{
    new specid;
	if(sscanf(params, "i", specid))
		return SendClientMessage(playerid, COLOR_RED, " ИСПОЛЬЗУЙТЕ: /specveh [id_авто]");
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		Spec(playerid,specid,2);
	}
	return 1;
}
COMMAND:specoff(playerid,params[])
{
    new specid,string[128];
	if(sscanf(params, "u", specid))
	{
    	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
    	return Spec(playerid,0,3);
	}
	if(PlayerInfo[playerid][pAdmin] >= 1337)
	{
		Spec(specid,0,3);
		format(string, sizeof(string), " Вы выкинули [%d]%s из режима наблюдения!",specid, oGetPlayerName(specid));
		SendClientMessage(playerid, COLOR_GRAD2, string);
	}
	return 1;
}

COMMAND:fixveh(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1)
	    return SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	if(IsPlayerInAnyVehicle(playerid))
	{
	    SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
	    RepairVehicle(GetPlayerVehicleID(playerid));
	    SendClientMessage(playerid, COLOR_GREY, "   Машина починена!");
	}
	return 1;
}
COMMAND:apage(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin]>=1)
		AchatLstMode(playerid);
	return 1;
}
//==========
COMMAND:achat(playerid,params[])
{
	new string[255];
	if(PlayerInfo[playerid][pAdmin]>=1)
	{
		if (!isnull(params))
		{
			format(string , sizeof(string), "%d->%s: %s",PlayerInfo[playerid][pAdmin],oGetPlayerName(playerid), params);
			SendAddMessage(COLOR_LIGHTBLUE,string);
			return 1;
		}
		if(AddChatAcess[playerid][0] == 0)
			EnableAChat(playerid);
		else
			DisableAChat(playerid);
	}
	return 1;
}

new CreatedCars[100];
new CreatedCar = 0;

COMMAND:veh(playerid,params[])
{
    if (PlayerInfo[playerid][pAdmin] < 1)
	    return SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	new car,color1,color2;
	if (sscanf(params, "iii", car,color1,color2))
	{
		SendClientMessage(playerid, COLOR_GRAD2, "{ffcc99}Используйте: {d5d5d5}/veh [id машины] [цвет1] [цвет2]");
		return ShowCarsList(playerid,0);
	}
	if(car < 400 || car > 611)
		return SendClientMessage(playerid, COLOR_GREY, "   Номер транспортного средства не должен быть ниже 400 и выше 611!");
	if(color1 < -1 || color1 > 126)
		return SendClientMessage(playerid, COLOR_GREY, "   Номер цвета должен быть не ниже 0 и не выше 126!");
	if(color2 < -1 || color2 > 126)
		return SendClientMessage(playerid, COLOR_GREY, "   Номер цвета должен быть не ниже 0 и не выше 126!");
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid, X,Y,Z);
	new carid = CreateVehicle(car, X,Y,Z, 0.0, color1, color2, 60000);
	CreatedCars[CreatedCar] = carid;
	CreatedCar ++;
	new string[128];
	format(string, sizeof(string), "   Транспортное средство %d(%s[%d]) создано.", carid,CarNames[car-400],car);
	SendClientMessage(playerid, COLOR_GREY, string);
	return 1;
}
COMMAND:destroycars(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1)
	    return SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
//=================================================
	new Jpbit=0;
	new Jpbit2=0;
	for(new i = 0; i < sizeof(CreatedCars); i++)
	{
		if(CreatedCars[i] != 0)
		{
			//=========================
		  	Jpbit=0;
			foreach (Player, vi)
			{
				if(IsPlayerInVehicle(vi, CreatedCars[i]))
				{
					RemovePlayerFromVehicle(vi);
					Jpbit=1;
				}
			}
			if(Jpbit == 0)DestroyVehicle(CreatedCars[i]);
			else Jpbit2=1;  //=1 если когото выкинули
			//=========================
		}
	}
	if (Jpbit2 == 0)
		SendClientMessage(playerid, COLOR_GREY, "   Все созданные транспортные средства уничтожены!");
	else
		SendClientMessage(playerid, COLOR_GREY, "   Злоумышленники наказаны!");
	return 1;
}

stock ShowCarsList(playerid,id)
{
	new str[4096];
	for(new i=id;i<sizeof(CarNames);i++)
 	{
		format(str, 4096, "%s%i\t%d|%s\n", str, i+400,i+400,CarNames[i]);
	}
	ShowPlayerDialog(playerid,DIALOG_ADMINVEH,DIALOG_STYLE_LIST,"Select vehicle:",str,"Select", "Cancel");//DIALOG_STYLE_PREVIEW_MODEL
	return 1;
}
stock VehDialogResponse(playerid,response,listitem,inputtext[])
{
	new car=listitem+400;
	new string[255];
	format(string,sizeof(string),"resp %d, list %d, input %s",response, listitem, inputtext);
	SendClientMessage(playerid,COLOR_GREY,string);
	if(!response) return 1;
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid, X,Y,Z);
	new carid = CreateVehicle(car, X,Y,Z, 0.0, -1, -1, 60000);
	CreatedCars[CreatedCar] = carid;
	CreatedCar ++;
	format(string, sizeof(string), "Транспортное средство %d(%s[%d]) создано.", carid,CarNames[car-400],car);
	SendClientMessage(playerid, COLOR_GREY, string);
	return 1;
}