
stock LoadHotel(i)
{
    new query[255];
	format(query,sizeof(query),"SELECT hotelPrice, hotelEnX, hotelEnY, hotelEnZ, hotelInt, hotelName FROM holels WHERE id=%d",i);
	mysql_tquery(MySQL, query, "SQL_LoadHotel", "d", i);
	return 1;
}
forward SQL_LoadHotel(i);
public SQL_LoadHotel(i)
{
	new rows;
	cache_get_row_count(rows);
	if(rows>0)
	{
		//sscanf(Field,"p<|>dfffds[64]",
		cache_get_value_name_int(0,"hotelPrice",HotelInfo[i][hotelPrice]);
		cache_get_value_name_float(0,"hotelEnX",HotelInfo[i][hotelEnX]);
		cache_get_value_name_float(0,"hotelEnY",HotelInfo[i][hotelEnY]);
		cache_get_value_name_float(0,"hotelEnZ",HotelInfo[i][hotelEnZ]);
		cache_get_value_name_int(0,"hotelInt",HotelInfo[i][hotelInt]);
		cache_get_value_name(0,"hotelName",HotelInfo[i][hotelName],64);
	    HotelInfo[i][hotelValid]=1;
	    HotelLabel[i]=CreateDynamic3DTextLabel(HotelInfo[i][hotelName], COLOR_GREEN, HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ], 15.0);
		HotelPickup[i]=CreateDynamicPickup(19135,2,HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ]);
		HotelIcon[i]=CreateDynamicMapIcon(HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ],32, -1,-1,-1, -1, 250.0);
 	}
	else
	    HotelInfo[i][hotelValid]=0;
	return 1;
}
stock HotelInit()
{
    for(new i=0; i<MAX_HOTEL; i++)
        LoadHotel(i);
	return 1;
}
stock SaveHotel(i)
{
    if(HotelInfo[i][hotelValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE holels SET hotelPrice=%d, hotelEnX='%f', hotelEnY='%f', hotelEnZ='%f', hotelInt=%d, hotelName='%s' WHERE id=%d",
		HotelInfo[i][hotelPrice],
		HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ],
		HotelInfo[i][hotelInt],
		HotelInfo[i][hotelName],
		i);
		mysql_query(MySQL, query, false);
		DestroyDynamic3DTextLabel(HotelLabel[i]);
		HotelLabel[i]=CreateDynamic3DTextLabel(HotelInfo[i][hotelName], COLOR_GREEN, HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ], 15.0);
		DestroyDynamicPickup(HotelPickup[i]);
		HotelPickup[i]=CreateDynamicPickup(19135,2,HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ]);
		DestroyDynamicMapIcon(HotelIcon[i]);
		HotelIcon[i]=CreateDynamicMapIcon(HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ],32, -1,-1,-1, -1, 250.0);
	}
	return 1;
}
stock CreateHotel(playerid,price,interior,name[])
{
    for(new i=0; i<MAX_HOTEL; i++)
    {
        if(!HotelInfo[i][hotelValid])
		{
		    new query[255];
		    GetPlayerPos(playerid,HotelInfo[i][hotelEnX],HotelInfo[i][hotelEnY],HotelInfo[i][hotelEnZ]);
	    	format(query,sizeof(query),"INSERT INTO holels SET id=%d, hotelPrice=%d, hotelEnX='%f', hotelEnY='%f', hotelEnZ='%f', hotelInt=%d, hotelName=' %s'",
			i,
			price,
            HotelInfo[i][hotelEnX],
			HotelInfo[i][hotelEnY],
			HotelInfo[i][hotelEnZ],
			interior,
			name);
			mysql_query(MySQL, query, false);
			LoadHotel(i);
			return i;
		}
    }
	return 1;
}
enum hotelineriorinfo
{
	Float:hiX,
	Float:hiY,
	Float:hiZ,
	hiInt,
};
new HotelInteriorInfo[][hotelineriorinfo]=
{
	{2233.8000488281,-1115.0,1050.9000244141,5}
};
COMMAND:hotelcreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new interior,price,name[64];
    if (sscanf(params, "iis[64]",interior,price,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /holelcreate [id интерьера] [цена за отдых] [название отеля]");
	if(interior>=sizeof(HotelInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер отеля.");
	new i= CreateHotel(playerid,price,interior,name);
	new str[255];
	format(str,sizeof(str),"Вы создали отель %d, цена за отдых %d, номер интерьера %d, навазние %s",i,price,interior,name);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:hotelshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowHotel(playerid,0,29);
    return 1;
}

stock ShowHotel(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_HOTEL; i++)
    {
        if(HotelInfo[i][hotelValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%s\n",
            str,
            i,
        	HotelInfo[i][hotelName]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список отелей [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_HOTELLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoHotel(playerid,i)
{
	SetPlayerPos(playerid,HotelInfo[i][hotelEnX],
	HotelInfo[i][hotelEnY],
	HotelInfo[i][hotelEnZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к отелю %d (%s)",i,HotelInfo[i][hotelName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:hoteldelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /hoteldelete [id отеля]");
    HotelInfo[i][hotelValid]=0;
    DestroyDynamic3DTextLabel(HotelLabel[i]);
	DestroyDynamicPickup(HotelPickup[i]);
	DestroyDynamicMapIcon(HotelIcon[i]);
    format(str,sizeof(str),"DELETE FROM hotels WHERE id=%d",i);
    mysql_query(MySQL, str, false);
	format(str,sizeof(str),"Вы удалили отель %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:hotelsetname(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
	new i,name[64];
    if (sscanf(params, "is[64]",i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /hotelsetname [id отеля] [название отеля]");
    format(HotelInfo[i][hotelName],64,"%s",name);
    SaveHotel(i);
	new str[255];
	format(str,sizeof(str),"Вы установили отелю %d, навазние %s",i,HotelInfo[i][hotelName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:hotelsetprice(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,price;
    if (sscanf(params, "ii",i,price))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /hotelsetprice [id отеля] [цена за отдых]");
    HotelInfo[i][hotelPrice]=price;
    SaveHotel(i);
    new str[255];
	format(str,sizeof(str),"Вы установили отелю %d, цена за отдых %d",i,HotelInfo[i][hotelPrice]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:hotelsetinterior(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,interior;
    if (sscanf(params, "ii",i,interior))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /hotelsetinterior [id отеля] [интерьер]");
    if(interior>=sizeof(HotelInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер отеля.");
    HotelInfo[i][hotelInt]=interior;
    SaveHotel(i);
    new str[255];
	format(str,sizeof(str),"Вы установили отелю %d, интерьер %d",i,HotelInfo[i][hotelInt]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}

COMMAND:hotel(playerid,params[])
{
    if(PlayerInfo[playerid][pLocal]!=1)
        return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в отеле.");
    StartShowLbt(playerid,0,0);
    InHotel[playerid]=GetPlayerVirtualWorld(playerid);
    TogglePlayerControllable(playerid,0);
    new str[255];
    format(str,sizeof(str),"Вы отдыхаете, остаток усталости %0.1f",PlayerInfo[playerid][pFatigue]);
	ShowPlayerDialog(playerid,DIALOG_HOTEL,DIALOG_STYLE_MSGBOX,"Отель",str,"Встать","");
	return 1;
}
stock HotelExitFor(playerid)
{
    for(new i=0; i<MAX_HOTEL; i++)
    {
        if(HotelInfo[i][hotelValid])
        {
            if(IsPlayerInRangeOfPoint(playerid,2.0,HotelInfo[i][hotelEnX],HotelInfo[i][hotelEnY],HotelInfo[i][hotelEnZ]))
            {
                PlayerInfo[playerid][pLocal]=1;
                SetPlayerPos(playerid,HotelInteriorInfo[HotelInfo[i][hotelInt]][hiX],
                HotelInteriorInfo[HotelInfo[i][hotelInt]][hiY],
                HotelInteriorInfo[HotelInfo[i][hotelInt]][hiZ]);
                SetPlayerInterior(playerid,HotelInteriorInfo[HotelInfo[i][hotelInt]][hiInt]);
                SetPlayerVirtualWorld(playerid,i);
                SendClientMessage(playerid,COLOR_WHITE," ИСПОЛЬЗУЙТЕ: {FFFF00}/hotel - {FFFFFF}чтобы отдохнуть.");
                return 1;
            }
        }
    }
    return 0;
}
stock HotelExitTimer(playerid)
{
    new i=GetPlayerVirtualWorld(playerid);
    if(IsPlayerInRangeOfPoint(playerid,2.0,HotelInteriorInfo[HotelInfo[i][hotelInt]][hiX],
    HotelInteriorInfo[HotelInfo[i][hotelInt]][hiY],
    HotelInteriorInfo[HotelInfo[i][hotelInt]][hiZ]))
    {
        PlayerInfo[playerid][pLocal]=-1;
        SetPlayerPos(playerid,HotelInfo[i][hotelEnX],HotelInfo[i][hotelEnY],HotelInfo[i][hotelEnZ]);
        SetPlayerInterior(playerid,0);
        SetPlayerVirtualWorld(playerid,0);
        return 1;
    }
    return 0;
}