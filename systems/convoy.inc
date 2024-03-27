COMMAND:convoy(playerid,params[])
{
    if(PlayerInfo[playerid][pPoints] < 100)
	    return SendClientMessage(playerid, COLOR_GRAD2, "У вас недостаточно очков что бы создать, или присоеденится к конвою.");
	new str[255];
	if(PlayerConvoyCreater[playerid])//удаление конвоя
	{
	    format(str,sizeof(str),"%s удалил конвой",
	        GetPlayerNameEx(playerid));
	    PlayerConvoyCreater[playerid]=0;
	    foreach(Player,a)
		{
			if(PlayerConvoyID[a]==playerid)
			{
			    PlayerConvoyID[a]=INVALID_PLAYER_ID;
			    SendClientMessage(a,COLOR_WHITE,str);
			}
		}
		SendClientMessage(playerid,COLOR_WHITE,"Вы удалили конвой, все его участники оповещены");
		return 1;
	}
	if(PlayerConvoyID[playerid]!=INVALID_PLAYER_ID)
	{
	    format(str,sizeof(str),"%s вышел из конвоя",
	        GetPlayerNameEx(playerid));
		new b=PlayerConvoyID[playerid];
		PlayerConvoyID[playerid]=INVALID_PLAYER_ID;
        foreach(Player,a)
		{
			if(PlayerConvoyID[a]==b)
			{
			    SendClientMessage(a,COLOR_WHITE,str);
			}
		}
		SendClientMessage(playerid,COLOR_WHITE,"Вы вышли из конвоя");
		return 1;
	}
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	foreach(Player,i)
	{
	    if(PlayerConvoyCreater[i])
	    {
		    if(IsPlayerInRangeOfPoint(i,150.0,x,y,z))
		    {
		        format(str,sizeof(str),"%s присоеденился к вашему конвою",
		        	GetPlayerNameEx(playerid));
		        foreach(Player,a)
				{
				    if(PlayerConvoyID[a]==i)
		        		SendClientMessage(a,COLOR_WHITE,str);
		        }
		        format(str,sizeof(str),"Вы присоеденились к конвою %s",
		        	GetPlayerNameEx(i));
		        SendClientMessage(playerid,COLOR_WHITE,str);
		        PlayerConvoyID[playerid]=i;
		        return 1;
		    }
	    }
	}
	PlayerConvoyCreater[playerid]=1;
	PlayerConvoyID[playerid]=playerid;
	format(str,sizeof(str),"Дальнобойщик %s создал конвой, ИСПОЛЬЗУЙТЕ: {FFFF00}/convoy {FFFFFF} что бы присоеденится.",
		GetPlayerNameEx(playerid));
	foreach(Player,a)
	{
	    if(!PlayerConvoyCreater[a] && PlayerConvoyID[a]==INVALID_PLAYER_ID)
	    {
	        SendClientMessage(a,COLOR_WHITE,str);
	    }
	}
	SendClientMessage(playerid,COLOR_WHITE,"Вы создали конвой, всем дальнобойщиком вне конвоев об этом сообщено");
	return 1;
}

stock CheckCountConvoy(playerid)
{
	new num;
	if(PlayerConvoyID[playerid]==INVALID_PLAYER_ID)return 0;
	foreach(Player,a)
	{
	    if(PlayerConvoyID[a]==PlayerConvoyID[playerid]&&a!=playerid)
			num++;
    }
	return num;
}

stock CheckConvoy(playerid)
{
    if(PlayerConvoyCreater[playerid])
		return 1;
    new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
    foreach(Player,a)
	{
	    if(PlayerConvoyID[a]==PlayerConvoyID[playerid])
	    {
	        if(IsPlayerInRangeOfPoint(playerid,150.0,x,y,z))
	        	return 1;
	    }
	}
	new str[255];
    format(str,sizeof(str),"%s потерял конвой",
        GetPlayerNameEx(playerid));
	new b=PlayerConvoyID[playerid];
	PlayerConvoyID[playerid]=INVALID_PLAYER_ID;
    foreach(Player,a)
	{
		if(PlayerConvoyID[a]==b)
		{
		    SendClientMessage(a,COLOR_WHITE,str);
		}
	}
	SendClientMessage(playerid,COLOR_WHITE,"Вы потеряли конвой");
    PlayerConvoyID[playerid]=INVALID_PLAYER_ID;
	return 1;
}