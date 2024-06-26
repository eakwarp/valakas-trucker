enum radarinfo
{
	radarValid,
	radarObjID,//�� ���������
	Float:radarObjX,
	Float:radarObjY,
	Float:radarObjZ,
	Float:radarObjRot,

	Float:radarZoneX,
	Float:radarZoneY,
	Float:radarZoneZ,
	Float:radarZoneRad,
	Float:radarMaxSpeed,
};
new RadarInfo[MAX_RADAR][radarinfo];
stock LoadRadar(i)
{
	new query[255];
	format(query,sizeof(query),"SELECT radarObjX, radarObjY, radarObjZ, radarObjRot, radarZoneX, radarZoneY, radarZoneZ, radarZoneRad, radarMaxSpeed FROM radars WHERE id=%d",i);
	mysql_tquery(MySQL, query, "SQL_LoadRadar", "d", i);
	return 1;
}
forward SQL_LoadRadar(i);
public SQL_LoadRadar(i)
{
	new rows;
	cache_get_row_count(rows);
	if(rows>0)
	{
		//sscanf(Field,"p<|>fffffffff",
        cache_get_value_name_float(0,"radarObjX",RadarInfo[i][radarObjX]);
        cache_get_value_name_float(0,"radarObjY",RadarInfo[i][radarObjY]);
        cache_get_value_name_float(0,"radarObjZ",RadarInfo[i][radarObjZ]);
        cache_get_value_name_float(0,"radarObjRot",RadarInfo[i][radarObjRot]);
		cache_get_value_name_float(0,"radarZoneX",RadarInfo[i][radarZoneX]);
		cache_get_value_name_float(0,"radarZoneY",RadarInfo[i][radarZoneY]);
		cache_get_value_name_float(0,"radarZoneZ",RadarInfo[i][radarZoneZ]);
		cache_get_value_name_float(0,"radarZoneRad",RadarInfo[i][radarZoneRad]);
		cache_get_value_name_float(0,"radarMaxSpeed",RadarInfo[i][radarMaxSpeed]);
		RadarInfo[i][radarValid]=1;
		RadarInfo[i][radarObjID]=CreateDynamicObject(18880, RadarInfo[i][radarObjX],RadarInfo[i][radarObjY],RadarInfo[i][radarObjZ]-1.0,0.0,0.0,RadarInfo[i][radarObjRot]-180.0);

	}
	else
	    RadarInfo[i][radarValid]=0;
	return 1;
}
stock RadarInit()
{
    for(new i=0; i<MAX_RADAR; i++)
        LoadRadar(i);
    return 1;
}
stock SaveRadar(i)
{
	if(RadarInfo[i][radarValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE radars SET radarObjX='%f', radarObjY='%f', radarObjZ='%f', radarObjRot='%f', radarZoneX='%f', radarZoneY='%f', radarZoneZ='%f', radarZoneRad='%f', radarMaxSpeed='%f' WHERE id=%d",
        RadarInfo[i][radarObjX],
        RadarInfo[i][radarObjY],
        RadarInfo[i][radarObjZ],
        RadarInfo[i][radarObjRot],
		RadarInfo[i][radarZoneX],
		RadarInfo[i][radarZoneY],
		RadarInfo[i][radarZoneZ],
		RadarInfo[i][radarZoneRad],
		RadarInfo[i][radarMaxSpeed],
		i);
		mysql_query(MySQL, query, false);
		DestroyDynamicObject(RadarInfo[i][radarObjID]);
		RadarInfo[i][radarObjID]=CreateDynamicObject(18880, RadarInfo[i][radarObjX],RadarInfo[i][radarObjY],RadarInfo[i][radarObjZ]-1.0,0.0,0.0,RadarInfo[i][radarObjRot]-180.0);
	}
	return 1;
}
stock CreateRadar(playerid,Float:speed)
{
	for(new i=0; i<MAX_RADAR; i++)
	{
		if(!RadarInfo[i][radarValid])
		{
		    GetPlayerPos(playerid,RadarInfo[i][radarObjX],RadarInfo[i][radarObjY],RadarInfo[i][radarObjZ]);
		    GetPlayerFacingAngle(playerid,RadarInfo[i][radarObjRot]);
		    new query[255];
		    format(query,sizeof(query),"INSERT INTO radars SET radarObjX='%f', radarObjY='%f', radarObjZ='%f', radarObjRot='%f', radarMaxSpeed='%f', id=%d",
            RadarInfo[i][radarObjX],
	        RadarInfo[i][radarObjY],
	        RadarInfo[i][radarObjZ],
	        RadarInfo[i][radarObjRot],
	        speed,
	        i);
	        mysql_query(MySQL, query, false);
	        LoadRadar(i);
			return i;
		}
	}
	return 1;
}
COMMAND:radarcreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new Float:speed;
    if(sscanf(params, "f",speed))
    	return SendClientMessage(playerid, COLOR_GRAD2, " �����������: /radarcreate [������������ ��������]");
    new i=CreateRadar(playerid,speed);
    new str[128];
    format(str,sizeof(str),"�� ������� ����� %d, ������������ �������� %0.1f",i,RadarInfo[i][radarMaxSpeed]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:radarshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowRadar(playerid,0,29);
    return 1;
}

stock ShowRadar(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_RADAR; i++)
    {
        if(RadarInfo[i][radarValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%0.1f\n",
            str,
            i,
        	RadarInfo[i][radarMaxSpeed]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"������ ������� [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_RADARLIST,DIALOG_STYLE_LIST,strm,str,"�����","�����");
	return 1;
}

stock GotoRadar(playerid,i)
{
	SetPlayerPos(playerid,RadarInfo[i][radarObjX],
    RadarInfo[i][radarObjY],
    RadarInfo[i][radarObjZ]);
	new str[255];
	format(str,sizeof(str),"�� ���������������� � ������ %d (%0.1f)",i,RadarInfo[i][radarMaxSpeed]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:radardelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " �����������: /radardelete [id ������]");
    RadarInfo[i][radarValid]=0;
    DestroyDynamicObject(RadarInfo[i][radarObjID]);
    format(str,sizeof(str),"DELETE FROM radars WHERE id=%d",i);
    mysql_query(MySQL, str, false);
	format(str,sizeof(str),"�� ������� ����� %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:radarzone(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,Float:rad;
    if(sscanf(params, "if",i,rad))
    	return SendClientMessage(playerid, COLOR_GRAD2, " �����������: /radarzone [id ������] [������ �������� ����]");
    RadarInfo[i][radarZoneRad]=rad;
	GetPlayerPos(playerid,RadarInfo[i][radarZoneX],RadarInfo[i][radarZoneY],RadarInfo[i][radarZoneZ]);
    SaveRadar(i);
    new str[128];
    format(str,sizeof(str),"�� ���������� ���� ��� ������ %d, ������ %f",i,RadarInfo[i][radarZoneRad]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
stock OnPlayerRadar(playerid)
{
	new Float:razn;
	if(PlayerTicket[playerid])
	{
	    PlayerRadarDetect[playerid]=0;
	    return 1;
	}
	for(new i=0; i<MAX_RADAR; i++)
	{
		if(RadarInfo[i][radarValid])
		{
		    if(IsPlayerInRangeOfPoint(playerid,RadarInfo[i][radarZoneRad],RadarInfo[i][radarZoneX],RadarInfo[i][radarZoneY],RadarInfo[i][radarZoneZ]))
		    {
				PlayerRadarDetectID[playerid]=i;
		        PlayerRadarDetect[playerid]=3;
		        razn=PlayerInfo[playerid][pSpeed]-RadarInfo[i][radarMaxSpeed];
				if(razn > 60.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,3000);
				else if(razn > 50.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,2500);
				else if(razn > 40.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,2000);
				else if(razn > 30.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,1500);
				else if(razn > 20.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,700);
				else if(razn > 10.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,300);
		        return 1;
		    }
		    else if(PlayerInfo[playerid][pCarRadarDetector])
		    {
				if(IsPlayerInRangeOfPoint(playerid,RadarInfo[i][radarZoneRad]*5,RadarInfo[i][radarZoneX],RadarInfo[i][radarZoneY],RadarInfo[i][radarZoneZ]))
				{
					PlayerRadarDetectID[playerid]=i;
				    PlayerRadarDetect[playerid]=2;
				    PlayerPlaySound(playerid, 5201, 0.0, 0.0, 0.0);
				    return 1;
				}
				else if(IsPlayerInRangeOfPoint(playerid,RadarInfo[i][radarZoneRad]*10,RadarInfo[i][radarZoneX],RadarInfo[i][radarZoneY],RadarInfo[i][radarZoneZ]))
				{
					PlayerRadarDetectID[playerid]=i;
				   	PlayerRadarDetect[playerid]=1;
				   	PlayerPlaySound(playerid, 5201, 0.0, 0.0, 0.0);
				   	return 1;
				}
			}
		}
	}
	PlayerRadarDetect[playerid]=0;
	return 1;
}

stock GivePlayerSpeedTicket(playerid,Float:maxspeed,Float:razn,money)
{
	new str[255];
	PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);
	format(str,sizeof(str),"[�������������� ���������]{FFFF00} �� ������ �� �������������� �������� �����, � ������ ����� ������� %d $",money);
	SendClientMessage(playerid, COLOR_WHITE, str);
	format(str,sizeof(str),"[�������������� ���������]{FFFF00} ������������ �������� �� ������ ������� - %0.1f mph, ���������� %0.1f mph",maxspeed,razn);
	SendClientMessage(playerid, COLOR_WHITE, str);
	oGivePlayerMoney(playerid,-money);
	PlayerTicket[playerid]=60;
	return 1;
}
