#define MAX_ATM 32
enum atminfo
{
	atmValid,
	Float:atmX,
	Float:atmY,
	Float:atmZ,
	Float:atmRot,
	atmObject,//не сохранять
	atmIcon//не сохранять
};
new AtmInfo[MAX_ATM][atminfo];

stock LoadAtm(i)
{
    new query[255];
	format(query,sizeof(query),"SELECT atmX, atmY, atmZ, atmRot FROM atm WHERE id=%d",i);
	mysql_tquery(MySQL, query, "SQL_LoadAtm", "d", i);
	return 1;
}
forward SQL_LoadAtm(i);
public SQL_LoadAtm(i)
{
	new rows;
	cache_get_row_count(rows);
	if(rows>0)
	{
		//sscanf(Field,"p<|>ffff",
		cache_get_value_name_float(0,"atmX",AtmInfo[i][atmX]);
		cache_get_value_name_float(0,"atmY",AtmInfo[i][atmY]);
		cache_get_value_name_float(0,"atmZ",AtmInfo[i][atmZ]);
		cache_get_value_name_float(0,"atmRot",AtmInfo[i][atmRot]);
		AtmInfo[i][atmValid]=1;
		AtmInfo[i][atmObject] = CreateDynamicObject(2942,AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ],0.0,0.0,AtmInfo[i][atmRot]);
		AtmInfo[i][atmIcon] = CreateDynamicMapIcon(AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ], 52, -1,-1,-1, -1, 250.0);
	}
	else
	    AtmInfo[i][atmValid]=0;
	return 1;
}
stock AtmInit()
{
    for(new i=0; i<MAX_ATM; i++)
        LoadAtm(i);
    return 1;
}
stock SaveAtm(i)
{
	if(AtmInfo[i][atmValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE atm SET atmX='%f', atmY='%f', atmZ='%f', atmRot='%f' WHERE id=%d",
		AtmInfo[i][atmX],
		AtmInfo[i][atmY],
		AtmInfo[i][atmZ],
		AtmInfo[i][atmRot],
		i);
		mysql_query(MySQL, query, false);
		DestroyDynamicObject(AtmInfo[i][atmObject]);
		DestroyDynamicMapIcon(AtmInfo[i][atmIcon]);
		AtmInfo[i][atmObject] = CreateDynamicObject(2942,AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ],0.0,0.0,AtmInfo[i][atmRot]);
		AtmInfo[i][atmIcon] = CreateDynamicMapIcon(AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ], 52, -1,-1,-1, -1, 250.0);
	}
	return 1;
}

stock CreateAtm(playerid)
{
    for(new i=0; i<MAX_ATM; i++)
    {
        if(!AtmInfo[i][atmValid])
		{
		    new query[255];
		    new Float:pos[4];
		    GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
		    GetPlayerFacingAngle(playerid,pos[3]);
	    	format(query,sizeof(query),"INSERT INTO atm SET atmX='%f', atmY='%f', atmZ='%f', atmRot='%f', id=%d",
			pos[0],
			pos[1],
			pos[2]-0.5,
			pos[3],
			i);
			mysql_query(MySQL, query, false);
			LoadAtm(i);
			return i;
		}
    }
	return 1;
}
COMMAND:atmcreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
	new i= CreateAtm(playerid);
	new str[255];
	format(str,sizeof(str),atmtext1,i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:atmshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowAtm(playerid,0,29);
    return 1;
}

stock ShowAtm(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_ATM; i++)
    {
        if(AtmInfo[i][atmValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d\n",
            str,
            i);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),atmtext2,startid,endid);
    ShowPlayerDialog(playerid,DIALOG_ATMLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoAtm(playerid,i)
{
	SetPlayerPos(playerid,AtmInfo[i][atmX],
	AtmInfo[i][atmY],
	AtmInfo[i][atmZ]);
	new str[255];
	format(str,sizeof(str),atmtext3,i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:atmdelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, atmtext4);
   	AtmInfo[i][atmValid]=0;
    DestroyDynamicObject(AtmInfo[i][atmObject]);
	DestroyDynamicMapIcon(AtmInfo[i][atmIcon]);
    format(str,sizeof(str),"DELETE FROM atm WHERE id=%d",i);
    mysql_query(MySQL, str, false);
	format(str,sizeof(str),atmtext5,i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
stock IsPlayerInAtm(playerid)
{
    for(new i=0; i<MAX_ATM; i++)
    {
        if(AtmInfo[i][atmValid])
        {
	        if(IsPlayerInRangeOfPoint(playerid,3.0,AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ]))
		    	return 1;
        }
    }
    return 0;
}