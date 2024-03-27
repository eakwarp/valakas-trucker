
enum truckstopinfo
{
	tsValid,
	tsName[64],
	Float:tsX,
	Float:tsY,
	Float:tsZ,
	Float:tsRot,
	Float:tsCamX,
	Float:tsCamY,
	Float:tsCamZ,
	Float:tsLabelX,
	Float:tsLabelY,
	Float:tsLabelZ,
};
new TruckStopInfo[MAX_TRUCKSTOPS][truckstopinfo];
new Text3D:TruckStopLabel[MAX_TRUCKSTOPS];
new TruckStopIcon[MAX_TRUCKSTOPS];
stock TruckStopInit()
{
    for(new i=0; i<MAX_TRUCKSTOPS; i++)
        LoadTruckStop(i);
	return 1;
}
stock LoadTruckStop(i)
{
    new query[255],Field[512];
	format(query,sizeof(query),"SELECT tsName, tsX, tsY, tsZ, tsRot, tsCamX, tsCamY, tsCamZ, tsLabelX, tsLabelY, tsLabelZ FROM truckstops WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>s[64]ffffffffff",
		TruckStopInfo[i][tsName],
		TruckStopInfo[i][tsX],
		TruckStopInfo[i][tsY],
		TruckStopInfo[i][tsZ],
		TruckStopInfo[i][tsRot],
		TruckStopInfo[i][tsCamX],
		TruckStopInfo[i][tsCamY],
		TruckStopInfo[i][tsCamZ],
		TruckStopInfo[i][tsLabelX],
		TruckStopInfo[i][tsLabelY],
		TruckStopInfo[i][tsLabelZ]);
        TruckStopInfo[i][tsValid]=1;
        TruckStopLabel[i]=CreateDynamic3DTextLabel(TruckStopInfo[i][tsName], COLOR_GREEN, TruckStopInfo[i][tsLabelX],TruckStopInfo[i][tsLabelY],TruckStopInfo[i][tsLabelZ], 15.0);
		TruckStopIcon[i]=CreateDynamicMapIcon(TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ],51, -1,-1,-1, -1, 250.0);
	}
	else
	    TruckStopInfo[i][tsValid]=0;
	mysql_free_result();
	return 1;
}
stock SaveTruckStop(i)
{
	if(TruckStopInfo[i][tsValid])
	{
	    new query[512];
		format(query,sizeof(query),"UPDATE truckstops SET tsName='%s', tsX='%f', tsY='%f', tsZ='%f', tsRot='%f', tsCamX='%f', tsCamY='%f', tsCamZ='%f', tsLabelX='%f', tsLabelY='%f', tsLabelZ='%f' WHERE id=%d",
		TruckStopInfo[i][tsName],
		TruckStopInfo[i][tsX],
		TruckStopInfo[i][tsY],
		TruckStopInfo[i][tsZ],
		TruckStopInfo[i][tsRot],
		TruckStopInfo[i][tsCamX],
		TruckStopInfo[i][tsCamY],
		TruckStopInfo[i][tsCamZ],
		TruckStopInfo[i][tsLabelX],
		TruckStopInfo[i][tsLabelY],
		TruckStopInfo[i][tsLabelZ],
		i);
		mysql_query(query);
		DestroyDynamic3DTextLabel(TruckStopLabel[i]);
		TruckStopLabel[i]=CreateDynamic3DTextLabel(TruckStopInfo[i][tsName], COLOR_GREEN, TruckStopInfo[i][tsLabelX],TruckStopInfo[i][tsLabelY],TruckStopInfo[i][tsLabelZ], 15.0);
		DestroyDynamicMapIcon(TruckStopIcon[i]);
		TruckStopIcon[i]=CreateDynamicMapIcon(TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ],51, -1,-1,-1, -1, 250.0);

	}
	return 1;
}
stock TruckStopCreate(playerid,name[])
{
    for(new i=0; i<MAX_TRUCKSTOPS; i++)
	{
	    if(!TruckStopInfo[i][tsValid])
		{
		    new query[255];
		    new Float:pos[4];
			if(IsPlayerInAnyVehicle(playerid))
			{
				GetVehicleZAngle(GetPlayerVehicleID(playerid),pos[3]);
				GetVehiclePos(GetPlayerVehicleID(playerid),pos[0],pos[1],pos[2]);
			}
			else
			{
				GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
				GetPlayerFacingAngle(playerid,pos[3]);
			}
		    format(query,sizeof(query),"INSERT INTO truckstops SET id=%d, tsName=' %s', tsX='%f', tsY='%f', tsZ='%f', tsRot='%f'",
			i,
			name,
			pos[0],
			pos[1],
			pos[2],
			pos[3]);
			mysql_query(query);
			LoadTruckStop(i);
			format(query,sizeof(query),"Вы создали трак стоп %d ( %s )",i,name);
			SendClientMessage(playerid, COLOR_GRAD2, query);
			return 1;
		}
	}
	return 1;
}

stock TruckStopSetCamPos(playerid,i)
{
	new Float:pos[3];
    GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	TruckStopInfo[i][tsCamX]=pos[0];
	TruckStopInfo[i][tsCamY]=pos[1];
	TruckStopInfo[i][tsCamZ]=pos[2];
	SaveTruckStop(i);
	return 1;
}
stock TruckStopSetLabelPos(playerid,i)
{
    new Float:pos[3];
    GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	TruckStopInfo[i][tsLabelX]=pos[0];
	TruckStopInfo[i][tsLabelY]=pos[1];
	TruckStopInfo[i][tsLabelZ]=pos[2];
	SaveTruckStop(i);
	return 1;
}
stock TruckStopSetPos(playerid,i)
{
    if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleZAngle(GetPlayerVehicleID(playerid),TruckStopInfo[i][tsRot]);
		GetVehiclePos(GetPlayerVehicleID(playerid),TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ]);
	}
	else
	{
		GetPlayerPos(playerid,TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ]);
		GetPlayerFacingAngle(playerid,TruckStopInfo[i][tsRot]);
	}
	SaveTruckStop(i);
	return 1;
}

COMMAND:truckstopcreate(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin]<1)return 1;
	if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /truckstopcreate [название трак стопа](вы создаете место спауна автомобиля)");
    TruckStopCreate(playerid,params);
	return 1;
}
COMMAND:truckstopcam(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if (sscanf(params, "i", i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /truckstopcam [номер трак стопа]");
    TruckStopSetCamPos(playerid,i);
    new str[128];
    format(str,sizeof(str),"Вы установили позицию камеры для тракстопа %d",i);
    SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:truckstoplabel(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if (sscanf(params, "i", i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /truckstoplabel [номер трак стопа]");
    TruckStopSetLabelPos(playerid,i);
    new str[128];
    format(str,sizeof(str),"Вы установили позицию 3д текста для тракстопа %d",i);
    SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:truckstoppos(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if (sscanf(params, "i", i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /truckstoppos [номер трак стопа]");
    TruckStopSetPos(playerid,i);
    new str[128];
    format(str,sizeof(str),"Вы установили позицию тракстопа %d",i);
    SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:truckstopname(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,name[64];
    if (sscanf(params, "is[64]", i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /truckstopname [номер трак стопа] [название трак стопа]");
    format(TruckStopInfo[i][tsName],64," %s",name);
    SaveTruckStop(i);
    new str[128];
    format(str,sizeof(str),"Вы установили имя тракстопа %d - %s",i,name);
    SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}

stock TruckStopSpawn(playerid)
{
    new i=PlayerInfo[playerid][pTruckStop];
    SetPlayerInterior(playerid,0);
	SetPlayerVirtualWorld(playerid,0);
    SetPlayerPos(playerid,TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ]);
	SetPlayerFacingAngle(playerid,TruckStopInfo[i][tsRot]);
	return 1;
}
COMMAND:truckstop(playerid,params[])
{
    for(new i=0; i<MAX_TRUCKSTOPS; i++)
	{
	    if(TruckStopInfo[i][tsValid])
		{
			if(IsPlayerInRangeOfPoint(playerid,50.0,TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ]))
			{
			    PlayerInfo[playerid][pTruckStop]=i;
				new str[128];
				format(str,sizeof(str),"Теперь %s - ваш основной тракстоп",TruckStopInfo[i][tsName]);
				SendClientMessage(playerid,COLOR_GRAD2,str);
			    return 1;
		    }
		}
	}
	return 1;
}

stock ShowPlayerTruck(playerid)
{
    new i = PlayerInfo[playerid][pTruckStop];
    new b=TruckChange[playerid];
	PlayerInfo[playerid][pCarModel]=CarInfo[b][carModel];

    DestroyVehicle(PlayerInfo[playerid][pCarID]);
	PlayerInfo[playerid][pCarID]=CreateVehicle(PlayerInfo[playerid][pCarModel],TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ],TruckStopInfo[i][tsRot],PlayerInfo[playerid][pCarColor1]=random(126),PlayerInfo[playerid][pCarColor2]=random(126),120000);
    new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(PlayerInfo[playerid][pCarID],engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(PlayerInfo[playerid][pCarID],VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
    SetVehicleVirtualWorld(PlayerInfo[playerid][pCarID],playerid);
	new str[255];
    if(PlayerInfo[playerid][pPoints]<CarInfo[b][carPoints])
    {
        format(str,sizeof(str),"~b~trucker.valakas.ru ~r~/help             ~y~Mashina:~w~%s ~r~Budet dostupna posle %d ochkov dostavki",
        CarName[PlayerInfo[playerid][pCarModel]-400],
        CarInfo[b][carPoints]);
    }
    else
    {
	    format(str,sizeof(str),"~b~trucker.valakas.ru ~r~/help             ~y~Mashina:~w~%s ~y~Cena:~w~%d$ ~y~Vmestimost'(kg):~w~%d",
		CarName[PlayerInfo[playerid][pCarModel]-400],
		CarInfo[b][carPrice],
		CarInfo[b][carCapacity]);
	}
    SetHelpDraw(playerid,str);
	return 1;
}
stock ShowPlayerTruckStop(playerid)
{
	new i = PlayerInfo[playerid][pTruckStop];
	TogglePlayerControllable(playerid,0);
    SetPlayerInterior(playerid,0);
	SetPlayerVirtualWorld(playerid,0);
    SetPlayerPos(playerid,TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ]-4.0);
    SetPlayerCameraPos(playerid,TruckStopInfo[i][tsCamX],TruckStopInfo[i][tsCamY],TruckStopInfo[i][tsCamZ]);
    SetPlayerCameraLookAt(playerid,TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ]);
    return 1;
}
stock TruckStopNextKey(playerid)
{
    PlayerInfo[playerid][pTruckStop]++;
    if(!TruckStopInfo[PlayerInfo[playerid][pTruckStop]][tsValid])
        PlayerInfo[playerid][pTruckStop]=0;
    ShowPlayerTruckStop(playerid);
}
stock TruckStopPrevKey(playerid)
{
    PlayerInfo[playerid][pTruckStop]--;
    if(PlayerInfo[playerid][pTruckStop] < 0)
    {
        for(new i=0; i<MAX_TRUCKSTOPS; i++)
        {
            if(TruckStopInfo[i][tsValid])
            {
                PlayerInfo[playerid][pTruckStop]=i;
            }
        }
    }
    ShowPlayerTruckStop(playerid);
}