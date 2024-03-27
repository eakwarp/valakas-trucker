
enum propinfo
{
	propValid,
	propName[64],
	Float:propX,
	Float:propY,
	Float:propZ,
};
new PropInfo[MAX_PROPS][propinfo];
stock LoadProp(i)
{
    new query[255];
	format(query,sizeof(query),"SELECT propName, propX, propY, propZ FROM props WHERE id=%d",i);
	mysql_tquery(MySQL, query, "SQL_LoadProp", "d", i);
	return 1;
}
forward SQL_LoadProp(i);
public SQL_LoadProp(i)
{
	new rows;
	cache_get_row_count(rows);
	if(rows>0)
	{
		//sscanf(Field,"p<|>s[64]fff",

		cache_get_value_name(0,"propName",PropInfo[i][propName],64);
        cache_get_value_name_float(0,"propX",PropInfo[i][propX]);
        cache_get_value_name_float(0,"propY",PropInfo[i][propY]);
        cache_get_value_name_float(0,"propZ",PropInfo[i][propZ]);
		PropInfo[i][propValid]=1;
	}
	else
	    PropInfo[i][propValid]=0;
	return 1;
}
stock PropInit()
{
    for(new i=0; i<MAX_PROPS; i++)
        LoadProp(i);
    return 1;
}
stock SaveProp(i)
{
	if(PropInfo[i][propValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE props SET propName='%s', propX='%f', propY='%f', propZ='%f' WHERE id=%d",
		PropInfo[i][propName],
        PropInfo[i][propX],
        PropInfo[i][propY],
        PropInfo[i][propZ],
		i);
		mysql_query(MySQL, query, false);
	}
	return 1;
}

COMMAND:propshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowProp(playerid,0,29);
    return 1;
}

stock ShowProp(playerid,startid,endid)
{
	new str[4096],bit;
	for(new i=startid; i<MAX_PROPS; i++)
    {
        if(PropInfo[i][propValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%s\n",
            str,
            i,
        	PropInfo[i][propName]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список бизнессов [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_PROPLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoProp(playerid,i)
{
	SetPlayerPos(playerid,PropInfo[i][propX],PropInfo[i][propY],PropInfo[i][propZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к бизнессу %d (%s)",i,PropInfo[i][propName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:propcreate(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    if(isnull(params))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /propcreate [название предприятия]");
    for(new i=0; i<MAX_PROPS; i++)
    {
        if(!PropInfo[i][propValid])
        {
			new query[255];
		    new str[128];
		    GetPlayerPos(playerid,PropInfo[i][propX],PropInfo[i][propY],PropInfo[i][propZ]);
		    format(query,sizeof(query),"INSERT INTO props SET propName=' %s', propX='%f', propY='%f', propZ='%f', id=%d",
			params,
	        PropInfo[i][propX],
	        PropInfo[i][propY],
	        PropInfo[i][propZ],
	        i);
	        mysql_query(MySQL, query, false);
	        LoadProp(i);
		    format(str,sizeof(str),"Вы создали предприятие %s под id %d",PropInfo[i][propName],i);
		    SendClientMessage(playerid, COLOR_GRAD2, str);
		    return 1;
		}
	}
	return 1;
}
COMMAND:propsetname(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,strl[64];
    if (sscanf(params, "is[64]",i,strl))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /propsetname [id предприятия] [название предприятия]");
    format(PropInfo[i][propName],64," %s",strl);
    SaveProp(i);
    new str[128];
    format(str,sizeof(str),"Вы установили имя предприятия %d - %s",i,PropInfo[i][propName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:propsetpos(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /propsetpos [id предприятия]");
    GetPlayerPos(playerid,PropInfo[i][propX],PropInfo[i][propY],PropInfo[i][propZ]);
    SaveProp(i);
    new str[128];
    format(str,sizeof(str),"Вы установили позицию предприятия %d ( %s )",i,PropInfo[i][propName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}