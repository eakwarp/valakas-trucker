COMMAND:convoy(playerid,params[])
{
    if(PlayerInfo[playerid][pPoints] < 100)
	    return SendClientMessage(playerid, COLOR_GRAD2, "� ��� ������������ ����� ��� �� �������, ��� ������������� � ������.");
	new str[255];
	if(PlayerConvoyCreater[playerid])//�������� ������
	{
	    format(str,sizeof(str),"%s ������ ������",
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
		SendClientMessage(playerid,COLOR_WHITE,"�� ������� ������, ��� ��� ��������� ���������");
		return 1;
	}
	if(PlayerConvoyID[playerid]!=INVALID_PLAYER_ID)
	{
	    format(str,sizeof(str),"%s ����� �� ������",
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
		SendClientMessage(playerid,COLOR_WHITE,"�� ����� �� ������");
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
		        format(str,sizeof(str),"%s ������������� � ������ ������",
		        	GetPlayerNameEx(playerid));
		        foreach(Player,a)
				{
				    if(PlayerConvoyID[a]==i)
		        		SendClientMessage(a,COLOR_WHITE,str);
		        }
		        format(str,sizeof(str),"�� �������������� � ������ %s",
		        	GetPlayerNameEx(i));
		        SendClientMessage(playerid,COLOR_WHITE,str);
		        PlayerConvoyID[playerid]=i;
		        return 1;
		    }
	    }
	}
	PlayerConvoyCreater[playerid]=1;
	PlayerConvoyID[playerid]=playerid;
	format(str,sizeof(str),"������������ %s ������ ������, �����������: {FFFF00}/convoy {FFFFFF} ��� �� �������������.",
		GetPlayerNameEx(playerid));
	foreach(Player,a)
	{
	    if(!PlayerConvoyCreater[a] && PlayerConvoyID[a]==INVALID_PLAYER_ID)
	    {
	        SendClientMessage(a,COLOR_WHITE,str);
	    }
	}
	SendClientMessage(playerid,COLOR_WHITE,"�� ������� ������, ���� �������������� ��� ������� �� ���� ��������");
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
    format(str,sizeof(str),"%s ������� ������",
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
	SendClientMessage(playerid,COLOR_WHITE,"�� �������� ������");
    PlayerConvoyID[playerid]=INVALID_PLAYER_ID;
	return 1;
}