enum gasinfo
{
	gasValid,
	Float:gasX,
	Float:gasY,
	Float:gasZ,
}
new GasInfo[MAX_GAS][gasinfo];
new GasPickup[MAX_GAS];
new Text3D:GasLabel[MAX_GAS];
new GasIcon[MAX_GAS];
stock LoadGas(i)
{
	new query[255];
	format(query,sizeof(query),"SELECT gasX, gasY, gasZ FROM gas WHERE id=%d",i);
	mysql_tquery(MySQL, query, "SQL_LoadGas", "d", i);
	return 1;
}
forward SQL_LoadGas(i);
public SQL_LoadGas(i)
{
	new rows;
	cache_get_row_count(rows);
	if(rows>0)
	{
		//sscanf(Field,"p<|>fff",
		cache_get_value_name_float(0,"gasX",GasInfo[i][gasX]);
		cache_get_value_name_float(0,"gasY",GasInfo[i][gasY]);
		cache_get_value_name_float(0,"gasZ",GasInfo[i][gasZ]);
	    GasInfo[i][gasValid]=1;
	    GasLabel[i]=CreateDynamic3DTextLabel("Заправка\nНажмите гудок [H]", COLOR_GREEN,GasInfo[i][gasX], GasInfo[i][gasY], GasInfo[i][gasZ], 15.0);
		GasPickup[i]=CreateDynamicPickup(1676,2,GasInfo[i][gasX], GasInfo[i][gasY], GasInfo[i][gasZ]);
		GasIcon[i]=CreateDynamicMapIcon(GasInfo[i][gasX], GasInfo[i][gasY], GasInfo[i][gasZ],55, -1,-1,-1, -1, 250.0);
	}
	else
	    GasInfo[i][gasValid]=0;
	return 1;
}
stock GasInit()
{
    for(new i=0; i<MAX_GAS; i++)
        LoadGas(i);
	return 1;
}
stock SaveGas(i)
{
    if(GasInfo[i][gasValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE gas SET gasX='%f', gasY='%f', gasZ='%f' WHERE id=%d",
		GasInfo[i][gasX],
		GasInfo[i][gasY],
		GasInfo[i][gasZ],
		i);
		mysql_query(MySQL, query, false);
		DestroyDynamic3DTextLabel(GasLabel[i]);
		GasLabel[i]=CreateDynamic3DTextLabel("Заправка\nНажмите гудок [H]", COLOR_GREEN,GasInfo[i][gasX], GasInfo[i][gasY], GasInfo[i][gasZ], 15.0);
		DestroyDynamicPickup(GasPickup[i]);
		GasPickup[i]=CreateDynamicPickup(1676,2,GasInfo[i][gasX], GasInfo[i][gasY], GasInfo[i][gasZ]);
		DestroyDynamicMapIcon(GasIcon[i]);
		GasIcon[i]=CreateDynamicMapIcon(GasInfo[i][gasX], GasInfo[i][gasY], GasInfo[i][gasZ],55, -1,-1,-1, -1, 250.0);
	}
	return 1;
}

COMMAND:gasshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowGas(playerid,0,29);
    return 1;
}

stock ShowGas(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_GAS; i++)
    {
        if(GasInfo[i][gasValid])
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
	format(strm,sizeof(strm),"Список заправок [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_GASLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoGas(playerid,i)
{
	SetPlayerPos(playerid,GasInfo[i][gasX],GasInfo[i][gasY],GasInfo[i][gasZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к заправке %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:gascreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    for(new i=0; i<MAX_GAS; i++)
    {
        if(!GasInfo[i][gasValid])
		{
		    GetPlayerPos(playerid,GasInfo[i][gasX],
			GasInfo[i][gasY],
			GasInfo[i][gasZ]);
            new query[255];
		    format(query,sizeof(query),"INSERT INTO gas SET gasX='%f', gasY='%f', gasZ='%f', id=%d",
			GasInfo[i][gasX],
			GasInfo[i][gasY],
			GasInfo[i][gasZ],
			i);
			mysql_query(MySQL, query, false);
			LoadGas(i);
			new str[128];
			format(str,sizeof(str),"Вы создали заправку %d",i);
			SendClientMessage(playerid,COLOR_GRAD2,str);
		    return 1;
		}
    }
    return 1;
}
COMMAND:gassetpos(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /gassetpos [id заправки]");
	GetPlayerPos(playerid,GasInfo[i][gasX],
	GasInfo[i][gasY],
	GasInfo[i][gasZ]);
	SaveGas(i);
	new str[255];
	format(str,sizeof(str),"Вы установили позицию заправки %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:gasdelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /gasdelete [id заправки]");
    GasInfo[i][gasValid]=0;
    DestroyDynamic3DTextLabel(GasLabel[i]);
	DestroyDynamicPickup(GasPickup[i]);
	DestroyDynamicMapIcon(GasIcon[i]);
    format(str,sizeof(str),"DELETE FROM gas WHERE id=%d",i);
    mysql_query(MySQL, str, false);
	format(str,sizeof(str),"Вы удалили заправку %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:usereservefuel(playerid,params[])
{
	if(Gas[PlayerInfo[playerid][pCarID]]<1.0)
	{
		if(UsedFillCan[playerid]==0)
		{
			Gas[PlayerInfo[playerid][pCarID]]=5.0;
			UsedFillCan[playerid]=1;
			SendClientMessage(playerid, COLOR_GRAD2, "Вы использовали топливо из канистры завалявшейся в кузове");
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GRAD2, "Вы уже использовали канистру, увы, это доступно только один раз за игровую сессию");
		}
	}
	return 1;
}
COMMAND:fillplayercar(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin]<1)return 1;
	new i;
	if (sscanf(params, "u",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /fillplayercar [id игрока]");
	Gas[PlayerInfo[i][pCarID]]=100.0;
	new str[144];
	format(str,sizeof(str),"Машина игрока %s заправлена",oGetPlayerName(playerid));
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:givemyfuel(playerid,params[])
{
	new Float:v1pos[3];
	GetVehiclePos(PlayerInfo[playerid][pCarID],v1pos[0],v1pos[1],v1pos[2]);
	if(!IsPlayerInRangeOfPoint(playerid,5.0,v1pos[0],v1pos[1],v1pos[2]))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы слишком далеко от вашей машины");
	new giveplayerid,Float:lit;
    if(sscanf(params, "uf",giveplayerid,lit))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /givemyfuel [id игрока/часть имени] [объем]");
	new Float:v2pos[3];
	GetVehiclePos(PlayerInfo[giveplayerid][pCarID],v2pos[0],v2pos[1],v2pos[2]);
	if(!IsPlayerInRangeOfPoint(playerid,5.0,v2pos[0],v2pos[1],v2pos[2]))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы слишком далеко от машины человека, которому вы хотите отлить бензин");
	if(lit>Gas[PlayerInfo[playerid][pCarID]])
	    return SendClientMessage(playerid, COLOR_GRAD2, "У вас в баке нет столько топлива");
	if(PlayerInfo[giveplayerid][pCarFuelTank])
	{
	    if(lit+Gas[PlayerInfo[giveplayerid][pCarID]] > 200.0)
            return SendClientMessage(playerid, COLOR_GRAD2, "В баке машины, в которую вы сливаете бнзин нет столько места");
	}
	else
	{
		if(lit+Gas[PlayerInfo[giveplayerid][pCarID]] > 100.0)
	    	return SendClientMessage(playerid, COLOR_GRAD2, "В баке машины, в которую вы сливаете бнзин нет столько места");
	}
	new str[255];
	Gas[PlayerInfo[playerid][pCarID]]-=lit;
	Gas[PlayerInfo[giveplayerid][pCarID]]+=lit;
	format(str,sizeof(str),"отлил %0.1f литров бензина из бензобака %s, в бензобак %s",lit,CarName[PlayerInfo[playerid][pCarModel]-400],CarName[PlayerInfo[giveplayerid][pCarModel]-400]);
	Me(playerid, str,30.0);
	return 1;
}
stock StartFill(playerid)
{
    if(GetPlayerState(playerid)==PLAYER_STATE_DRIVER)
    {
		for(new i=0; i<MAX_GAS; i++)
	    {
	        if(GasInfo[i][gasValid])
			{
			    if(IsPlayerInRangeOfPoint(playerid,8.0,GasInfo[i][gasX],GasInfo[i][gasY],GasInfo[i][gasZ]))
			    {
                    //new carid=GetPlayerVehicleID(playerid);
					//Fill(playerid);
					InFill[playerid]=1;
					SendClientMessage(playerid,COLOR_GREEN,"Заправка начата");
					return 1;
			    }
			}
		}
	}
	return 1;
}
stock Fill(playerid)
{
    if(GetPlayerState(playerid)==PLAYER_STATE_DRIVER)
    {
		for(new i=0; i<MAX_GAS; i++)
	    {
	        if(GasInfo[i][gasValid])
			{
			    if(IsPlayerInRangeOfPoint(playerid,8.0,GasInfo[i][gasX],GasInfo[i][gasY],GasInfo[i][gasZ]))
			    {
			        new carid=GetPlayerVehicleID(playerid);
			        new engine,lights,alarm,doors,bonnet,boot,objective;
                    GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
					if(engine)
					{
					    InFill[playerid]=0;
						return SendClientMessage(playerid,COLOR_GREEN,"Заглушите двигатель (/engine)");
				    }
        			if((!PlayerInfo[playerid][pCarFuelTank] && Gas[carid]<100.0) || (PlayerInfo[playerid][pCarFuelTank] && Gas[carid]<200.0))
        			{
				        oGivePlayerMoney(playerid, -3);
				        if(PlayerInfo[playerid][pCarNeck])
				            Gas[carid]+=1.4;
						else
				        	Gas[carid]+=1.0;
                    }
                    else
                    {
                        InFill[playerid]=0;
                        SendClientMessage(playerid,COLOR_GREEN,"Бак полностью заправлен");
                    }
                    return 1;
                }
            }
        }
    }
    InFill[playerid]=0;
    return 1;
}
