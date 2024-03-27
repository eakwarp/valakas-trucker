enum vehbuyinfo
{
	Float:vehbuyX,
	Float:vehbuyY,
	Float:vehbuyZ,
	Float:vehbuyRot,
	Float:vehbuyCamX,
	Float:vehbuyCamY,
	Float:vehbuyCamZ,
	Float:vehbuyLabelX,
	Float:vehbuyLabelY,
	Float:vehbuyLabelZ
};
new VehBuyInfo[][vehbuyinfo]=
{
{-1979.4104,256.8810,35.7783,28.9853
,-1992.2097,262.1118,35.1794
,-1967.9695,294.1730,35.1719} // вход в ванг карс
};
stock VehBuyInit()
{
    for(new i=0; i<sizeof(VehBuyInfo); i++)
	{
	    CreateDynamic3DTextLabel("[/buycar]", COLOR_GREEN,VehBuyInfo[i][vehbuyLabelX], VehBuyInfo[i][vehbuyLabelY], VehBuyInfo[i][vehbuyLabelZ], 15.0);
		CreateDynamicPickup(1239,2,VehBuyInfo[i][vehbuyLabelX], VehBuyInfo[i][vehbuyLabelY], VehBuyInfo[i][vehbuyLabelZ]);
	}
	return 1;
}
new VehBuyID[MAX_PLAYERS];
COMMAND:buycar(playerid,params[])
{
	if(oGetPlayerMoney(playerid)<0)
	    return SendClientMessage(playerid, COLOR_GRAD2, vehbuytext1);
	if(PlayerInfo[playerid][pPoints] < 50)
	    return SendClientMessage(playerid, COLOR_GRAD2, vehbuytext2);
    if(PlayerInfo[playerid][pDeliveryID]!=-1)
        return SendClientMessage(playerid, COLOR_GRAD2, vehbuytext3);
	PlayerVehBuy(playerid,0);
	return 1;
}
stock PlayerVehBuy(playerid,bit)
{
	switch(bit)
	{
	    case 0://вход в магазин
	    {
	        for(new i=0; i<sizeof(VehBuyInfo); i++)
			{
			    if(IsPlayerInRangeOfPoint(playerid,5.0,VehBuyInfo[i][vehbuyLabelX], VehBuyInfo[i][vehbuyLabelY], VehBuyInfo[i][vehbuyLabelZ]))
     			{
     			    new fullprice=CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carPrice];
					new milstr[32];
					format(milstr,sizeof(milstr),"%0.1f",PlayerInfo[playerid][pCarMileage]/10000);
					new mil=strval(milstr);
					new milliage = (fullprice/100*(mil/500))/2;
					new health = (fullprice/100*(PlayerInfo[playerid][pCarFullHealth]/10))/2;
					new price=fullprice-milliage-health;
     			    if(PlayerInfo[playerid][pCarRadarDetector])
                        price+=10000;
					if(PlayerInfo[playerid][pCarFuelTank])
						price+=20000;
					if(PlayerInfo[playerid][pCarRadio])
						price+=7000;
					if(PlayerInfo[playerid][pCarAdditive])
						price+=12000;
					if(PlayerInfo[playerid][pCarNeck])
						price+=15000;
     			    new str[2048];
     			    strcat(str,
					vehbuytext4);
					new pricestr[24];
					format(pricestr,24,"%d",price);
     			    strcat(str,pricestr);

     			    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,vehbuytext5,str,"ќк","");
			        gPlayerChangeTruck[playerid]=4;
			        VehBuyID[playerid]=i;
			        BuyShowPlayerTruck(playerid);
			        TextDrawShowForPlayer(playerid,ChangeText);
			        TogglePlayerControllable(playerid,0);
				    SetPlayerInterior(playerid,0);
					SetPlayerVirtualWorld(playerid,playerid);
				    SetPlayerCameraPos(playerid,VehBuyInfo[i][vehbuyCamX],VehBuyInfo[i][vehbuyCamY],VehBuyInfo[i][vehbuyCamZ]);
				    SetPlayerCameraLookAt(playerid,VehBuyInfo[i][vehbuyX],VehBuyInfo[i][vehbuyY],VehBuyInfo[i][vehbuyZ]);
	 				return 1;
	 		    }
			}
			SendClientMessage(playerid, COLOR_GRAD2, vehbuytext6);
	    }
		case 1://влево
		{
		    TruckChange[playerid]--;
		    if(TruckChange[playerid] < 0)
		        TruckChange[playerid]=sizeof(CarInfo);
		    BuyShowPlayerTruck(playerid);
		}
		case 2://вправо
		{
		    TruckChange[playerid]++;
		    if(TruckChange[playerid] >= sizeof(CarInfo))
		        TruckChange[playerid]=0;
		    BuyShowPlayerTruck(playerid);
		}
		case 3://купить
		{
		    if(PlayerInfo[playerid][pPoints]<CarInfo[TruckChange[playerid]][carPoints])
		    {
		        ExitShowPlayerTruck(playerid);
    			return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,vehbuytext7,vehbuytext8,"ќк","");
            }
			if(oGetPlayerMoney(playerid)<CarInfo[TruckChange[playerid]][carPrice])
			{
			    ExitShowPlayerTruck(playerid);
				return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,vehbuytext7,vehbuytext9,"ќк","");
			}
			new fullprice=CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carPrice];
			new milstr[32];
			format(milstr,sizeof(milstr),"%0.1f",PlayerInfo[playerid][pCarMileage]/10000);
			new mil=strval(milstr);
			new milliage = (fullprice/100*(mil/500))/2;
			new health = (fullprice/100*(PlayerInfo[playerid][pCarFullHealth]/10))/2;
			new price=fullprice-milliage-health;
		    if(PlayerInfo[playerid][pCarRadarDetector])
                price+=10000;
			if(PlayerInfo[playerid][pCarFuelTank])
				price+=20000;
			if(PlayerInfo[playerid][pCarRadio])
				price+=7000;
			if(PlayerInfo[playerid][pCarAdditive])
				price+=12000;
			if(PlayerInfo[playerid][pCarNeck])
				price+=15000;
			if(PlayerInfo[playerid][pCarDamper])
			    price+=30000;
			new str[255];
			oGivePlayerMoney(playerid,price);
			oGivePlayerMoney(playerid,-CarInfo[TruckChange[playerid]][carPrice]);
			PlayerInfo[playerid][pCarModel]=CarInfo[TruckChange[playerid]][carModel];
			format(str,sizeof(str),vehbuytext10,
			CarName[PlayerInfo[playerid][pCarModel]-400],
			CarInfo[TruckChange[playerid]][carPrice],
			price);
			ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,vehbuytext11,str,"ќк","");
			Gas[PlayerInfo[playerid][pCarID]]=100.0;
			PlayerInfo[playerid][pCarMileage]=0.0;
			PlayerInfo[playerid][pCarGas]=100.0;
			PlayerInfo[playerid][pCarDamagePanels]=0;
			PlayerInfo[playerid][pCarDamageDoors]=0;
			PlayerInfo[playerid][pCarDamageLights]=0;
			PlayerInfo[playerid][pCarDamageTires]=0;
			PlayerInfo[playerid][pCarOilFilter]=0.0;
			PlayerInfo[playerid][pCarAirFilter]=0.0;
			PlayerInfo[playerid][pCarBattary]=0.0;
			PlayerInfo[playerid][pCarOil]=0.0;
			PlayerInfo[playerid][pCarGaskets]=0.0;
			PlayerInfo[playerid][pCarSpark]=0.0;
			PlayerInfo[playerid][pCarHP]=1000.0;
			PlayerInfo[playerid][pCarFullHealth]=1000;
			PlayerInfo[playerid][pCarRadarDetector]=0;
			PlayerInfo[playerid][pCarFuelTank]=0;
			PlayerInfo[playerid][pCarRadio]=0;
			PlayerInfo[playerid][pCarAdditive]=0;
			PlayerInfo[playerid][pCarNeck]=0;
			ExitShowPlayerTruck(playerid);
		}

	}
	return 1;
}

stock ExitShowPlayerTruck(playerid)
{
    TextDrawHideForPlayer(playerid,ChangeText);
    gPlayerChangeTruck[playerid]=0;
    SetCameraBehindPlayer(playerid);
    TogglePlayerControllable(playerid,1);
	SetPlayerVirtualWorld(playerid,0);
	SetHelpDraw(playerid,vehbuytext12);
    DestroyVehicle(PlayerInfo[playerid][pCarID]);
	PlayerInfo[playerid][pCarID]=CreateVehicle(PlayerInfo[playerid][pCarModel],VehBuyInfo[VehBuyID[playerid]][vehbuyX],VehBuyInfo[VehBuyID[playerid]][vehbuyY],VehBuyInfo[VehBuyID[playerid]][vehbuyZ],VehBuyInfo[VehBuyID[playerid]][vehbuyRot],PlayerInfo[playerid][pCarColor1]=random(126),PlayerInfo[playerid][pCarColor2]=random(126),120000);
    new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(PlayerInfo[playerid][pCarID],engine,lights,alarm,doors,bonnet,boot,objective);
	SetVehicleParamsEx(PlayerInfo[playerid][pCarID],VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);

	return 1;
}
stock BuyShowPlayerTruck(playerid)
{
    new i = VehBuyID[playerid];
    new b = TruckChange[playerid];
	
    DestroyVehicle(PlayerInfo[playerid][pCarID]);
	PlayerInfo[playerid][pCarID]=CreateVehicle(CarInfo[b][carModel],VehBuyInfo[i][vehbuyX],VehBuyInfo[i][vehbuyY],VehBuyInfo[i][vehbuyZ],VehBuyInfo[i][vehbuyRot],PlayerInfo[playerid][pCarColor1]=random(126),PlayerInfo[playerid][pCarColor2]=random(126),120000);
	SetVehicleVirtualWorld(PlayerInfo[playerid][pCarID],playerid);
	new str[255];
    if(PlayerInfo[playerid][pPoints]<CarInfo[b][carPoints])
    {
        format(str,sizeof(str),vehbuytext13,
        CarName[CarInfo[b][carModel]-400],
        CarInfo[b][carPoints]);
    }
    else
    {
	    format(str,sizeof(str),vehbuytext14,
		CarName[CarInfo[b][carModel]-400],
		CarInfo[b][carPrice],
		CarInfo[b][carCapacity]);
	}
    SetHelpDraw(playerid,str);
	return 1;
}

stock GetBuyIDFromModel(model)
{
	new i;
	switch(model)
	{
	    case 440://Rumpo
	        i=0;
        case 499://Benson
            i=1;
	    case 403://Linerunner
	        i=2;
        case 413://Pony
	        i=3;
        case 482://Burrito
	        i=4;
	    case 498://Boxville
	        i=5;
	    case 414://Mule
	        i=6;
	    case 514://Petrol Tanker
	        i=7;
	    case 456://Yankee
	    	i=8;
	    case 455://Flatbed
	    	i=9;
	    case 515://Roadtrain
	    	i=10;
	}
	return i;
}