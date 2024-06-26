enum mobilestation
{
    mobilestationValid,
	Float:mobilestationX,
	Float:mobilestationY,
	Float:mobilestationZ,
	Float:mobilestationRad,
	mobilestationObject,//�� ���������
}
new MobileStation[MAX_MOBILESTATION][mobilestation];
stock LoadMobileStation(i)
{
    new query[255];
	format(query,sizeof(query),"SELECT mobilestationX, mobilestationY, mobilestationZ, mobilestationRad FROM mobilestations WHERE id=%d",i);
	mysql_tquery(MySQL, query, "SQL_LoadMS", "d", i);
	return 1;
}
forward SQL_LoadMS(i);
public SQL_LoadMS(i)
{
	new rows;
	cache_get_row_count(rows);
	if(rows>0)
	{
		//sscanf(Field,"p<|>ffff",
		cache_get_value_name_float(0,"mobilestationX",MobileStation[i][mobilestationX]);
		cache_get_value_name_float(0,"mobilestationY",MobileStation[i][mobilestationY]);
		cache_get_value_name_float(0,"mobilestationZ",MobileStation[i][mobilestationZ]);
		cache_get_value_name_float(0,"mobilestationRad",MobileStation[i][mobilestationRad]);
	    MobileStation[i][mobilestationValid]=1;
	   	MobileStation[i][mobilestationObject]=CreateDynamicObject(3763,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ],0.0,0.0,0.0);
	}
	else
	    MobileStation[i][mobilestationValid]=0;
	return 1;
}
stock MobileStationInit()
{
    for(new i=0; i<MAX_MOBILESTATION; i++)
        LoadMobileStation(i);
	return 1;
}
stock SaveMobileStation(i)
{
    if(MobileStation[i][mobilestationValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE mobilestations SET mobilestationX='%f', mobilestationY='%f', mobilestationZ='%f', mobilestationRad='%f' WHERE id=%d",
		MobileStation[i][mobilestationX],
		MobileStation[i][mobilestationY],
		MobileStation[i][mobilestationZ],
		MobileStation[i][mobilestationRad],
		i);
		DestroyDynamicObject(MobileStation[i][mobilestationObject]);
		MobileStation[i][mobilestationObject]=CreateDynamicObject(3763,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ],0.0,0.0,0.0);
		mysql_query(MySQL, query, false);
	}
	return 1;
}
COMMAND:mobilestationcreate(playerid,params[])
{
    new Float:rad;
    if (sscanf(params, "f",rad))
    	return SendClientMessage(playerid, COLOR_GRAD2, " �����������: /mobilestationcreate [������ �������]");
	if(rad < 10.0|| rad > 1500.0)
	    return SendClientMessage(playerid, COLOR_GRAD2, "������ �� 10 �� 1500");
	for(new i=0; i<MAX_MOBILESTATION; i++)
    {
        if(!MobileStation[i][mobilestationValid])
		{
		    GetPlayerPos(playerid,	MobileStation[i][mobilestationX],
			MobileStation[i][mobilestationY],
			MobileStation[i][mobilestationZ]);
			MobileStation[i][mobilestationRad]=rad;
            new query[255];
		    format(query,sizeof(query),"INSERT INTO mobilestations SET mobilestationX='%f', mobilestationY='%f', mobilestationZ='%f', mobilestationRad='%f', id=%d",
			MobileStation[i][mobilestationX],
			MobileStation[i][mobilestationY],
			MobileStation[i][mobilestationZ]+3.0,
			MobileStation[i][mobilestationRad],
			i);
			mysql_query(MySQL, query, false);
			LoadMobileStation(i);
			new str[128];
			format(str,sizeof(str),"�� ������� ��������� ����� %d, ������ ������� %f",i,rad);
			SendClientMessage(playerid,COLOR_GRAD2,str);
		    return 1;
		}
    }
    return 1;
}

COMMAND:mobilestationshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowMobileStation(playerid,0,29);
    return 1;
}

stock ShowMobileStation(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_RADAR; i++)
    {
        if(MobileStation[i][mobilestationValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%0.1f\n",
            str,
            i,
        	MobileStation[i][mobilestationRad]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"������ ��������� ����� [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_MOBILESTATIONLIST,DIALOG_STYLE_LIST,strm,str,"�����","�����");
	return 1;
}

stock GotoMobileStation(playerid,i)
{
	SetPlayerPos(playerid,MobileStation[i][mobilestationX],
	MobileStation[i][mobilestationY],
	MobileStation[i][mobilestationZ]);
	new str[255];
	format(str,sizeof(str),"�� ���������������� � ��������� ����� %d (%0.1f)",i,MobileStation[i][mobilestationRad]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:mobilestationdelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " �����������: /mobilestationdelete [id �����]");
    MobileStation[i][mobilestationValid]=0;
    DestroyDynamicObject(MobileStation[i][mobilestationObject]);
    format(str,sizeof(str),"DELETE FROM mobilestations WHERE id=%d",i);
    mysql_query(MySQL, str, false);
	format(str,sizeof(str),"�� ������� ��������� ����� %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:mobilestationsetpos(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i, Float:rad;
    if (sscanf(params, "if",i,rad))
    	return SendClientMessage(playerid, COLOR_GRAD2, " �����������: /mobilestationsetpos [id �����] [������ �������]");
    if(rad < 10.0|| rad > 1500.0)
	    return SendClientMessage(playerid, COLOR_GRAD2, "������ �� 10 �� 1500");
	GetPlayerPos(playerid,MobileStation[i][mobilestationX],
	MobileStation[i][mobilestationY],
	MobileStation[i][mobilestationZ]);
	SaveMobileStation(i);
	new str[255];
	format(str,sizeof(str),"�� ���������� ������� ����� %d � �� ������ ������� %f",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

stock GetPlayerClosestMobileStation(playerid)
{
	new id=-1, Float:dist=0.0, Float:mindist=9999.0;
	for(new i=0; i<MAX_MOBILESTATION; i++)
    {
        if(MobileStation[i][mobilestationValid])
		{
		    dist=GetPlayerDistanceFromPoint(playerid,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]);
			if(dist < MobileStation[i][mobilestationRad])
			{
			    if(dist < mindist)
			    {
				    mindist=dist;
				    id=i;
			    }
			}
		}
	}
	return id;
}
stock SignalSetString(playerid)
{
    new str[255];
	switch(Signal[playerid])
	{
	    case -1:
	        str = "~g~signal: ~y~!~b~offline";
	    case 0:
	        str = "~g~signal: ~y~!~b~lost";
	    case 1:
	        str = "~g~signal: ~y~!~b~-";
	    case 2:
	        str = "~g~signal: ~y~!~b~--";
	    case 3:
	        str = "~g~signal: ~y~!~b~---";
	    case 4:
	        str = "~g~signal: ~y~!~b~----";
	    case 5:
	    	str = "~g~signal: ~y~!~b~-----";
	}
	return str;
}
stock GetSignal(playerid)
{
	if(!PlayerInfo[playerid][pPhoneOnline])return -1;
	new i=GetPlayerClosestMobileStation(playerid);
	if(i!=-1)
	{
	    if(IsPlayerInRangeOfPoint(playerid,MobileStation[i][mobilestationRad]/5*1,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]))
            return 5;
		else if(IsPlayerInRangeOfPoint(playerid,MobileStation[i][mobilestationRad]/5*2,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]))
            return 4;
		else if(IsPlayerInRangeOfPoint(playerid,MobileStation[i][mobilestationRad]/5*3,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]))
            return 3;
		else if(IsPlayerInRangeOfPoint(playerid,MobileStation[i][mobilestationRad]/5*4,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]))
            return 2;
		else
   			return 1;
	}
	else
	    return 0;
}
