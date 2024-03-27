
COMMAND:report(playerid,params[])
{
	new string[255];
    if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /report [id] [описание нарушения]");
	format(string, sizeof(string), " Жалоба от (id:%d) %s: %s", playerid, GetPlayerNameEx(playerid), params);
	ABroadCast(COLOR_RED,string,1);
	HBroadCast(COLOR_RED,string,1);
	SendClientMessage(playerid, COLOR_YELLOW, " Ваше письмо с жалобой (оригинал смотрите ниже) отправлено Администраторам.");
	SendClientMessage(playerid, COLOR_RED, params);
    return 1;
}
COMMAND:question(playerid,params[])
{
	new string[255];
    if(questiontime==0) return SendClientMessage(playerid, COLOR_GREY, "   В сервисы можно писать не чаще чем раз в 5 секунд!");
	if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /question [текст]");
	format(string, sizeof(string), "* Вопрос от %s (%d): %s", GetPlayerNameEx(playerid), playerid, params);
	ABroadCast(COLOR_LIGHTBLUE,string,1);
	HBroadCast(COLOR_LIGHTBLUE,string,1);
	format(string, sizeof(string), "* Вы задали вопрос: %s", params);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
    SetTimer("QuestionOn", 5000, 0);questiontime = 0;
    return 1;
}
COMMAND:request(playerid,params[])
{
	new string[255];
    if(questiontime==0) return SendClientMessage(playerid, COLOR_GREY, "   В сервисы можно писать не чаще чем раз в 5 секунд!");
	if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /request [текст]");
	format(string, sizeof(string), "* Просьба от %s (%d): %s", GetPlayerNameEx(playerid), playerid, params);
	ABroadCast(COLOR_LIGHTBLUE,string,1);
	HBroadCast(COLOR_LIGHTBLUE,string,1);
	format(string, sizeof(string), "* Вы отправили просьбу: %s", params);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	SetTimer("QuestionOn", 5000, 0);questiontime = 0;
    return 1;
}
COMMAND:answer(playerid,params[])
	return cmd_an(playerid,params);
COMMAND:an(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pHelper] > 0)
	{
	    new giveplayerid,string[255],giveplayer[MAX_PLAYER_NAME],sendername[MAX_PLAYER_NAME],result[255];

	    if (sscanf(params, "us[64]", giveplayerid,result))
			return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: (/an)swer [id_игрока/ЧастьИмени] [текст]");
		if (IsPlayerConnected(giveplayerid))
		{
		    if(giveplayerid != INVALID_PLAYER_ID)
	   		{
				GetPlayerName(playerid, sendername, sizeof(sendername));
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				if(PlayerInfo[playerid][pAdmin] > 0)
					format(string, sizeof(string), "* Администратор %s отвечает: %s", sendername, (result));
				else if(PlayerInfo[playerid][pHelper] > 0)
					format(string, sizeof(string), "* Хелпер %s отвечает: %s", sendername, (result));

				SendClientMessage(giveplayerid, COLOR_LIGHTRED, string);
				format(string, sizeof(string), " %s ответил %s: %s", sendername, giveplayer, (result));
				HABroadCast(playerid,COLOR_LIGHTRED,string,1);
				format(string, sizeof(string), " Вы ответили %s(ID: %d): %s", giveplayer, giveplayerid, (result));
				SendClientMessage(playerid,  COLOR_LIGHTRED, string);
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d - нет такого игрока.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	}
	else
        SendClientMessage(playerid, COLOR_GREY, "   Вы не администратор/хелпер !");
	return 1;
}

stock HABroadCast(playerid,color,const string[],level)
{
	foreach (Player, i)
	{
	    if(i!=playerid)
		{
			if (PlayerInfo[i][pHelper] >= level||PlayerInfo[i][pAdmin] >= level)
				SendClientMessage(i, color, string);
		}
	}
	printf("%s", string);
	return 1;
}

stock HBroadCast(color,const string[],level)
{
	foreach (Player, i)
	{
		if(PlayerInfo[i][pAdmin] == 0)
		{
			if (PlayerInfo[i][pHelper] >= level)
				SendClientMessage(i, color, string);
		}
	}
	printf("%s", string);
	return 1;
}

stock ABroadCast(color,const string[],level)
{
	foreach (Player, i)
	{
		if (PlayerInfo[i][pAdmin] >= level)
			SendClientMessage(i, color, string);
	}
	printf("%s", string);
	return 1;
}

forward QuestionOn();
public QuestionOn()
{
    questiontime=1;
	return 1;
}

COMMAND:me(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /me [действие]");
	Me(playerid, params,30.0);
	return 1;
}

COMMAND:do(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /do [действие]");
	new string[255];
	format(string, sizeof(string), "* %s ((%s))", params, GetPlayerNameEx(playerid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	return 1;
}

COMMAND:todo(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params) || strfind( params , "*" , true ) == -1 )
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /todo [текст]*[действие] (звездочка разделяет текст и действие!)");
    new arrCoords[2][128],string[255];
    sscanf(params,"p<*>s[128]s[128]",arrCoords[0],arrCoords[1]);
    if(PlayerInfo[playerid][pSex] == 2)
		format(string, sizeof(string), "{E6E6E6}\"%s\", - сказала %s,{C2A2DA} %s",arrCoords[0], GetPlayerNameEx(playerid),arrCoords[1]);
	else
		format(string, sizeof(string), "\"%s\", - сказал %s,{C2A2DA} %s",arrCoords[0], GetPlayerNameEx(playerid),arrCoords[1]);
	ProxDetector(30.0, playerid, string, COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	return 1;
}

COMMAND:try(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	new sendername[MAX_PLAYER_NAME],string[255];
	GetPlayerName(playerid, sendername, sizeof(sendername));
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /try [действие]");
	new temptryrand = random(2);
	if(temptryrand == 1)
	{
	    if(PlayerInfo[playerid][pSex] == 2) format(string, sizeof(string), "* %s попыталась %s. (удачно)", sendername, params);
		else format(string, sizeof(string), "* %s попытался %s. (удачно)", sendername, params);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	else
	{
	    if(PlayerInfo[playerid][pSex] == 2) format(string, sizeof(string), "* %s попыталась %s. (не удалось)", sendername, params);
		else format(string, sizeof(string), "* %s попытался %s. (не удалось)", sendername, params);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	return 1;
}

stock PlayerMuteMessage(playerid)
{
	new string[255];
	format(string,sizeof(string), " Вы не можете разговаривать, Вы заглушены администратором. Оставшееся время заглушки - %d секунд.", PlayerInfo[playerid][pMutedTime]);
	SendClientMessage(playerid,COLOR_RED,string);
	SetPlayerChatBubble(playerid, "[mute]", COLOR_RED, 5.0, 3500);
	return 1;
}

stock Me(playerid, string[],Float:dist)
{
	new result[128];
	format(result, sizeof(result), "* %s %s", GetPlayerNameEx(playerid), string);
	ProxDetector(dist, playerid, result, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	SetPlayerChatBubble(playerid, result, COLOR_PURPLE, dist, 3500);
	printf("%s", result);
}

stock ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	new world = GetPlayerVirtualWorld(playerid);
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	foreach (Player, i)
	{
	    if(GetPlayerVirtualWorld(i) == world)
	    {
			GetPlayerPos(i, posx, posy, posz);
			tempposx = (oldposx -posx);
			tempposy = (oldposy -posy);
			tempposz = (oldposz -posz);
			if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
				SendClientMessage(i, col1, string);
			else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
				SendClientMessage(i, col2, string);
			else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
				SendClientMessage(i, col3, string);
			else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
				SendClientMessage(i, col4, string);
			else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				SendClientMessage(i, col5, string);
		}
	}
	return 1;
}

COMMAND:b(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /b [местный ooc чат]");
	new string[255];
	format(string, sizeof(string), "%s произнес: (( %s ))", GetPlayerNameEx(playerid), params);
	ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	printf("%s", string);
	return 1;
}

COMMAND:l(playerid,params[])
	return LocalUse(playerid,params);
COMMAND:local(playerid,params[])
	return LocalUse(playerid,params);

stock LocalUse(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
	 	return PlayerMuteMessage(playerid);
	new sendername[MAX_PLAYER_NAME],string[255];
	GetPlayerName(playerid, sendername, sizeof(sendername));
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: (/l)ocal [местный чат]");
	switch(PlayerInfo[playerid][pSex])
	{
	    case 2: format(string, sizeof(string), "%s произнесла: %s", sendername, params);
	    default: format(string, sizeof(string), "%s произнес: %s", sendername, params);
	}
	ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	printf("%s", string);
	return 1;
}

COMMAND:c(playerid,params[])
	return CloseUse(playerid,params);
COMMAND:close(playerid,params[])
    return CloseUse(playerid,params);
stock CloseUse(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /(c)lose [закрытый текст чата]");
	new string[255];
	format(string, sizeof(string), "%s тихо говорит: %s", GetPlayerNameEx(playerid), params);
    ProxDetector(3.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	printf("%s", string);
	return 1;
}

COMMAND:s(playerid,params[])
	return ShoutUse(playerid,params);
COMMAND:shout(playerid,params[])
	return ShoutUse(playerid,params);
stock ShoutUse(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: (/s)hout [местный чат]");
	new string[255];
	format(string, sizeof(string), "%s кричит: %s!!", GetPlayerNameEx(playerid), params);
	ProxDetector(30.0, playerid, string,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_FADE1,COLOR_FADE2);
	printf("%s", string);
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1; //Shout.Animation.
    ApplyAnimation(playerid,"RIOT","RIOT_shout",4.0,0,0,0,0,0);
	return 1;
}

COMMAND:r(playerid,params[])
{
    new sendername[MAX_PLAYER_NAME],string[255];
	sendername = GetPlayerNameEx(playerid);
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /r [радио чат]");
    format(string, sizeof(string), "[Радио волна] %s: %s",  sendername, params);
    new Float:Pos[3];
    GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
    new Float:rad=800.0;
    if(PlayerInfo[playerid][pCarRadio])
		rad=1800.0;
	new bit;
	foreach(Player,i)
	{
	    if(i==playerid)continue;
	    if(PlayerInfo[i][pCarRadio])
	    {
	        if(IsPlayerInRangeOfPoint(i,1800.0,Pos[0],Pos[1],Pos[2]))
	        {
	            bit++;
	            SendClientMessage(i,RADIO_MESSAGE,string);
	        }
		}
		else
		{
	    	if(IsPlayerInRangeOfPoint(i,rad,Pos[0],Pos[1],Pos[2]))
	    	{
	    	    bit++;
	        	SendClientMessage(i,RADIO_MESSAGE,string);
	   		}
	    }
	}
	format(string,sizeof(string),"[Радио волна(станций вокруг %d)] %s: %s",bit,sendername,params);
	SendClientMessage(playerid,RADIO_MESSAGE,string);
	printf("%s", string);
	return 1;
}

COMMAND:a(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] <= 0) return 1;
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: (/a)dmin [admin chat]");
	new string[128];
	format(string, sizeof(string), "[Level %d] %s: %s", PlayerInfo[playerid][pAdmin], GetPlayerNameEx(playerid), params);
	SendAdminMessage(ADMIN_MESSAGE, string);
	return 1;
}

stock SendAdminMessage(color, string[])
{
	foreach (Player, i)
	{
	    if(PlayerInfo[i][pAdmin] >= 1)
			SendClientMessage(i, color, string);
	}
	print(string);
	return 1;
}

COMMAND:hs(playerid,params[])
{
	new string[128];
	if(PlayerInfo[playerid][pHelper] <= 0) return 1;
	if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /hs [сообщение]");
	if(PlayerInfo[playerid][pHelper]==1339)
		format(string, sizeof(string), "* Босс %s: %s", GetPlayerNameEx(playerid), params);
	else
		format(string, sizeof(string), "[Level %d] %s: %s", PlayerInfo[playerid][pHelper], GetPlayerNameEx(playerid), params);
	SendHelperMessage(HELPER_CHAT_COLOR, string);
	return 1;
}

stock SendHelperMessage(color, string[])
{
	foreach (Player, i)
	{
	    if(PlayerInfo[i][pHelper] >= 1)
			SendClientMessage(i, color, string);
	}
	printf("%s", string);
	return 1;
}



COMMAND:ooc(playerid,params[])
	return OOCUse(playerid,params);
COMMAND:o(playerid,params[])
    return OOCUse(playerid,params);
stock OOCUse(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] < 1  && PlayerInfo[playerid][pHelper] < 1337 && noooc)
		return SendClientMessage(playerid, COLOR_GRAD2, "   Канал OOC отключен администратором!");
	if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	new string[255];
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: (/o)oc [ooc-чат]");
	format(string, sizeof(string), "(( %s: %s ))", GetPlayerNameEx(playerid), params);
	foreach (Player, i)
		SendClientMessage(i, OOC_MESSAGE, string);

	printf("%s", string);
	return 1;
}
COMMAND:call(playerid,params[])
{
    if(!PlayerInfo[playerid][pPhoneOnline])
        return SendClientMessage(playerid,COLOR_WHITE,"[Черный экран телефона]{FFFF00} - Ваш телефон выключен.");
    if(!Signal[playerid])
		return SendClientMessage(playerid,COLOR_WHITE,"[Короткие прерывистые гудки]{FFFF00} - Нет сети.");
	new number;
	if(sscanf(params,"i",number))
	    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /call [номер абонента]");
	foreach(Player,i)
	{
		if(PlayerInfo[i][pPhoneOnline])
		{
			if(PlayerInfo[i][pPhone]==number)
			{
				if(Signal[i]>0)
				{
				    if(CallerID[i]==INVALID_PLAYER_ID)
				    {
				        CallerID[playerid]=i;
			         	CallerID[i]=playerid;
			         	PlayerInCall[playerid]=1;
				        new str[255];
						format(str,sizeof(str),"Вызываем абонента %d",number);
						SendClientMessage(playerid,COLOR_WHITE,str);
				        SendClientMessage(playerid,COLOR_WHITE,"[Длинные гудки]{FFFF00} - Ждите ответа.");
				        format(str,sizeof(str),"[Звонит телефон]{FFFF00} - Вас вызывает абонент %d {33AA33}[(/p)ickup] {AA3333}[(/h)angup]",PlayerInfo[playerid][pPhone]);
						SendClientMessage(i,COLOR_WHITE,str);
                        return 1;
				    }
				    else
				    	return SendClientMessage(playerid,COLOR_WHITE,"[Короткие гудки]{FFFF00} - Занято.");
				}
			}
		}
	}
	SendClientMessage(playerid,COLOR_WHITE,"[Ответ от сети]{FFFF00} - Аппарат абонента выключен или находится вне зоны действия сети.");
	return 1;
}
COMMAND:p(playerid,params[])
{
	if(!PlayerInfo[playerid][pPhoneOnline])
        return SendClientMessage(playerid,COLOR_WHITE,"[Черный экран телефона]{FFFF00} - Ваш телефон выключен.");
    if(!Signal[playerid])
		return SendClientMessage(playerid,COLOR_WHITE,"[Короткие прерывистые гудки]{FFFF00} - Нет сети.");
	if(PlayerInCall[playerid])
	    return SendClientMessage(playerid,COLOR_WHITE,"[Телефон у головы]{FFFF00} - Вы уже разговариваете.");
    new str[255];
	if(CallerID[playerid]==INVALID_PLAYER_ID)
	{
		new time[128];
		new ye,mo,da,hour,minute,second;
		getdate(ye,mo,da);
		gettime(hour,minute,second);
		format(time, sizeof(time),"%02d-%02d %02d:%02d:%02d",mo,da,hour,minute,second);
		format(str,sizeof(str),"[Телефон в руке]{FFFF00} - Время на экране %s",time);
	    return SendClientMessage(playerid,COLOR_WHITE,str);
	}
	PlayerInCall[playerid]=1;
	format(str,sizeof(str),"[Звонок]{FFFF00} - Абонент %d поднял трубку",PlayerInfo[playerid][pPhone]);
	SendClientMessage(CallerID[playerid],COLOR_WHITE,str);

	SendClientMessage(playerid,COLOR_WHITE,"[Звонок]{FFFF00} - Вы подняли трубку");
	return 1;
}
COMMAND:h(playerid,params[])
{
    if(!PlayerInfo[playerid][pPhoneOnline])
        return SendClientMessage(playerid,COLOR_WHITE,"[Черный экран телефона]{FFFF00} - Ваш телефон выключен.");
    if(!Signal[playerid])
		return SendClientMessage(playerid,COLOR_WHITE,"[Короткие прерывистые гудки]{FFFF00} - Нет сети.");
	if(CallerID[playerid]==INVALID_PLAYER_ID)
        return SendClientMessage(playerid,COLOR_WHITE,"[Телефон в кармане]{FFFF00} - Вы не ведете разговор.");
    new str[255];
	if(PlayerInCall[playerid])
	{
	    format(str,sizeof(str),"[Звонок]{FFFF00} - Абонент %d положил трубку",PlayerInfo[playerid][pPhone]);
		SendClientMessage(playerid,COLOR_WHITE,"[Звонок]{FFFF00} - Вы положили трубку");
	}
	else
	{
	    format(str,sizeof(str),"[Звонок]{FFFF00} - Абонент %d отклонил звонок",PlayerInfo[playerid][pPhone]);
		SendClientMessage(playerid,COLOR_WHITE,"[Звонок]{FFFF00} - Вы отклонили звонок");
	}
	SendClientMessage(CallerID[playerid],COLOR_WHITE,str);
	PlayerInCall[CallerID[playerid]]=0;
	CallerID[CallerID[playerid]]=INVALID_PLAYER_ID;
	CallerID[playerid]=INVALID_PLAYER_ID;
	PlayerInCall[playerid]=0;
	return 1;
}
COMMAND:sms(playerid,params[])
{
    if(!PlayerInfo[playerid][pPhoneOnline])
        return SendClientMessage(playerid,COLOR_WHITE,"[Черный экран телефона]{FFFF00} - Ваш телефон выключен.");
    if(!Signal[playerid])
        return SendClientMessage(playerid,COLOR_WHITE,"[Неудачныя отправка]{FFFF00} - Нет сети.");
    new number, text[128];
    if(sscanf(params,"is[128]",number,text))
	    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /sms [номер абонента] [текст]");
    foreach(Player,i)
	{
		if(PlayerInfo[i][pPhoneOnline])
		{
			if(PlayerInfo[i][pPhone]==number)
			{
				if(Signal[i]>0)
				{
					new str[255];
					format(str,sizeof(str),"[Сообщение от %d] {FFFF00}%s",PlayerInfo[playerid][pPhone],text);
					SendClientMessage(i,COLOR_WHITE,str);
					format(str,sizeof(str),"[Сообщение для %d] {FFFF00}%s",number,text);
					SendClientMessage(playerid,COLOR_WHITE,str);
					return 1;
				}
			}
		}
	}
	SendClientMessage(playerid,COLOR_WHITE,"[Неудачныя отправка]{FFFF00} - Доставка не удалась.");
	return 1;
}
COMMAND:togphone(playerid,params[])
{
	if(PlayerInCall[playerid])
	    return SendClientMessage(playerid,COLOR_WHITE,"[Неудобные движения]{FFFF00} - Нельзя выключить телефон во время разговора.");
    switch(PlayerInfo[playerid][pPhoneOnline])
    {
		case 0:
		{
		    SendClientMessage(playerid,COLOR_WHITE,"[Заставка включения на экране телефна]{FFFF00} - телефон включен.");
		    PlayerInfo[playerid][pPhoneOnline]=1;
		}
		case 1:
		{
		    SendClientMessage(playerid,COLOR_WHITE,"[Заставка выключения на экране телефна]{FFFF00} - телефон выключен.");
		    PlayerInfo[playerid][pPhoneOnline]=0;
		}
    }
	return 1;
}

stock CallDeath(playerid)
{
    if(CallerID[playerid]!=INVALID_PLAYER_ID)
    {
        new str[255];
	    format(str,sizeof(str),"[Звонок]{FFFF00} - Абонент %d находится вне зоны действия сети",PlayerInfo[playerid][pPhone]);
	    SendClientMessage(CallerID[playerid],COLOR_WHITE,str);
		SendClientMessage(playerid,COLOR_WHITE,"[Звонок]{FFFF00} - Сигнал потерян.");
        CallerID[CallerID[playerid]]=INVALID_PLAYER_ID;
        PlayerInCall[CallerID[playerid]]=0;
        PlayerInCall[playerid]=0;
        CallerID[playerid]=INVALID_PLAYER_ID;
    }
    return 1;
}