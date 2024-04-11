
//new PlayerText:PedControls[MAX_PLAYERS][8];
/*
stock ShowPlayerPedControls(playerid)
{
    return 1;
}*/

new PlayerText:CarControls[MAX_PLAYERS][11];
//0 - lights 1 - engine 2 - lock 3 - left 4 - right 5 - radio 6 - alarm
//7 - flash lights 8 - flash alarm 9 - custom radio
//new PlayerText:PokerControls[MAX_PLAYERS][6];

stock ShowPlayerCarControls(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid))
	    return 0;
	if(GetPlayerState(playerid)!=PLAYER_STATE_DRIVER)
	    return 0;
    SelectTextDraw(playerid,0xFF4040AA);
    new engine,lights,alarm,doors,bonnet,boot,objective,carid=GetPlayerVehicleID(playerid);
	GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);

    if(PlayerInfo[playerid][CarRadio])
        CarControls[playerid][5] = CreatePlayerTextDraw(playerid,270.000000,180.000000, "Radio ~g~ON");
    else
        CarControls[playerid][5] = CreatePlayerTextDraw(playerid,270.000000,180.000000, "Radio ~r~OFF");
    PlayerTextDrawFont(playerid,CarControls[playerid][5], 1);
    PlayerTextDrawLetterSize(playerid,CarControls[playerid][5], 0.500000, 1.500000);
    PlayerTextDrawColor(playerid,CarControls[playerid][5], 0xFFFFFFFF);
    PlayerTextDrawSetShadow(playerid, CarControls[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid,CarControls[playerid][5], 1);
    PlayerTextDrawUseBox(playerid,CarControls[playerid][5], 1);
    PlayerTextDrawBoxColor(playerid,CarControls[playerid][5], 0xFFFFFF11);
    PlayerTextDrawTextSize(playerid,CarControls[playerid][5], 370.000000, 15.000000);
    
    PlayerTextDrawSetSelectable(playerid,CarControls[playerid][5],1);
    PlayerTextDrawShow(playerid,CarControls[playerid][5]);
    if(custombroadcastuse[carid])
        CarControls[playerid][9] = CreatePlayerTextDraw(playerid,375.000000,180.000000, "~g~Custom");
    else
        CarControls[playerid][9] = CreatePlayerTextDraw(playerid,375.000000,180.000000, "Custom");
    //PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][5], 0xFFFFFF22);
    PlayerTextDrawFont(playerid,CarControls[playerid][9], 1);
    PlayerTextDrawLetterSize(playerid,CarControls[playerid][9], 0.500000, 1.500000);
    PlayerTextDrawColor(playerid,CarControls[playerid][9], 0xFFFFFFFF);
    PlayerTextDrawSetShadow(playerid, CarControls[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid,CarControls[playerid][9], 1);
    PlayerTextDrawUseBox(playerid,CarControls[playerid][9], 1);
    PlayerTextDrawBoxColor(playerid,CarControls[playerid][9], 0xFFFFFF11);
    PlayerTextDrawTextSize(playerid,CarControls[playerid][9], 460.000000, 15.000000);
    PlayerTextDrawSetSelectable(playerid,CarControls[playerid][9],1);
    PlayerTextDrawShow(playerid,CarControls[playerid][9]);
	
	if(CarAlarms[carid])
		CarControls[playerid][6] = CreatePlayerTextDraw(playerid,270.000000,200.000000, "Alarm ~g~ON");
	else
	    CarControls[playerid][6] = CreatePlayerTextDraw(playerid,270.000000,200.000000, "Alarm ~r~OFF");
    //PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][6], 0xFFFFFF22);
	PlayerTextDrawFont(playerid,CarControls[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid,CarControls[playerid][6], 0.500000, 1.500000);
	PlayerTextDrawColor(playerid,CarControls[playerid][6], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, CarControls[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid,CarControls[playerid][6], 1);
	PlayerTextDrawUseBox(playerid,CarControls[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid,CarControls[playerid][6], 0xFFFFFF11);
	PlayerTextDrawTextSize(playerid,CarControls[playerid][6], 370.000000, 15.000000);
	
	CarControls[playerid][8] = CreatePlayerTextDraw(playerid,380.000000,200.000000, "Flash");
    //PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][8], 0xFFFFFF22);
	PlayerTextDrawFont(playerid,CarControls[playerid][8], 1);
	PlayerTextDrawLetterSize(playerid,CarControls[playerid][8], 0.500000, 1.500000);
	PlayerTextDrawColor(playerid,CarControls[playerid][8], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, CarControls[playerid][8], 1);
	PlayerTextDrawSetProportional(playerid,CarControls[playerid][8], 1);
	PlayerTextDrawUseBox(playerid,CarControls[playerid][8], 1);
	PlayerTextDrawBoxColor(playerid,CarControls[playerid][8], 0xFFFFFF22);
	PlayerTextDrawTextSize(playerid,CarControls[playerid][8], 430.000000, 15.000000);
	
	if(lights==VEHICLE_PARAMS_ON)
    	CarControls[playerid][0] = CreatePlayerTextDraw(playerid,270.000000,220.000000, "Lights ~g~ON");
	else
	    CarControls[playerid][0] = CreatePlayerTextDraw(playerid,270.000000,220.000000, "Lights ~r~OFF");
	//PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][0], 0xFFFFFF22);
	PlayerTextDrawFont(playerid,CarControls[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid,CarControls[playerid][0], 0.500000, 1.500000);
	PlayerTextDrawColor(playerid,CarControls[playerid][0], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, CarControls[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid,CarControls[playerid][0], 1);
	PlayerTextDrawUseBox(playerid,CarControls[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid,CarControls[playerid][0], 0xFFFFFF22);
	PlayerTextDrawTextSize(playerid,CarControls[playerid][0], 370.000000, 15.000000);
	
	CarControls[playerid][7] = CreatePlayerTextDraw(playerid,390.000000,220.000000, "Flash");
    //PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][7], 0xFFFFFF44);
	PlayerTextDrawFont(playerid,CarControls[playerid][7], 1);
	PlayerTextDrawLetterSize(playerid,CarControls[playerid][7], 0.500000, 1.500000);
	PlayerTextDrawColor(playerid,CarControls[playerid][7], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, CarControls[playerid][7], 1);
	PlayerTextDrawSetProportional(playerid,CarControls[playerid][7], 1);
	PlayerTextDrawUseBox(playerid,CarControls[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid,CarControls[playerid][7], 0xFFFFFF11);
	PlayerTextDrawTextSize(playerid,CarControls[playerid][7], 440.000000, 15.000000);
	
	if(engine==VEHICLE_PARAMS_ON)
		CarControls[playerid][1] = CreatePlayerTextDraw(playerid,270.000000,240.000000, "Engine ~g~ON");
	else
        CarControls[playerid][1] = CreatePlayerTextDraw(playerid,270.000000,240.000000, "Engine ~r~OFF");
	//PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][1], 0xFFFFFF22);
	PlayerTextDrawFont(playerid,CarControls[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid,CarControls[playerid][1], 0.500000, 1.500000);
	PlayerTextDrawColor(playerid,CarControls[playerid][1], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, CarControls[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid,CarControls[playerid][1], 1);
	PlayerTextDrawUseBox(playerid,CarControls[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid,CarControls[playerid][1], 0xFFFFFF11);
	PlayerTextDrawTextSize(playerid,CarControls[playerid][1], 370.000000, 15.000000);
/*
	if(doors==VEHICLE_PARAMS_ON)
		CarControls[playerid][2] = CreatePlayerTextDraw(playerid,270.000000,260.000000,"Lock ~g~ON");
	else
	    CarControls[playerid][2] = CreatePlayerTextDraw(playerid,270.000000,260.000000,"Lock ~r~OFF");
	//PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][2], 0xFFFFFF22);
	PlayerTextDrawFont(playerid,CarControls[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid,CarControls[playerid][2], 0.500000, 1.500000);
	PlayerTextDrawColor(playerid,CarControls[playerid][2], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, CarControls[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid,CarControls[playerid][2], 1);
	PlayerTextDrawUseBox(playerid,CarControls[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid,CarControls[playerid][2], 0xFFFFFF11);
	PlayerTextDrawTextSize(playerid,CarControls[playerid][2], 370.000000, 15.000000);
	*/
	CarControls[playerid][10] = CreatePlayerTextDraw(playerid,270.000000,280.000000,"Speedlimit");
	//PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][2], 0xFFFFFF22);
	PlayerTextDrawFont(playerid,CarControls[playerid][10], 1);
	PlayerTextDrawLetterSize(playerid,CarControls[playerid][10], 0.500000, 1.500000);
	PlayerTextDrawColor(playerid,CarControls[playerid][10], 0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, CarControls[playerid][10], 1);
	PlayerTextDrawSetProportional(playerid,CarControls[playerid][10], 1);
	PlayerTextDrawUseBox(playerid,CarControls[playerid][10], 1);
	PlayerTextDrawBoxColor(playerid,CarControls[playerid][10], 0xFFFFFF11);
	PlayerTextDrawTextSize(playerid,CarControls[playerid][10], 370.000000, 15.000000);
	PlayerTextDrawSetSelectable(playerid,CarControls[playerid][10],1);
	PlayerTextDrawShow(playerid,CarControls[playerid][10]);
	
	PlayerTextDrawSetSelectable(playerid,CarControls[playerid][0],1);
	PlayerTextDrawSetSelectable(playerid,CarControls[playerid][1],1);
	PlayerTextDrawSetSelectable(playerid,CarControls[playerid][2],1);
	
	PlayerTextDrawShow(playerid,CarControls[playerid][0]);
	PlayerTextDrawShow(playerid,CarControls[playerid][1]);
	PlayerTextDrawShow(playerid,CarControls[playerid][2]);

    CarControls[playerid][3] = CreatePlayerTextDraw(playerid,255.000000,220.000000,"~<~");
    CarControls[playerid][4] = CreatePlayerTextDraw(playerid,375.000000,220.000000,"~>~");
    //PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][3],0xFFFFFF22);
	PlayerTextDrawFont(playerid,CarControls[playerid][3],1);
	PlayerTextDrawLetterSize(playerid,CarControls[playerid][3],1.0,1.0);
	PlayerTextDrawTextSize(playerid,CarControls[playerid][3],265.000000, 20.000000);
	PlayerTextDrawColor(playerid,CarControls[playerid][3],0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, CarControls[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid,CarControls[playerid][3],1);
	PlayerTextDrawUseBox(playerid,CarControls[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid,CarControls[playerid][3], 0xFFFFFF11);
	//PlayerTextDrawBackgroundColor(playerid,CarControls[playerid][4],0xFFFFFF22);
	PlayerTextDrawFont(playerid,CarControls[playerid][4],1);
	PlayerTextDrawLetterSize(playerid,CarControls[playerid][4],1.0,1.0);
	PlayerTextDrawTextSize(playerid,CarControls[playerid][4],385.000000, 20.000000);
	PlayerTextDrawColor(playerid,CarControls[playerid][4],0xFFFFFFFF);
	PlayerTextDrawSetShadow(playerid, CarControls[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid,CarControls[playerid][4],1);
	PlayerTextDrawUseBox(playerid,CarControls[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid,CarControls[playerid][4], 0xFFFFFF11);
	PlayerTextDrawSetSelectable(playerid,CarControls[playerid][3],1);
	PlayerTextDrawSetSelectable(playerid,CarControls[playerid][4],1);
	PlayerTextDrawShow(playerid,CarControls[playerid][3]);
	PlayerTextDrawShow(playerid,CarControls[playerid][4]);

    PlayerTextDrawSetSelectable(playerid,CarControls[playerid][6],1);
    PlayerTextDrawShow(playerid,CarControls[playerid][6]);
    PlayerTextDrawSetSelectable(playerid,CarControls[playerid][7],1);
    PlayerTextDrawSetSelectable(playerid,CarControls[playerid][8],1);
    PlayerTextDrawShow(playerid,CarControls[playerid][7]);
	PlayerTextDrawShow(playerid,CarControls[playerid][8]);
    gPlayerControls[playerid]=1;
	return 1;
}

stock HidePlayerCarControls(playerid)
{
	if(gPlayerControls[playerid]==1)
	{
	    PlayerTextDrawHide(playerid, CarControls[playerid][0]);
	    PlayerTextDrawHide(playerid, CarControls[playerid][1]);
	    //PlayerTextDrawHide(playerid, CarControls[playerid][2]);
	    PlayerTextDrawHide(playerid, CarControls[playerid][3]);
		PlayerTextDrawHide(playerid, CarControls[playerid][4]);
		PlayerTextDrawHide(playerid, CarControls[playerid][5]);
		PlayerTextDrawHide(playerid, CarControls[playerid][6]);
		PlayerTextDrawHide(playerid, CarControls[playerid][7]);
		PlayerTextDrawHide(playerid, CarControls[playerid][8]);
		PlayerTextDrawHide(playerid, CarControls[playerid][9]);
		PlayerTextDrawHide(playerid, CarControls[playerid][10]);
	    PlayerTextDrawDestroy(playerid, CarControls[playerid][0]);
	    PlayerTextDrawDestroy(playerid, CarControls[playerid][1]);
		//PlayerTextDrawDestroy(playerid, CarControls[playerid][2]);
		PlayerTextDrawDestroy(playerid, CarControls[playerid][3]);
		PlayerTextDrawDestroy(playerid, CarControls[playerid][4]);
		PlayerTextDrawDestroy(playerid, CarControls[playerid][5]);
		PlayerTextDrawDestroy(playerid, CarControls[playerid][6]);
		PlayerTextDrawDestroy(playerid, CarControls[playerid][7]);
		PlayerTextDrawDestroy(playerid, CarControls[playerid][8]);
		PlayerTextDrawDestroy(playerid, CarControls[playerid][9]);
		PlayerTextDrawDestroy(playerid, CarControls[playerid][10]);
	    gPlayerControls[playerid]=0;
    }
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    CancelSelectTextDraw(playerid);
	
    if(gPlayerControls[playerid]==1)
    {
	    if(playertextid == CarControls[playerid][0])
	    {
	        cmd_lights(playerid,"");
	        return 1;
	    }
	    if(playertextid == CarControls[playerid][1])
	    {
	        cmd_engine(playerid,"");
	        return 1;
	    }
	    /*if(playertextid == CarControls[playerid][2])
	    {
	        //cmd_lock(playerid,"");
	        return 1;
	    }*/
	    if(playertextid == CarControls[playerid][3])
	    {
	        if(gPlayerIndikator[playerid]==3)
		    {
		        if(IsValidDynamicObject(IndikatorObjID[playerid]))
			    {
					DestroyDynamicObject(IndikatorObjID[playerid]);
					IndikatorObjID[playerid]=0;
				}

		        new Float:x,Float:y,Float:z,Float:a,tmpcar;
		        //GetPlayerPos(playerid,x,y,z);
		        tmpcar=GetPlayerVehicleID(playerid);
		        new m=GetVehicleModel(tmpcar);
				if(IsAPlane(tmpcar))return 1;
		        GetVehiclePos(tmpcar,x,y,z);
		        GetVehicleZAngle(tmpcar,a);
		        if(PlayerInfo[playerid][pTurnType]!=1)
				{
			        IndikatorObjID[playerid]=CreateDynamicObject(19131,x,y,z,0.0,0.0,0.0);
					if(!IsABigVehicle(tmpcar))
						AttachDynamicObjectToVehicle(IndikatorObjID[playerid], tmpcar, -0.5, 0.0, 1.5, 0.0,0.0,-90.0);
					else
						AttachDynamicObjectToVehicle(IndikatorObjID[playerid], tmpcar, -0.5, 0.0, 3.0, 0.0,0.0,-90.0);
				}
				if(IsValidDynamicObject(CarIndikatorObject[tmpcar][0]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][0]);
	                CarIndikatorObject[tmpcar][0]=0;
				}
				if(IsValidDynamicObject(CarIndikatorObject[tmpcar][2]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][2]);
	                CarIndikatorObject[tmpcar][2]=0;
				}
				if(PlayerInfo[playerid][pTurnType]!=2)
				{
					if(!IsValidDynamicObject(CarIndikatorObject[tmpcar][1]))//зад лев
						CarIndikatorObject[tmpcar][1]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
					AttachDynamicObjectToVehicle(CarIndikatorObject[tmpcar][1],tmpcar,-CarIndikatorPos[m-400][0][0],CarIndikatorPos[m-400][0][1],CarIndikatorPos[m-400][0][2], 0.0,0.0,0.0);

					if(!IsValidDynamicObject(CarIndikatorObject[tmpcar][3]))//перед лев
						CarIndikatorObject[tmpcar][3]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
					AttachDynamicObjectToVehicle(CarIndikatorObject[tmpcar][3],tmpcar,-CarIndikatorPos[m-400][1][0],CarIndikatorPos[m-400][1][1],CarIndikatorPos[m-400][1][2], 0.0,0.0,0.0);
				}
				CarAlarms[tmpcar]=0;
	   			IndikatorValid[playerid]=1;
		        gPlayerIndikator[playerid]=2;
		        //GameTextForPlayer(playerid, "~r~<left turn<", 2000, 6);
		        IndikatorTime[playerid]=24;
		    }
		    else if(gPlayerIndikator[playerid]==2)//
		    {
		        if(IsValidDynamicObject(IndikatorObjID[playerid]))
			    {
					DestroyDynamicObject(IndikatorObjID[playerid]);
					IndikatorObjID[playerid]=0;
				}
		        new tmpcar=GetPlayerVehicleID(playerid);
		        if(IsValidDynamicObject(CarIndikatorObject[tmpcar][0]))
		        {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][0]);
	                CarIndikatorObject[tmpcar][0]=0;
				}
	            if(IsValidDynamicObject(CarIndikatorObject[tmpcar][1]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][1]);
	                CarIndikatorObject[tmpcar][1]=0;
				}
	            if(IsValidDynamicObject(CarIndikatorObject[tmpcar][2]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][2]);
	                CarIndikatorObject[tmpcar][2]=0;
				}
	            if(IsValidDynamicObject(CarIndikatorObject[tmpcar][3]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][3]);
	                CarIndikatorObject[tmpcar][3]=0;
				}
	            CarAlarms[tmpcar]=0;
				IndikatorValid[playerid]=0;
		        gPlayerIndikator[playerid]=1;
		        //GameTextForPlayer(playerid, "~r~turn off", 2000, 6);
		        IndikatorTime[playerid]=0;
		    }
		    else if(gPlayerIndikator[playerid]==1)
		    {
		        new Float:x,Float:y,Float:z,Float:a,tmpcar;
		        //GetPlayerPos(playerid,x,y,z);
		        tmpcar=GetPlayerVehicleID(playerid);
				if(IsAPlane(tmpcar))return 1;
		        GetVehiclePos(tmpcar,x,y,z);
		        GetVehicleZAngle(tmpcar,a);
		        if(PlayerInfo[playerid][pTurnType]!=1)
				{
			        IndikatorObjID[playerid]=CreateDynamicObject(19131,x,y,z,0.0,0.0,0.0);
					if(!IsABigVehicle(tmpcar))
						AttachDynamicObjectToVehicle(IndikatorObjID[playerid], tmpcar, -0.5, 0.0, 1.5, 0.0,0.0,-90.0);
					else
						AttachDynamicObjectToVehicle(IndikatorObjID[playerid], tmpcar, -0.5, 0.0, 3.0, 0.0,0.0,-90.0);
				}
				new m=GetVehicleModel(tmpcar);
	            if(IsValidDynamicObject(CarIndikatorObject[tmpcar][0]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][0]);
	                CarIndikatorObject[tmpcar][0]=0;
				}
				if(IsValidDynamicObject(CarIndikatorObject[tmpcar][2]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][2]);
	                CarIndikatorObject[tmpcar][2]=0;
				}
				if(PlayerInfo[playerid][pTurnType]!=2)
				{
					if(!IsValidDynamicObject(CarIndikatorObject[tmpcar][1]))//зад лев
						CarIndikatorObject[tmpcar][1]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
					AttachDynamicObjectToVehicle(CarIndikatorObject[tmpcar][1],tmpcar,-CarIndikatorPos[m-400][0][0],CarIndikatorPos[m-400][0][1],CarIndikatorPos[m-400][0][2], 0.0,0.0,0.0);

					if(!IsValidDynamicObject(CarIndikatorObject[tmpcar][3]))//перед лев
						CarIndikatorObject[tmpcar][3]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
					AttachDynamicObjectToVehicle(CarIndikatorObject[tmpcar][3],tmpcar,-CarIndikatorPos[m-400][1][0],CarIndikatorPos[m-400][1][1],CarIndikatorPos[m-400][1][2], 0.0,0.0,0.0);
				}
	            CarAlarms[tmpcar]=0;
				IndikatorValid[playerid]=1;
		        gPlayerIndikator[playerid]=2;
		        //GameTextForPlayer(playerid, "~r~<left turn<", 2000, 6);
		        IndikatorTime[playerid]=24;
		    }
	        return 1;
	    }
	    if(playertextid == CarControls[playerid][4])
	    {
	        if(gPlayerIndikator[playerid]==2)
		    {
		        if(IsValidDynamicObject(IndikatorObjID[playerid]))
			    {
					DestroyDynamicObject(IndikatorObjID[playerid]);
					IndikatorObjID[playerid]=0;
				}
		        new Float:x,Float:y,Float:z,Float:a,tmpcar;
		        //GetPlayerPos(playerid,x,y,z);
				tmpcar=GetPlayerVehicleID(playerid);
	            if(IsAPlane(tmpcar))return 1;
				GetVehiclePos(tmpcar,x,y,z);
				GetVehicleZAngle(tmpcar,a);
				if(PlayerInfo[playerid][pTurnType]!=1)
				{
			        IndikatorObjID[playerid]=CreateDynamicObject(19131,x,y,z,0.0,0.0,0.0);
					if(!IsABigVehicle(tmpcar))
						AttachDynamicObjectToVehicle(IndikatorObjID[playerid], tmpcar, 0.5,0.0, 1.5, 0.0,0.0,90.0);
					else
						AttachDynamicObjectToVehicle(IndikatorObjID[playerid], tmpcar, 0.5,0.0, 3.0, 0.0,0.0,90.0);
				}
	            new m=GetVehicleModel(tmpcar);
				if(IsValidDynamicObject(CarIndikatorObject[tmpcar][1]))
				{
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][1]);
	                CarIndikatorObject[tmpcar][1]=0;
				}
				if(IsValidDynamicObject(CarIndikatorObject[tmpcar][3]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][3]);
	                CarIndikatorObject[tmpcar][3]=0;
				}
				if(PlayerInfo[playerid][pTurnType]!=2)
				{
					if(!IsValidDynamicObject(CarIndikatorObject[tmpcar][0]))//зад лев
						CarIndikatorObject[tmpcar][0]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
					AttachDynamicObjectToVehicle(CarIndikatorObject[tmpcar][0],tmpcar,CarIndikatorPos[m-400][0][0],CarIndikatorPos[m-400][0][1],CarIndikatorPos[m-400][0][2], 0.0,0.0,0.0);

					if(!IsValidDynamicObject(CarIndikatorObject[tmpcar][2]))//перед лев
						CarIndikatorObject[tmpcar][2]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
					AttachDynamicObjectToVehicle(CarIndikatorObject[tmpcar][2],tmpcar,CarIndikatorPos[m-400][1][0],CarIndikatorPos[m-400][1][1],CarIndikatorPos[m-400][1][2], 0.0,0.0,0.0);
				}
				CarAlarms[tmpcar]=0;
				IndikatorValid[playerid]=1;
		        gPlayerIndikator[playerid]=3;
		        //GameTextForPlayer(playerid, "~r~>right turn>", 2000, 6);
		        IndikatorTime[playerid]=24;
		    }
			else if(gPlayerIndikator[playerid]==3)//
		    {
		        if(IsValidDynamicObject(IndikatorObjID[playerid]))
			    {
					DestroyDynamicObject(IndikatorObjID[playerid]);
					IndikatorObjID[playerid]=0;
				}
		        new tmpcar=GetPlayerVehicleID(playerid);
		        if(IsValidDynamicObject(CarIndikatorObject[tmpcar][0]))
		        {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][0]);
	                CarIndikatorObject[tmpcar][0]=0;
				}
	            if(IsValidDynamicObject(CarIndikatorObject[tmpcar][1]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][1]);
	                CarIndikatorObject[tmpcar][1]=0;
				}
	            if(IsValidDynamicObject(CarIndikatorObject[tmpcar][2]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][2]);
	                CarIndikatorObject[tmpcar][2]=0;
				}
	            if(IsValidDynamicObject(CarIndikatorObject[tmpcar][3]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][3]);
	                CarIndikatorObject[tmpcar][3]=0;
				}
	            CarAlarms[tmpcar]=0;
				IndikatorValid[playerid]=0;
		        gPlayerIndikator[playerid]=1;
		        //GameTextForPlayer(playerid, "~r~turn off", 2000, 6);
		        IndikatorTime[playerid]=0;
		    }
		    else if(gPlayerIndikator[playerid]==1)
		    {
		        new Float:x,Float:y,Float:z,Float:a,tmpcar;
		        //GetPlayerPos(playerid,x,y,z);
		        tmpcar=GetPlayerVehicleID(playerid);
		        new m=GetVehicleModel(tmpcar);
				if(IsAPlane(tmpcar))return 1;
		        GetVehicleZAngle(tmpcar,a);
		        GetVehiclePos(tmpcar,x,y,z);
		        if(PlayerInfo[playerid][pTurnType]!=1)
				{
			        IndikatorObjID[playerid]=CreateDynamicObject(19131,x,y,z,0.0,0.0,0.0);
					if(!IsABigVehicle(tmpcar))
						AttachDynamicObjectToVehicle(IndikatorObjID[playerid], tmpcar, 0.5, 0.0, 1.5, 0.0,0.0,90.0);
					else
						AttachDynamicObjectToVehicle(IndikatorObjID[playerid], tmpcar, 0.5, 0.0, 3.0, 0.0,0.0,90.0);
				}
				if(IsValidDynamicObject(CarIndikatorObject[tmpcar][1]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][1]);
	                CarIndikatorObject[tmpcar][1]=0;
				}
				if(IsValidDynamicObject(CarIndikatorObject[tmpcar][3]))
	            {
	                DestroyDynamicObject(CarIndikatorObject[tmpcar][3]);
	                CarIndikatorObject[tmpcar][3]=0;
				}
				if(PlayerInfo[playerid][pTurnType]!=2)
				{
					if(!IsValidDynamicObject(CarIndikatorObject[tmpcar][0]))//зад лев
						CarIndikatorObject[tmpcar][0]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
					AttachDynamicObjectToVehicle(CarIndikatorObject[tmpcar][0],tmpcar,CarIndikatorPos[m-400][0][0],CarIndikatorPos[m-400][0][1],CarIndikatorPos[m-400][0][2], 0.0,0.0,0.0);

					if(!IsValidDynamicObject(CarIndikatorObject[tmpcar][2]))//перед лев
						CarIndikatorObject[tmpcar][2]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
					AttachDynamicObjectToVehicle(CarIndikatorObject[tmpcar][2],tmpcar,CarIndikatorPos[m-400][1][0],CarIndikatorPos[m-400][1][1],CarIndikatorPos[m-400][1][2], 0.0,0.0,0.0);
				}
				CarAlarms[tmpcar]=0;
				IndikatorValid[playerid]=1;
		        gPlayerIndikator[playerid]=3;
		        //GameTextForPlayer(playerid, "~r~>right turn>", 2000, 6);
		        IndikatorTime[playerid]=24;
			}
	        return 1;
	    }
	    if(playertextid == CarControls[playerid][5])
	    {
	        BroadcastSwitch(playerid);
	    }
	    if(playertextid == CarControls[playerid][6])
	    {
	        new tmpcar=GetPlayerVehicleID(playerid);
	        CarAlarmUse(tmpcar);
	    }
	    if(playertextid == CarControls[playerid][7])
	    {
	        new tmpcar=GetPlayerVehicleID(playerid);
	        StartLightFlash(tmpcar);
	    }
	    if(playertextid == CarControls[playerid][8])
	    {
	        new tmpcar=GetPlayerVehicleID(playerid);
	        StartAlarmFlash(tmpcar);
	    }
	    if(playertextid == CarControls[playerid][9])
	    {
	        StartCustomRadioSwitch(playerid);
	    }
	    if(playertextid == CarControls[playerid][10])
	    {
	        StartSpeedlimitSwitch(playerid);
	    }
	    HidePlayerCarControls(playerid);
   	}
    return 1;
}
public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	HidePlayerCarControls(playerid);
    return 1;
}

COMMAND:carradio(playerid,params[])
{
	SendClientMessage(playerid,COLOR_GRAD2,"Вы переключили радио");
	return BroadcastSwitch(playerid);
}

stock LoadViewPos()
{
	new query[255];
	format(query,sizeof(query),"SELECT x, y, z, sx, sy, sz, srx, sry, srz, ix0, iy0, iz0, ix1, iy1, iz1, nx, ny, nz, speedsize FROM viewpos ORDER BY carmodel ASC LIMIT 212");
	mysql_tquery(MySQL,query,"SQL_LoadViewPos");

	return 1;
}
forward SQL_LoadViewPos();
public SQL_LoadViewPos()
{
	new rows;
	cache_get_row_count(rows);
	for(new i = 0; i < rows; i++)
	{
	    cache_get_value_name_float(i,"x",CarViewPos[i][0]);
		cache_get_value_name_float(i,"y",CarViewPos[i][1]);
		cache_get_value_name_float(i,"z",CarViewPos[i][2]);
		cache_get_value_name_float(i,"sx",CarSpeedPos[i][0]);
		cache_get_value_name_float(i,"sy",CarSpeedPos[i][1]);
		cache_get_value_name_float(i,"sz",CarSpeedPos[i][2]);
		cache_get_value_name_float(i,"srx",CarSpeedPos[i][3]);
		cache_get_value_name_float(i,"sry",CarSpeedPos[i][4]);
		cache_get_value_name_float(i,"srz",CarSpeedPos[i][5]);
		cache_get_value_name_float(i,"ix0",CarIndikatorPos[i][0][0]);//зад
		cache_get_value_name_float(i,"iy0",CarIndikatorPos[i][0][1]);
		cache_get_value_name_float(i,"iz0",CarIndikatorPos[i][0][2]);
		cache_get_value_name_float(i,"ix1",CarIndikatorPos[i][1][0]);//перед
		cache_get_value_name_float(i,"iy1",CarIndikatorPos[i][1][1]);
		cache_get_value_name_float(i,"iz1",CarIndikatorPos[i][1][2]);
		cache_get_value_name_float(i,"nx",CarNeonPos[i][0]);//лево
		cache_get_value_name_float(i,"ny",CarNeonPos[i][1]);
		cache_get_value_name_float(i,"nz",CarNeonPos[i][2]);
		cache_get_value_name_int(i,"speedsize",CarSpeedSize[i]);

	}
	return 1;
}

COMMAND:setindikatorpos(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    if(!IsPlayerInAnyVehicle(playerid))return 1;
	new p = GetPlayerVehicleID(playerid);
	new m = GetVehicleModel(p);
	new str[255];
	if(sscanf(params,"ffffff",
	CarIndikatorPos[m-400][0][0],
	CarIndikatorPos[m-400][0][1],
	CarIndikatorPos[m-400][0][2],
	CarIndikatorPos[m-400][1][0],
	CarIndikatorPos[m-400][1][1],
	CarIndikatorPos[m-400][1][2]))
	{
	    format(str,sizeof(str),"Зад: %f %f %f Перед: %f %f %f",
		CarIndikatorPos[m-400][0][0],
		CarIndikatorPos[m-400][0][1],
		CarIndikatorPos[m-400][0][2],
		CarIndikatorPos[m-400][1][0],
		CarIndikatorPos[m-400][1][1],
		CarIndikatorPos[m-400][1][2]);
		SendClientMessage(playerid,COLOR_WHITE,str);
        return SendClientMessage(playerid,COLOR_WHITE,"{ffcc99}Используйте: {d5d5d5}/setindikatorpos [x зад] [y зад] [z зад] [x перед] [y перед] [z перед]");
	}
	format(str,sizeof(str),"Новая позиция Зад: %f %f %f Перед: %f %f %f",
	CarIndikatorPos[m-400][0][0],
	CarIndikatorPos[m-400][0][1],
	CarIndikatorPos[m-400][0][2],
	CarIndikatorPos[m-400][1][0],
	CarIndikatorPos[m-400][1][1],
	CarIndikatorPos[m-400][1][2]);
	SendClientMessage(playerid,COLOR_GRAD2,str);
	format(str,sizeof(str),"UPDATE viewpos SET ix0='%f', iy0='%f', iz0='%f', ix1='%f',iy1='%f', iz1='%f' WHERE carmodel=%d",
    CarIndikatorPos[m-400][0][0],
	CarIndikatorPos[m-400][0][1],
	CarIndikatorPos[m-400][0][2],
	CarIndikatorPos[m-400][1][0],
	CarIndikatorPos[m-400][1][1],
	CarIndikatorPos[m-400][1][2],
    m);
    mysql_query(MySQL,str,false);
	if(!IsValidDynamicObject(CarIndikatorObject[p][0]))//зад пр
		CarIndikatorObject[p][0]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
	AttachDynamicObjectToVehicle(CarIndikatorObject[p][0],p,CarIndikatorPos[m-400][0][0],CarIndikatorPos[m-400][0][1],CarIndikatorPos[m-400][0][2], 0.0,0.0,0.0);
    if(!IsValidDynamicObject(CarIndikatorObject[p][1]))//зад лев
		CarIndikatorObject[p][1]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
	AttachDynamicObjectToVehicle(CarIndikatorObject[p][1],p,-CarIndikatorPos[m-400][0][0],CarIndikatorPos[m-400][0][1],CarIndikatorPos[m-400][0][2], 0.0,0.0,0.0);
	if(!IsValidDynamicObject(CarIndikatorObject[p][2]))//перед пр
		CarIndikatorObject[p][2]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
	AttachDynamicObjectToVehicle(CarIndikatorObject[p][2],p,CarIndikatorPos[m-400][1][0],CarIndikatorPos[m-400][1][1],CarIndikatorPos[m-400][1][2], 0.0,0.0,0.0);
	if(!IsValidDynamicObject(CarIndikatorObject[p][3]))//перед лев
		CarIndikatorObject[p][3]=CreateDynamicObject(19294,0.0,0.0,0.0, 0.0,0.0,0.0);
	AttachDynamicObjectToVehicle(CarIndikatorObject[p][3],p,-CarIndikatorPos[m-400][1][0],CarIndikatorPos[m-400][1][1],CarIndikatorPos[m-400][1][2], 0.0,0.0,0.0);
	return 1;
}
COMMAND:turntype(playerid,params[])
{
    new oldturntupe[32],newturntype[32];
	switch(PlayerInfo[playerid][pTurnType])
	{
		case 0:
        {
			oldturntupe="Все вместе";
            newturntype="Только лампы";
            PlayerInfo[playerid][pTurnType]=1;
        }
		case 1:
        {
			oldturntupe="Только лампы";
            newturntype="Только стрелка";
            PlayerInfo[playerid][pTurnType]=2;
        }
		case 2:
        {
			oldturntupe="Только стрелка";
            newturntype="Все вместе";
            PlayerInfo[playerid][pTurnType]=0;
        }
	}
    new str[144];
    format(str,144,"Старый тип переключения поворотников - [%s], новый тип - [%s]",oldturntupe,newturntype);
    SendClientMessage(playerid,COLOR_GRAD1,str);
    return 1;
}

COMMAND:changeview(playerid,params[])
{
	if(CameraViewUsed[playerid]==0)
	{
		new p = GetPlayerVehicleID(playerid);
		new m = GetVehicleModel(p);
		camobj[playerid] = CreateObject(19300, 0.0000, 0.0, 0.0, 0.0000, -1, -1, 100);
        speedobj[playerid] = CreateObject(19476, 0.0000, 0.0, 0.0, 0.0000, -1, -1, 100);
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
		    AttachObjectToVehicle(camobj[playerid],p,CarViewPos[m-400][0], CarViewPos[m-400][1],CarViewPos[m-400][2], 0.000000, 0.000000, 0.000000);
			AttachObjectToVehicle(speedobj[playerid],p,CarSpeedPos[m-400][0],CarSpeedPos[m-400][1],CarSpeedPos[m-400][2],CarSpeedPos[m-400][3],CarSpeedPos[m-400][4],CarSpeedPos[m-400][5]);
            SetObjectMaterialText(speedobj[playerid], "speedo 123");
		}
		else
		{
		    SendClientMessage(playerid,COLOR_WHITE,"Используйте /setviewpos для смены положения камеры");
			AttachObjectToPlayer(camobj[playerid],playerid,PlayerViewPos[playerid][0],PlayerViewPos[playerid][1],PlayerViewPos[playerid][2], 0.000000, 0.000000, 0.000000);
		}
		AttachCameraToObject(playerid,camobj[playerid]);
		CameraViewUsed[playerid]=1;
	}
	else if(CameraViewUsed[playerid]==1)
	{
		SetCameraBehindPlayer(playerid);
		DestroyObject(camobj[playerid]);
		DestroyObject(speedobj[playerid]);
		CameraViewUsed[playerid]=0;
	}
	return 1;
}
COMMAND:setviewpos(playerid,params[])
{
	if(CameraViewUsed[playerid]==0)return 1;
	if(!IsPlayerInAnyVehicle(playerid))
	{
	    new Float:pos[3];
	    if(sscanf(params,"fff",pos[0],pos[1],pos[2]))
	        return SendClientMessage(playerid,COLOR_WHITE,"{ffcc99}Используйте: {d5d5d5}/setviewpos [x] [y] [z]");
		if(PlayerInfo[playerid][pAdmin]==0 && (pos[0]>20.0||pos[0]<-20.0||pos[1]>20.0||pos[1]<-20.0||pos[2]>20.0||pos[2]<-20.0))
		    return SendClientMessage(playerid,COLOR_WHITE,"Изменение координат возможно в радиусе от -2.0 до 2.0");
        PlayerViewPos[playerid][0]=pos[0];
        PlayerViewPos[playerid][1]=pos[1];
        PlayerViewPos[playerid][2]=pos[2];
		AttachObjectToPlayer(camobj[playerid],playerid,PlayerViewPos[playerid][0],PlayerViewPos[playerid][1],PlayerViewPos[playerid][2], 0.000000, 0.000000, 0.000000);
        AttachCameraToObject(playerid,camobj[playerid]);
		new str[255];
		format(str,sizeof(str),"Новая позиция камеры x[%f] y[%f] z[%f]",PlayerViewPos[playerid][0],PlayerViewPos[playerid][1],PlayerViewPos[playerid][2]);
        SendClientMessage(playerid,COLOR_WHITE,str);
	}
	else if(PlayerInfo[playerid][pAdmin]>0)
	{
	    new p = GetPlayerVehicleID(playerid);
		new m = GetVehicleModel(p);
		new Float:pos[3];
	    if(sscanf(params,"fff",pos[0],pos[1],pos[2]))
	        return SendClientMessage(playerid,COLOR_WHITE,"{ffcc99}Используйте: {d5d5d5}/setviewpos [x] [y] [z]");
        if(pos[0]>20.0||pos[0]<-20.0||pos[1]>20.0||pos[1]<-20.0||pos[2]>20.0||pos[2]<-20.0)
		    return SendClientMessage(playerid,COLOR_WHITE,"Изменение координат возможно в радиусе от -5.0 до 5.0");
        CarViewPos[m-400][0]=pos[0];
        CarViewPos[m-400][1]=pos[1];
        CarViewPos[m-400][2]=pos[2];
		new str[255];
	    format(str,sizeof(str),"UPDATE viewpos SET x='%f', y='%f', z='%f' WHERE carmodel=%d",
	    CarViewPos[m-400][0],
	    CarViewPos[m-400][1],
	    CarViewPos[m-400][2],
	    m);
	    mysql_query(MySQL,str,false);
	    AttachObjectToVehicle(camobj[playerid],p,CarViewPos[m-400][0], CarViewPos[m-400][1],CarViewPos[m-400][2], 0.000000, 0.000000, 0.000000);
        AttachCameraToObject(playerid,camobj[playerid]);
        format(str,sizeof(str),"Новая позиция камеры x[%f] y[%f] z[%f]",CarViewPos[m-400][0], CarViewPos[m-400][1],CarViewPos[m-400][2]);
        SendClientMessage(playerid,COLOR_WHITE,str);
	}
	return 1;
}
COMMAND:setspeedpos(playerid,params[])
{
    if(CameraViewUsed[playerid]==0)return 1;
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    if(!IsPlayerInAnyVehicle(playerid))return 1;
    new p = GetPlayerVehicleID(playerid);
	new m = GetVehicleModel(p);
	new Float:pos[6],size;
    if(sscanf(params,"ffffffd",pos[0],pos[1],pos[2],pos[3],pos[4],pos[5],size))
        return SendClientMessage(playerid,COLOR_WHITE,"{ffcc99}Используйте: {d5d5d5}/setspeedpos [x] [y] [z] [rx] [ry] [rz] [size]");
    if(pos[0]>5.0||pos[0]<-5.0||pos[1]>5.0||pos[1]<-5.0||pos[2]>5.0||pos[2]<-5.0)
	    return SendClientMessage(playerid,COLOR_WHITE,"Изменение координат возможно в радиусе от -5.0 до 5.0");
    CarSpeedPos[m-400][0]=pos[0];
    CarSpeedPos[m-400][1]=pos[1];
    CarSpeedPos[m-400][2]=pos[2];
    CarSpeedPos[m-400][3]=pos[3];
    CarSpeedPos[m-400][4]=pos[4];
    CarSpeedPos[m-400][5]=pos[5];
    CarSpeedSize[m-400]=size;
	new str[255];
    format(str,sizeof(str),"UPDATE viewpos SET sx='%f', sy='%f', sz='%f', srx='%f', sry='%f', srz='%f', speedsize=%d WHERE carmodel=%d",
    CarSpeedPos[m-400][0],
    CarSpeedPos[m-400][1],
    CarSpeedPos[m-400][2],
    CarSpeedPos[m-400][3],
    CarSpeedPos[m-400][4],
    CarSpeedPos[m-400][5],
    CarSpeedSize[m-400],
    m);
    mysql_query(MySQL,str,false);
    AttachObjectToVehicle(speedobj[playerid],p,CarSpeedPos[m-400][0], CarSpeedPos[m-400][1],CarSpeedPos[m-400][2], CarSpeedPos[m-400][3], CarSpeedPos[m-400][4], CarSpeedPos[m-400][5]);
    format(str,sizeof(str),"Новая позиция спидометра x[%f] y[%f] z[%f]",CarSpeedPos[m-400][0], CarSpeedPos[m-400][1],CarViewPos[m-400][2],CarSpeedPos[m-400][3],CarSpeedPos[m-400][4],CarSpeedPos[m-400][5]);
    SendClientMessage(playerid,COLOR_WHITE,str);
    return 1;
}

new PlayerCarIntSpeed[MAX_PLAYERS];
new PlayerCarSpeedBit[MAX_PLAYERS];
new Float:vehpos[3];
new speedstr[64];
new speedmodelupd[MAX_PLAYERS];
stock CameraOnPlayerUpdate(playerid)
{
	if(CameraViewUsed[playerid])
	{
	    if(CarAlarms[SpeedoInfo[playerid][sdcarid]])
	    {
	        if(fifthsecbit==1)
 				format(speedstr,64,"{FFCC00}< >{FFFFFF}%0.1f {FF4500}%03d",Gas[SpeedoInfo[playerid][sdcarid]],PlayerCarIntSpeed[playerid]);
 			else
 				format(speedstr,64,"{FFFFFF}< >%0.1f {FF4500}%03d",Gas[SpeedoInfo[playerid][sdcarid]],PlayerCarIntSpeed[playerid]);
		}
	    else
	    {
		    switch(gPlayerIndikator[playerid])
			{
		        case 1:
		        {
	                format(speedstr,64,"{FFFFFF}< >%0.1f {FF4500}%03d",Gas[SpeedoInfo[playerid][sdcarid]],PlayerCarIntSpeed[playerid]);
				}
				case 2://левый
				{
				    if(fifthsecbit==1)
	     				format(speedstr,64,"{FFCC00}< {FFFFFF}>%0.1f {FF4500}%03d",Gas[SpeedoInfo[playerid][sdcarid]],PlayerCarIntSpeed[playerid]);
	     			else
	     				format(speedstr,64,"{FFFFFF}< >%0.1f {FF4500}%03d",Gas[SpeedoInfo[playerid][sdcarid]],PlayerCarIntSpeed[playerid]);
				}
				case 3://правый
				{
				    if(fifthsecbit==1)
				 		format(speedstr,64,"{FFFFFF}< {FFCC00}>{FFFFFF}%0.1f {FF4500}%03d",Gas[SpeedoInfo[playerid][sdcarid]],PlayerCarIntSpeed[playerid]);
				 	else
				 		format(speedstr,64,"{FFFFFF}< >%0.1f {FF4500}%03d",Gas[SpeedoInfo[playerid][sdcarid]],PlayerCarIntSpeed[playerid]);
				}
		   	}
	   	}
		if(PlayerCarSpeedBit[playerid]==0)
		{
		    GetVehiclePos(SpeedoInfo[playerid][sdcarid],vehpos[0],vehpos[1],vehpos[2]);
		    DestroyObject(speedobj[playerid]);
		    speedobj[playerid] = CreateObject(19476, vehpos[0],vehpos[1],vehpos[2], 0, 0, 0);
		    SetObjectMaterialText(speedobj[playerid], speedstr, 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", CarSpeedSize[speedmodelupd[playerid]]);
			AttachObjectToVehicle(speedobj[playerid],SpeedoInfo[playerid][sdcarid],CarSpeedPos[speedmodelupd[playerid]][0],CarSpeedPos[speedmodelupd[playerid]][1],CarSpeedPos[speedmodelupd[playerid]][2],CarSpeedPos[speedmodelupd[playerid]][3],CarSpeedPos[speedmodelupd[playerid]][4],CarSpeedPos[speedmodelupd[playerid]][5]);
			PlayerCarSpeedBit[playerid]=500;
		}
		else
		{
		    SetObjectMaterialText(speedobj[playerid], speedstr, 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", CarSpeedSize[speedmodelupd[playerid]]);
		    PlayerCarSpeedBit[playerid]--;
		}
	}
	return 1;
}