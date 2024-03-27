enum trailerinfo
{
	tiValid,
	tiCarID,//не сохранять
	tiModel,
	Float:tiX,
	Float:tiY,
	Float:tiZ,
	Float:tiRot,
	tiColor1,
	tiColor2,
	tiTruck,//не сохранять
};
new TrailerInfo[MAX_TRAILERS][trailerinfo];
stock LoadTrailer(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT tiModel, tiX, tiY, tiZ, tiRot, tiColor1, tiColor2 FROM trailers WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>dffffdd",
		TrailerInfo[i][tiModel],
		TrailerInfo[i][tiX],
		TrailerInfo[i][tiY],
		TrailerInfo[i][tiZ],
		TrailerInfo[i][tiRot],
		TrailerInfo[i][tiColor1],
		TrailerInfo[i][tiColor2]);
		TrailerInfo[i][tiValid]=1;
		TrailerInfo[i][tiCarID]=CreateVehicle(TrailerInfo[i][tiModel],
		TrailerInfo[i][tiX],
		TrailerInfo[i][tiY],
		TrailerInfo[i][tiZ],
		TrailerInfo[i][tiRot],
		TrailerInfo[i][tiColor1],
		TrailerInfo[i][tiColor2],
		120000);
		TrailerInfo[i][tiValid]=1;
	}
	else
	    TrailerInfo[i][tiValid]=0;
	mysql_free_result();
	return 1;
}
stock TrailerInit()
{
    for(new i=0; i<MAX_TRAILERS; i++)
        LoadTrailer(i);
	return 1;
}
stock CreateTrailer(playerid,model,color1,color2)
{
    for(new i=0; i<MAX_TRAILERS; i++)
	{
	    if(!TrailerInfo[i][tiValid])
		{
			if(IsPlayerInAnyVehicle(playerid))
			{
				GetVehicleZAngle(GetPlayerVehicleID(playerid),TrailerInfo[i][tiRot]);
				GetVehiclePos(GetPlayerVehicleID(playerid),TrailerInfo[i][tiX],
				TrailerInfo[i][tiY],
				TrailerInfo[i][tiZ]);
			}
			else
			{
				GetPlayerPos(playerid,TrailerInfo[i][tiX],
				TrailerInfo[i][tiY],
				TrailerInfo[i][tiZ]);
				GetPlayerFacingAngle(playerid,TrailerInfo[i][tiRot]);
			}
			new query[255];
			format(query,sizeof(query),"INSERT INTO trailers SET id=%d, tiModel=%d, tiX='%f', tiY='%f', tiZ='%f', tiRot='%f', tiColor1=%d, tiColor2=%d",
			i,
			model,
			TrailerInfo[i][tiX],
			TrailerInfo[i][tiY],
			TrailerInfo[i][tiZ],
			TrailerInfo[i][tiRot],
			color1,
			color2);
			mysql_query(query);
			LoadTrailer(i);
			return i;
		}
	}
	return 1;
}
stock SetTrailerPos(playerid,i)
{
    if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleZAngle(GetPlayerVehicleID(playerid),TrailerInfo[i][tiRot]);
		GetVehiclePos(GetPlayerVehicleID(playerid),TrailerInfo[i][tiX],
		TrailerInfo[i][tiY],
		TrailerInfo[i][tiZ]);
	}
	else
	{
		GetPlayerPos(playerid,TrailerInfo[i][tiX],
		TrailerInfo[i][tiY],
		TrailerInfo[i][tiZ]);
		GetPlayerFacingAngle(playerid,TrailerInfo[i][tiRot]);
	}
	SaveTrailer(i);
	return 1;
}

stock SaveTrailer(i)
{
	if(TrailerInfo[i][tiValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE trailers SET tiModel=%d, tiX='%f', tiY='%f', tiZ='%f', tiRot='%f', tiColor1=%d, tiColor2=%d WHERE id=%d",
		TrailerInfo[i][tiModel],
		TrailerInfo[i][tiX],
		TrailerInfo[i][tiY],
		TrailerInfo[i][tiZ],
		TrailerInfo[i][tiRot],
		TrailerInfo[i][tiColor1],
		TrailerInfo[i][tiColor2],
		i);
		mysql_query(query);
	}
	return 1;
}
COMMAND:trailercreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new model,color1,color2;
    if (sscanf(params, "iii",model,color1,color2))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /trailercreate [модель] [цвет 1] [цвет 2]");
    switch(model)
    {
	    case 435, 450, 584, 591:
	    {
		    new i=CreateTrailer(playerid,model,color1,color2);
		    new str[128];
		    format(str,sizeof(str),"Вы создали трейлер ( %d ) модель %d цвет 1 %d цвет 2 %d",i,model,color1,color2);
		    SendClientMessage(playerid, COLOR_GRAD2, str);
	    }
	    default:
	    	SendClientMessage(playerid, COLOR_GRAD2, "Модель трейлера 435(обычный), 450(сыпучий), 584(цистерна), 591(маленький обычный)");
	}
    return 1;
}
COMMAND:trailersetpos(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /trailersetpos [id трейлера]");
    SetTrailerPos(playerid,i);
    new str[128];
    format(str,sizeof(str),"Вы изменили позицию трейлера под id %d",i);
    SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
