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
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT atmX, atmY, atmZ, atmRot FROM atm WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>ffff",
		AtmInfo[i][atmX],
		AtmInfo[i][atmY],
		AtmInfo[i][atmZ],
		AtmInfo[i][atmRot]);
		AtmInfo[i][atmValid]=1;
		AtmInfo[i][atmObject] = CreateDynamicObject(2942,AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ],0.0,0.0,AtmInfo[i][atmRot]);
		AtmInfo[i][atmIcon] = CreateDynamicMapIcon(AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ], 52, -1,-1,-1, -1, 250.0);
	}
	else
	    AtmInfo[i][atmValid]=0;
	mysql_free_result();
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
		mysql_query(query);
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
			mysql_query(query);
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
	format(str,sizeof(str),"Вы создали банкомат %d",i);
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
	format(strm,sizeof(strm),"Список забегаловок [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_ATMLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoAtm(playerid,i)
{
	SetPlayerPos(playerid,AtmInfo[i][atmX],
	AtmInfo[i][atmY],
	AtmInfo[i][atmZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к банкомату %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:atmdelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /atmdelete [id банкомата]");
   	AtmInfo[i][atmValid]=0;
    DestroyDynamicObject(AtmInfo[i][atmObject]);
	DestroyDynamicMapIcon(AtmInfo[i][atmIcon]);
    format(str,sizeof(str),"DELETE FROM atm WHERE id=%d",i);
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили банкомат %d",i);
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