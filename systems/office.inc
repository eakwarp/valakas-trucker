enum officeinfo
{
	officeValid,
	officeName[64],
	officeOwned,
	officeOwner[MAX_PLAYER_NAME],
	officeCompany,
	Float:officeX,
	Float:officeY,
	Float:officeZ,
	officeInt,
	officeLocked,
	officePrice,
};
new OfficeInfo[MAX_OFFICE][officeinfo];
new Text3D:OfficeLabel[MAX_OFFICE];
new OfficePickup[MAX_OFFICE];
stock LoadOffice(i)
{
    new query[255];
	format(query,sizeof(query),"SELECT officeName, officeOwned, officeOwner, officeCompany, officeX, officeY, officeZ, officeInt, officeLocked, officePrice FROM office WHERE id=%d",i);
	mysql_tquery(MySQL, query, "SQL_LoadOffice", "d", i);
	return 1;
}
forward SQL_LoadOffice(i);
public SQL_LoadOffice(i)
{
	new rows;
	cache_get_row_count(rows);
	if(rows>0)
	{
		//sscanf(Field,"p<|>s[64]is[24]ifffii",
		cache_get_value_name(0,"officeName",OfficeInfo[i][officeName],64);
		cache_get_value_name_int(0,"officeOwned",OfficeInfo[i][officeOwned]);
		cache_get_value_name(0,"officeOwner",OfficeInfo[i][officeOwner],24);
		cache_get_value_name_int(0,"officeCompany",OfficeInfo[i][officeCompany]);
		cache_get_value_name_float(0,"officeX",OfficeInfo[i][officeX]);
		cache_get_value_name_float(0,"officeY",OfficeInfo[i][officeY]);
		cache_get_value_name_float(0,"officeZ",OfficeInfo[i][officeZ]);
		cache_get_value_name_int(0,"officeInt",OfficeInfo[i][officeInt]);
		cache_get_value_name_int(0,"officeLocked",OfficeInfo[i][officeLocked]);
		cache_get_value_name_int(0,"officePrice",OfficeInfo[i][officePrice]);
		OfficeInfo[i][officeValid]=1;
		OfficeLabel[i]=CreateDynamic3DTextLabel(OfficeInfo[i][officeName], COLOR_GREEN, OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ], 15.0);
		OfficePickup[i]=CreateDynamicPickup(19135,2,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]);
	}
	else
	    OfficeInfo[i][officeValid]=0;
	return 1;
}
stock OfficeInit()
{
    for(new i=0; i<MAX_OFFICE; i++)
        LoadOffice(i);
    return 1;
}
stock SaveOffice(i)
{
	if(OfficeInfo[i][officeValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE office SET officeName='%s', officeOwned=%d, officeOwner='%s', officeCompany=%d, officeX='%f', officeY='%f', officeZ='%f', officeInt=%d, officeLocked=%d, officePrice=%d WHERE id=%d",
		OfficeInfo[i][officeName],
		OfficeInfo[i][officeOwned],
		OfficeInfo[i][officeOwner],
		OfficeInfo[i][officeCompany],
		OfficeInfo[i][officeX],
		OfficeInfo[i][officeY],
		OfficeInfo[i][officeZ],
		OfficeInfo[i][officeInt],
		OfficeInfo[i][officeLocked],
		OfficeInfo[i][officePrice],
		i);
		mysql_query(MySQL, query, false);
		DestroyDynamic3DTextLabel(OfficeLabel[i]);
		DestroyDynamicPickup(OfficePickup[i]);
		OfficeLabel[i]=CreateDynamic3DTextLabel(OfficeInfo[i][officeName], COLOR_GREEN, OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ], 15.0);
		OfficePickup[i]=CreateDynamicPickup(19135,2,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]);

	}
	return 1;
}

stock CreateOffice(playerid,interior,name[],price)
{
    for(new i=0; i<MAX_OFFICE; i++)
    {
        if(!OfficeInfo[i][officeValid])
		{
		    new query[255];
		    GetPlayerPos(playerid,OfficeInfo[i][officeX],
			OfficeInfo[i][officeY],
			OfficeInfo[i][officeZ]);
	    	format(query,sizeof(query),"INSERT INTO office SET id=%d, officeName='%s', officeX='%f', officeY='%f', officeZ='%f', officeInt=%d, officePrice=%d",
			i,
			name,
			OfficeInfo[i][officeX],
			OfficeInfo[i][officeY],
			OfficeInfo[i][officeZ],
			interior,
			price);
			mysql_query(MySQL, query, false);
			LoadOffice(i);
			return i;
		}
    }
	return 1;
}
enum officeineriorinfo
{
	Float:oiX,
	Float:oiY,
	Float:oiZ,
	oiInt,
};
new OfficeInteriorInfo[][officeineriorinfo]=
{
	{0.0,0.0,0.0,0}
};
COMMAND:officecreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new interior,price,name[64];
    if (sscanf(params, "iis[64]",interior,price,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /officecreate [id интерьера] [цена] [название офиса]");
	if(interior>=sizeof(OfficeInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер офиса.");
	new i= CreateOffice(playerid,interior,name,price);
	new str[255];
	format(str,sizeof(str),"Вы создали офис %d, номер интерьера %d, название %s",i,interior,name);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:officeshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowOffice(playerid,0,29);
    return 1;
}

stock ShowOffice(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_OFFICE; i++)
    {
        if(OfficeInfo[i][officeValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%s\n",
            str,
            i,
        	OfficeInfo[i][officeName]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список офисов [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_OFFICELIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoOffice(playerid,i)
{
	SetPlayerPos(playerid,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к офису %d (%s)",i,OfficeInfo[i][officeName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:officedelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /officedelete [id офиса]");
    OfficeInfo[i][officeValid]=0;
    DestroyDynamic3DTextLabel(OfficeLabel[i]);
	DestroyDynamicPickup(OfficePickup[i]);
    format(str,sizeof(str),"DELETE FROM office WHERE id=%d",i);
    mysql_query(MySQL, str, false);
	format(str,sizeof(str),"Вы удалили офис %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:officesetname(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,name[64];
    if (sscanf(params, "is[64]",i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /officesetname [id офиса] [название офиса]");
    format(OfficeInfo[i][officeName],64," %s",name);
	SaveOffice(i);
    new str[255];
	format(str,sizeof(str),"Вы изменили название офиса %d, на %s",i,OfficeInfo[i][officeName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:officesetint(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,interior;
    if (sscanf(params, "ii",i,interior))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /officesetint [id офиса] [интерьер]");
    if(interior>=sizeof(OfficeInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер офиса.");
    OfficeInfo[i][officeInt]=interior;
	SaveFood(i);
    new str[255];
	format(str,sizeof(str),"Вы изменили название офиса %d, на %s",i,OfficeInfo[i][officeInt]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
stock OfficeExitFor(playerid)
{
    for(new i=0; i<MAX_OFFICE; i++)
    {
        if(OfficeInfo[i][officeValid])
        {
            if(IsPlayerInRangeOfPoint(playerid,2.0,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]))
            {
                PlayerInfo[playerid][pLocal]=4;
                SetPlayerPos(playerid,OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiX],
                OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiY],
                OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiZ]);
                SetPlayerInterior(playerid,OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiInt]);
                SetPlayerVirtualWorld(playerid,i);
                return 1;
            }
        }
    }
    return 0;
}

stock OfficeExitTimer(playerid)
{
    new i=GetPlayerVirtualWorld(playerid);
    if(IsPlayerInRangeOfPoint(playerid,2.0,OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiX],
    OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiY],
    OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiZ]))
    {
        PlayerInfo[playerid][pLocal]=-1;
        SetPlayerPos(playerid,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]);
        SetPlayerInterior(playerid,0);
        SetPlayerVirtualWorld(playerid,0);
        return 1;
    }
    return 0;
}