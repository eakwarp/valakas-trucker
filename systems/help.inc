stock CreateHelpDraw(playerid)
{
    HelpDraw[playerid] = TextDrawCreate(15.000000,425.000000,"~b~trucker.valakas.ru ~r~/help");
	TextDrawAlignment(HelpDraw[playerid],0);
	TextDrawBackgroundColor(HelpDraw[playerid],0x00000066);
	TextDrawFont(HelpDraw[playerid],1);
	TextDrawLetterSize(HelpDraw[playerid],0.299999,1.300000);
	TextDrawColor(HelpDraw[playerid],0xffffffff);
	TextDrawSetOutline(HelpDraw[playerid],1);
	TextDrawSetProportional(HelpDraw[playerid],1);
    TextDrawShowForPlayer(playerid, HelpDraw[playerid]);
	return 1;
}
stock DestroyHelpDraw(playerid)
{
    TextDrawHideForPlayer(playerid, HelpDraw[playerid]);
    TextDrawDestroy(HelpDraw[playerid]);
    return 1;
}

stock SetHelpDraw(playerid,str[])
{
    TextDrawHideForPlayer(playerid, HelpDraw[playerid]);
    TextDrawSetString(HelpDraw[playerid],str);
    TextDrawShowForPlayer(playerid, HelpDraw[playerid]);
	return 1;
}

COMMAND:help(playerid,params[])
{
	new str[4096];
	strcat(str,"{FFFF00}Основное: {FFFFFF}/help /stats /pay /report /question /request /truckstop /hotel /food /repair /buy /buycar /gps /convoy /rc\n");
    strcat(str,"{FFFF00}Основное: {FFFFFF}/speedo /speedlimit /park /delivery /engine /open /lights /note /givemyfuel /closestdelivery /animlist\n");
	strcat(str,"{FFFF00}Основное: {FFFFFF}/usereservefuel\n");
	strcat(str,"{FFFF00}Чаты: {FFFFFF}/me /do /todo /try /b /l(ocal) /c(lose) /s(hout) /r /o(oc)\n");
	strcat(str,"{FFFF00}Телефон: {FFFFFF}/call /p /h /sms /togphone\n");
	if(PlayerInfo[playerid][pPoints] >= 1000)
	{
		strcat(str,"{FFFF00}Компания: {FFFFFF}/opencompany");
		if(PlayerInfo[playerid][pCompany]!=-1)
		    strcat(str," /closecompany /companywithdraw /companybank /invite\n");
		else
		    strcat(str,"\n");
	}
	if(PlayerInfo[playerid][pAdmin]>0)
	{
		strcat(str,"\n{FFFF00}Админское: {FFFFFF}/a /hs /an(swer) /noooc /makeadmin /makehelper /mute /jail /kick /ban /fixveh \n");
        strcat(str,"{FFFF00}Админское: {FFFFFF}/check /dn /up /bk /lt /rt /ft /fly /uppfly /endround /setstat /respawncar /regsshow\n");
		strcat(str,"{FFFF00}Админское: {FFFFFF}/veh /destroycars /fillplayercar\n");
		strcat(str,"{FFFF00}Телепорты: {FFFFFF}/gotocar /getcar /entercar /mark /gotomark /goto /gethere /backhere /tpto\n");
		strcat(str,"{FFFF00}Трак стопы: {FFFFFF}/truckstopcreate /truckstopcam /truckstoplabel /truckstoppos /truckstopname\n");
		strcat(str,"{FFFF00}Прицепы: {FFFFFF}/trailercreate /trailersetpos\n");
		strcat(str,"{FFFF00}Бизнессы: {FFFFFF}/propshow /propcreate /propsetname /propsetpos /propdelete\n");
		strcat(str,"{FFFF00}Задания доставки: {FFFFFF}/deliveryshow /deliverycreate /deliverysetprod /deliverysetstart\n");
        strcat(str,"/deliverysetend /deliverysetfragility /deliverysetprice /deliverysettrailer /deliverydelete\n");
		strcat(str,"{FFFF00}Заправки: {FFFFFF}/gasshow /gascreate /gassetpos /gasdelete\n");
		strcat(str,"{FFFF00}Мобильные башни: {FFFFFF}/mobilestationshow /mobilestationcreate /mobilestationsetpos /mobilestationdelete\n");
		strcat(str,"{FFFF00}Забегаловки: {FFFFFF}/foodshow /foodcreate /foodsetint /foodsetname /fooddelete\n");
		strcat(str,"{FFFF00}Мотели: {FFFFFF}/hotelshow /hotelcreate /hotelsetprice /hotelsetname /hotelsetint /hoteldelete(\n");
		strcat(str,"{FFFF00}Радары: {FFFFFF}/radarshow /radarcreate /radarzone /radardelete\n");
		strcat(str,"{FFFF00}Автосервисы: {FFFFFF}/repairshow /repaircreate /repairlabel /repairname /repairdelete\n");
		strcat(str,"{FFFF00}Магазины: {FFFFFF}/magazineshow /magazinecreate /magazinesetname /magezinesetint /magazinedelete\n");
		strcat(str,"{FFFF00}Дорожные работы: {FFFFFF}/roadworkshow /roadworkcreate /roadworksetname /roadworkfile /roadworkdelete\n");
        strcat(str,"{FFFF00}Офисы: {FFFFFF}/officeshow /officecreate /officesetint /officesetname /officedelete\n");
		strcat(str,"{FFFF00}Банкоматы: {FFFFFF}/atmshow /atmcreate /atmdelete\n");
	}
	else if(PlayerInfo[playerid][pHelper]>0)
	    strcat(str,"{FFFF00}Хелперское: {FFFFFF}/hs /an(swer)\n");

	ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Комманды:",str,"Ок","");
	return 1;
}

stock ShowStats(playerid,giveplayerid)
{
	new str[2048];
	format(str,sizeof(str),"{FFFF00}Денег\t\t\t{FFFFFF}%d$\n{FFFF00}Очков доставки\t{FFFFFF}%d\n{FFFF00}Номер телефона\t{FFFFFF}%d",
	PlayerInfo[playerid][pMoney],PlayerInfo[playerid][pPoints],PlayerInfo[playerid][pPhone]);
	switch(PlayerInfo[playerid][pPhoneOnline])
	{
	    case 0:format(str,sizeof(str),"%s (выключен)\n",str);
		case 1:format(str,sizeof(str),"%s (включен)\n",str);
	}
	switch(PlayerInfo[playerid][pSex])
	{
		case 1:format(str,sizeof(str),"%s{FFFF00}Пол\t\t\t{FFFFFF}Мужской\n",str);
		case 2:format(str,sizeof(str),"%s{FFFF00}Пол\t\t\t{FFFFFF}Женский\n",str);
	}
	format(str,sizeof(str),"%s{FFFF00}Грузовик\t\t{FFFFFF}%s\n{FFFF00}Пробег\t\t{FFFFFF}%0.1f\n{FFFF00}Тракстоп\t\t{FFFFFF}%s(%d)\n{FFFF00}Голод\t\t\t{FFFFFF}%0.1f процентов\n{FFFF00}Усталость\t\t{FFFFFF}%0.1f процентов\n",
	str,
	CarName[PlayerInfo[playerid][pCarModel]-400],
	PlayerInfo[playerid][pCarMileage]/10000,
	TruckStopInfo[PlayerInfo[playerid][pTruckStop]][tsName],
	PlayerInfo[playerid][pTruckStop],
	PlayerInfo[playerid][pHunger],
	PlayerInfo[playerid][pFatigue]);
	if(PlayerInfo[giveplayerid][pAdmin])
	{
	    format(str,sizeof(str),"%s{FFFF00}Админ уровень\t{FFFFFF}%d\n{FFFF00}Хелпер уровень\t{FFFFFF}%d\n{FFFF00}ID автомобиля\t{FFFFFF}%d\n{FFFF00}Мут\t\t\t{FFFFFF}%d\n{FFFF00}Тюрьма\t\t{FFFFFF}%d\n{FFFF00}Доставка\t\t{FFFFFF}%d",
		str,
		PlayerInfo[playerid][pAdmin],
	    PlayerInfo[playerid][pHelper],
	    PlayerInfo[playerid][pCarID],
	    PlayerInfo[playerid][pMutedTime],
	    PlayerInfo[playerid][pJailTime],
		PlayerInfo[playerid][pDeliveryID]);
	}
	return ShowPlayerDialog(giveplayerid,0,DIALOG_STYLE_MSGBOX,GetPlayerNameEx(playerid),str,"Ок","");
}
COMMAND:stats(playerid,params[])
	return ShowStats(playerid,playerid);
