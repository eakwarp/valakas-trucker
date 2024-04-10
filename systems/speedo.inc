
COMMAND:speedo(playerid,params[])
{
	if (gSpeedo[playerid] == 2 || gSpeedo[playerid] == 0)
	{
		gSpeedo[playerid] = 1;
		GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~b~Speedo~n~~r~off", 5000, 5);
		PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		TextDrawHideForPlayer(playerid, speedo[playerid]);
	}
	else if (gSpeedo[playerid] == 1)
	{
	    gSpeedo[playerid] = 2;
		GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~b~Speedo~n~~g~on", 5000, 5);
		PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		TextDrawShowForPlayer(playerid, speedo[playerid]);
	}
	return 1;
}

stock CreateSpeedo(i)
{
	speedo[i] = TextDrawCreate(PlayerInfo[i][pSpeedoX],PlayerInfo[i][pSpeedoY],"none");
	TextDrawAlignment(speedo[i],0);
	TextDrawBackgroundColor(speedo[i],0x000000ff);
	TextDrawFont(speedo[i],3);
	TextDrawLetterSize(speedo[i],0.299999,1.100000);
	TextDrawColor(speedo[i],0xffffffff);
	TextDrawSetOutline(speedo[i],1);
	TextDrawSetProportional(speedo[i],1);
	TextDrawSetShadow(speedo[i],1);
	TextDrawShowForPlayer(i, speedo[i]);
	return 1;
}
stock DeatroySpeedo(i)
{
    TextDrawHideForPlayer(i, speedo[i]);
    TextDrawDestroy(speedo[i]);
	return 1;
}




enum speedoinfo
{
    //Float:sdspeed,
	sdcarid,
	sdstate,
};
new SpeedoInfo[speedoinfo];
new sdstring[255];
new Float:vPos[4];
new radarbit[MAX_PLAYERS];
new enterexbit[MAX_PLAYERS];
new radarcolbit[MAX_PLAYERS];
new radarspeedbit[MAX_PLAYERS];
new gasbit[MAX_PLAYERS];
forward PlayerSpeedoUpdate(i);
public PlayerSpeedoUpdate(i)
{
	enterexbit[i]++;
	if(enterexbit[i] == 25)
	{
        PlayerEnterExitTimer(i);
	    enterexbit[i]=0;
	}
    SpeedoInfo[sdstate]=GetPlayerState(i);
	if(SpeedoInfo[sdstate]==PLAYER_STATE_DRIVER)
	{
	    SpeedoInfo[sdcarid]=GetPlayerVehicleID(i);
		if(gSpeedo[i] == 2 || gSpeedo[i] == 0)
		{
		    GetVehicleVelocity(SpeedoInfo[sdcarid], vPos[1], vPos[2], vPos[3]);
		    PlayerInfo[i][pSpeed]=floatmul(floatsqroot(floatadd(floatpower(vPos[1], 2), floatadd(floatpower(vPos[2], 2), floatpower(vPos[3], 2)))), 200)/1.4;
		    if(PlayerInfo[i][pSpeed]<1)
				format(sdstring,sizeof(sdstring),"%s~n~~g~Hunger: ~b~%0.1f ~g~per~n~~g~Fatigue: ~b~%0.1f ~g~per~n~~g~Gear: ~w~R ~r~N ~w~D",SignalSetString(i),PlayerInfo[i][pHunger],PlayerInfo[i][pFatigue]);
			else if(IsVehicleDrivingBackwards(SpeedoInfo[sdcarid],vPos[1], vPos[2]))
				format(sdstring,sizeof(sdstring),"%s~n~~g~Hunger: ~b~%0.1f ~g~per~n~~g~Fatigue: ~b~%0.1f ~g~per~n~~g~Gear: ~r~R ~w~N D",SignalSetString(i),PlayerInfo[i][pHunger],PlayerInfo[i][pFatigue]);
		    else
				format(sdstring,sizeof(sdstring),"%s~n~~g~Hunger: ~b~%0.1f ~g~per~n~~g~Fatigue: ~b~%0.1f ~g~per~n~~g~Gear: ~w~R N ~r~D",SignalSetString(i),PlayerInfo[i][pHunger],PlayerInfo[i][pFatigue]);
			if(Gas[SpeedoInfo[sdcarid]]<10.0)
			{
			    switch(gasbit[i])
			    {
			        case 0:
			        {
			         	format(sdstring,sizeof(sdstring),"%s~n~~g~Fuel: ~b~%0.1f ~g~per ~w~.",sdstring,Gas[SpeedoInfo[sdcarid]]);
			            gasbit[i]=1;
		         	}
			        case 1:
			        {
			         	format(sdstring,sizeof(sdstring),"%s~n~~g~Fuel: ~b~%0.1f ~g~per ~r~.",sdstring,Gas[SpeedoInfo[sdcarid]]);
			            gasbit[i]=0;
			        }
			    }
			}
			else
			 	format(sdstring,sizeof(sdstring),"%s~n~~g~Fuel: ~b~%0.1f ~g~per",sdstring,Gas[SpeedoInfo[sdcarid]]);
			if(g_fSpeedCap[i] > 0.0)
				format(sdstring,sizeof(sdstring),"%s~n~~g~Speed: ~b~%0.1f ~g~mph~r~ (%d)",sdstring,PlayerInfo[i][pSpeed],SpeedLimit[i]);
		    else
		    {
				format(sdstring,sizeof(sdstring),"%s~n~~g~Speed: ~b~%0.1f ~g~mph",sdstring,PlayerInfo[i][pSpeed]);
			}
			if(PlayerInfo[i][pCarID]==SpeedoInfo[sdcarid])
	    	{
	    	    radarbit[i]++;
				if(radarbit[i]==3)
				{
				    radarbit[i]=0;
					OnPlayerRadar(i);
				}
	    	    PlayerInfo[i][pCarMileage]+=PlayerInfo[i][pSpeed];
	    	    format(sdstring, sizeof(sdstring), "%s~n~~g~Mileage: ~b~%0.1f", sdstring,PlayerInfo[i][pCarMileage]/10000);
			}
			if(PlayerInfo[i][pDeliveryID]!=-1)
	    	    format(sdstring, sizeof(sdstring), "%s~n~~g~Cargo: ~b~%0.1f ~g~per", sdstring,PlayerInfo[i][pDeliveryHealth]);
			if(PlayerInfo[i][pCarRadarDetector])
			{
				if(PlayerInfo[i][pCarDamper])
				{
				    if(PlayerRadarDetect[i])
				    {
						if(RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]!=radarspeedbit[i])
						{
							//new st[24];
							//format(st,sizeof(st),"%0.1f",RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
						    radarspeedbit[i]=floatround(RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
							SetSpeedLimit(i,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
						    //cmd_speedlimit(i,st);
						}
				    }
					else
					{
						if(radarspeedbit[i]!=0)
						{
      						cmd_speedlimit(i,"0");
							radarspeedbit[i]=0;
						}
					}
				}
			    switch(radarcolbit[i])
			    {
			        case 0:
			        {
			            radarcolbit[i]=1;
						switch(PlayerRadarDetect[i])
						{
						    case 1:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%0.1f):", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
					    	case 2:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%0.1f)::", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
					    	case 3:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%0.1f):::", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
      						default:
					    	    format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~b~clear", sdstring);
					    }
					    
					}
					case 1:
					{
					    radarcolbit[i]=0;
						switch(PlayerRadarDetect[i])
						{
						    case 1:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%0.1f)~y~:", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
					    	case 2:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%0.1f)~y~::", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
					    	case 3:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%0.1f)~y~:::", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
					    	default:
					    	    format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~b~clear", sdstring);
					    }
					}
				}
			}
			TextDrawSetString(speedo[i],sdstring);
		}
	}
	else
	{
	    format(sdstring,sizeof(sdstring),"%s~n~~g~Hunger: ~b~%0.1f ~g~per~n~~g~Fatigue: ~b~%0.1f ~g~per",SignalSetString(i),PlayerInfo[i][pHunger],PlayerInfo[i][pFatigue]);
	    TextDrawSetString(speedo[i],sdstring);
	}
	return 1;
}