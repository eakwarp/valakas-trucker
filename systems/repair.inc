
enum repairinfo
{
	repairValid,
	Float:repairX,
	Float:repairY,
	Float:repairZ,
	repairName[64],
	Float:repairLabelX,
	Float:repairLabelY,
	Float:repairLabelZ,
	repairPickup,//не сохранять
	repairLabelPickup,//не сохранять
};
new RepairInfo[MAX_REPAIRS][repairinfo];
new Text3D:RepairLabel[MAX_REPAIRS];
new RepairIcon[MAX_REPAIRS];
stock LoadRepair(i)
{
	new query[255],Field[255];
	format(query,sizeof(query),"SELECT repairX, repairY, repairZ, repairName, repairLabelX, repairLabelY, repairLabelZ FROM repairs WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>fffs[64]fff",
        RepairInfo[i][repairX],
        RepairInfo[i][repairY],
        RepairInfo[i][repairZ],
        RepairInfo[i][repairName],
        RepairInfo[i][repairLabelX],
        RepairInfo[i][repairLabelY],
        RepairInfo[i][repairLabelZ]);
		RepairInfo[i][repairValid]=1;
		RepairLabel[i]=CreateDynamic3DTextLabel(RepairInfo[i][repairName], COLOR_GREEN, RepairInfo[i][repairLabelX],
        RepairInfo[i][repairLabelY],
        RepairInfo[i][repairLabelZ], 15.0);
		RepairInfo[i][repairLabelPickup]=CreateDynamicPickup(1239,2, RepairInfo[i][repairLabelX],
        RepairInfo[i][repairLabelY],
        RepairInfo[i][repairLabelZ]);
        RepairInfo[i][repairPickup]=CreateDynamicPickup(3096,2, RepairInfo[i][repairX],
        RepairInfo[i][repairY],
        RepairInfo[i][repairZ]);
        RepairIcon[i]=CreateDynamicMapIcon(RepairInfo[i][repairX],
        RepairInfo[i][repairY],
        RepairInfo[i][repairZ],27, -1,-1,-1, -1, 250.0);
	}
	else
	    RepairInfo[i][repairValid]=0;
	mysql_free_result();
	return 1;
}
stock RepairInit()
{
    for(new i=0; i<MAX_REPAIRS; i++)
        LoadRepair(i);
    return 1;
}
stock SaveRepair(i)
{
	if(RadarInfo[i][radarValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE repairs SET repairX='%f', repairY='%f', repairZ='%f', repairName='%s', repairLabelX='%f', repairLabelY='%f', repairLabelZ='%f' WHERE id=%d",
        RepairInfo[i][repairX],
        RepairInfo[i][repairY],
        RepairInfo[i][repairZ],
        RepairInfo[i][repairName],
        RepairInfo[i][repairLabelX],
        RepairInfo[i][repairLabelY],
        RepairInfo[i][repairLabelZ],
		i);
		mysql_query(query);
		DestroyDynamic3DTextLabel(GasLabel[i]);
		RepairLabel[i]=CreateDynamic3DTextLabel(RepairInfo[i][repairName], COLOR_GREEN, RepairInfo[i][repairLabelX],
        RepairInfo[i][repairLabelY],
        RepairInfo[i][repairLabelZ], 15.0);
		DestroyDynamicPickup(RepairInfo[i][repairLabelPickup]);
		RepairInfo[i][repairLabelPickup]=CreateDynamicPickup(1239,2, RepairInfo[i][repairLabelX],
        RepairInfo[i][repairLabelY],
        RepairInfo[i][repairLabelZ]);
        DestroyDynamicPickup(RepairInfo[i][repairPickup]);
        RepairInfo[i][repairPickup]=CreateDynamicPickup(3096,2, RepairInfo[i][repairX],
        RepairInfo[i][repairY],
        RepairInfo[i][repairZ]);
        DestroyDynamicMapIcon(RepairIcon[i]);
        RepairIcon[i]=CreateDynamicMapIcon(RepairInfo[i][repairX],
        RepairInfo[i][repairY],
        RepairInfo[i][repairZ],27, -1,-1,-1, -1, 250.0);
	}
	return 1;
}

stock CreateRepair(playerid,name[])
{
	for(new i=0; i<MAX_REPAIRS; i++)
	{
		if(!RepairInfo[i][repairValid])
		{
		    GetPlayerPos(playerid, RepairInfo[i][repairX],
		    RepairInfo[i][repairY],
		    RepairInfo[i][repairZ]);
		    new query[255];
		    format(query,sizeof(query),"INSERT INTO repairs SET repairX='%f', repairY='%f', repairZ='%f', repairName='%s', id=%d",
            RepairInfo[i][repairX],
		    RepairInfo[i][repairY],
		    RepairInfo[i][repairZ],
	        name,
	        i);
	        mysql_query(query);
	        LoadRepair(i);
			return i;
		}
	}
	return 1;
}
COMMAND:repaircreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new name[64];
    if(sscanf(params, "s[64]",name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /repaircreate [название]");
    new i=CreateRepair(playerid,name);
    new str[128];
    format(str,sizeof(str),"Вы создали ремонт %d, название %s",i,RepairInfo[i][repairName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:repairshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowRepair(playerid,0,29);
    return 1;
}

stock ShowRepair(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_REPAIRS; i++)
    {
        if(RepairInfo[i][repairValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%s\n",
            str,
            i,
        	FoodInfo[i][foodName]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список ремонтов [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_REPAIRLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoRepair(playerid,i)
{
	SetPlayerPos(playerid,RepairInfo[i][repairX],
    RepairInfo[i][repairY],
    RepairInfo[i][repairZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к ремонту %d (%s)",i,RepairInfo[i][repairName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:repairdelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /repairdelete [id ремонта]");
    RepairInfo[i][repairValid]=0;
    DestroyDynamic3DTextLabel(GasLabel[i]);
	DestroyDynamicPickup(RepairInfo[i][repairLabelPickup]);
    DestroyDynamicPickup(RepairInfo[i][repairPickup]);
    DestroyDynamicMapIcon(RepairIcon[i]);
    format(str,sizeof(str),"DELETE FROM repairs WHERE id=%d",i);
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили ремонт %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:repairlabel(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if(sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /repairlabel [id ремонта]");
	GetPlayerPos(playerid,RepairInfo[i][repairLabelX],
    RepairInfo[i][repairLabelY],
    RepairInfo[i][repairLabelZ]);
    SaveRepair(i);
    new str[128];
    format(str,sizeof(str),"Вы установили позицию 3д текста ремонта %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:repairname(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,name[64];
    if(sscanf(params, "is[64]",i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /repairname [id ремонта] [название]");
	format(RepairInfo[i][repairName],64,name);
	SaveRepair(i);
	new str[128];
    format(str,sizeof(str),"Вы установили название ремонта %d - %s",i,name);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:respawncar(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
	    new carid;
	    if (!sscanf(params, "i", carid))
		{
			if(carid!=0)
			{
				SetVehicleToRespawn(carid);
			}
		}
		else if(IsPlayerInAnyVehicle(playerid))
		{
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			return 1;
		}
		else SendClientMessage(playerid, COLOR_RED, "[Ошибка] Internal error!");
	}
	return 1;
}


COMMAND:repair(playerid,params[])
{
	if(IsPlayerInAnyVehicle(playerid))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не можете чинить машину изнутри");
    new Float:v1pos[3];
	GetVehiclePos(PlayerInfo[playerid][pCarID],v1pos[0],v1pos[1],v1pos[2]);
	if(!IsPlayerInRangeOfPoint(playerid,5.0,v1pos[0],v1pos[1],v1pos[2]))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы слишком далеко от вашей машины");
    GetVehicleDamageStatus(PlayerInfo[playerid][pCarID],
	PlayerInfo[playerid][pCarDamagePanels],
	PlayerInfo[playerid][pCarDamageDoors],
	PlayerInfo[playerid][pCarDamageLights],
	PlayerInfo[playerid][pCarDamageTires]);
    for(new i=0; i<MAX_REPAIRS; i++)
	{
		if(RadarInfo[i][radarValid])
		{
		    if(IsPlayerInRangeOfPoint(playerid,10.0,RepairInfo[i][repairX],RepairInfo[i][repairY],RepairInfo[i][repairZ]))
	    	{
	    	    new str[1024];
	    	    new strm[4][32];
				if(PlayerInfo[playerid][pCarDamagePanels])
				    strm[0]="битые";
				else
				    strm[0]="целые";
				if(PlayerInfo[playerid][pCarDamageDoors])
				    strm[1]="битые";
				else
				    strm[1]="целые";
				if(PlayerInfo[playerid][pCarDamageLights])
				    strm[2]="битые";
				else
				    strm[2]="целые";
				if(PlayerInfo[playerid][pCarDamageTires])
				    strm[3]="битые";
				else
				    strm[3]="целые";
	    	    format(str,sizeof(str),
				"Заменить панели(%s)[300$]\nЗаменить двери(%s)[200$]\nЗаменить фары(%s)[130$]\nЗаменить колеса(%s)[400$]\nЗаменить маслянный фильтер(заменен %0.1f миль назад)[30$]\nЗаменить воздушный фильтер(заменен %0.1f миль назад)[35$]\nЗаменить аккумулятор(заменен %0.1f миль назад)[210$]\nЗаменить масло(замененл %0.1f миль назад)[70$]\nЗаменить прокладки(заменены %0.1f миль назад)[160$]\nЗаменить свечи(заменены %0.1f миль назад)[130$]\nОтремонтировать двигатель(Состояние %0.1f процентов)[600$]",
				strm[0],
				strm[1],
				strm[2],
				strm[3],
				(PlayerInfo[playerid][pCarMileage]-PlayerInfo[playerid][pCarOilFilter])/10000,
				(PlayerInfo[playerid][pCarMileage]-PlayerInfo[playerid][pCarAirFilter])/10000,
				(PlayerInfo[playerid][pCarMileage]-PlayerInfo[playerid][pCarBattary])/10000,
				(PlayerInfo[playerid][pCarMileage]-PlayerInfo[playerid][pCarOil])/10000,
				(PlayerInfo[playerid][pCarMileage]-PlayerInfo[playerid][pCarGaskets])/10000,
				(PlayerInfo[playerid][pCarMileage]-PlayerInfo[playerid][pCarSpark])/10000,
				PlayerInfo[playerid][pCarHP]/10);
	    	    ShowPlayerDialog(playerid,DIALOG_REPAIR,DIALOG_STYLE_LIST,"Диагностика вашего автомобиля",str,"Выбор","Отмена");
				return 1;
			}
		}
	}
	SendClientMessage(playerid, COLOR_GRAD2, "Вы слишком далеко от ближайшего сервиса");
	return 1;
}

stock PlayerInRepair(playerid,listitem)
{
	switch(listitem)
	{
	    case 0://панели
		{
		    PlayerInfo[playerid][pCarDamagePanels]=0;
		    UpdateVehicleDamageStatus(PlayerInfo[playerid][pCarID],PlayerInfo[playerid][pCarDamagePanels],PlayerInfo[playerid][pCarDamageDoors],PlayerInfo[playerid][pCarDamageLights],PlayerInfo[playerid][pCarDamageTires]);
			oGivePlayerMoney(playerid,-300);
			Me(playerid, "заменил панели на своем грузовике",30.0);
		}
		case 1://двери
		{
		    PlayerInfo[playerid][pCarDamageDoors]=0;
		    UpdateVehicleDamageStatus(PlayerInfo[playerid][pCarID],PlayerInfo[playerid][pCarDamagePanels],PlayerInfo[playerid][pCarDamageDoors],PlayerInfo[playerid][pCarDamageLights],PlayerInfo[playerid][pCarDamageTires]);
            oGivePlayerMoney(playerid,-200);
            Me(playerid, "заменил двери на своем грузовике",30.0);
		}
		case 2://свет
		{
		    PlayerInfo[playerid][pCarDamageLights]=0;
		    UpdateVehicleDamageStatus(PlayerInfo[playerid][pCarID],PlayerInfo[playerid][pCarDamagePanels],PlayerInfo[playerid][pCarDamageDoors],PlayerInfo[playerid][pCarDamageLights],PlayerInfo[playerid][pCarDamageTires]);
            oGivePlayerMoney(playerid,-130);
            Me(playerid, "заменил свет на своем грузовике",30.0);
		}
		case 3://шины
		{
		    PlayerInfo[playerid][pCarDamageTires]=0;
		    UpdateVehicleDamageStatus(PlayerInfo[playerid][pCarID],PlayerInfo[playerid][pCarDamagePanels],PlayerInfo[playerid][pCarDamageDoors],PlayerInfo[playerid][pCarDamageLights],PlayerInfo[playerid][pCarDamageTires]);
            oGivePlayerMoney(playerid,-400);
            Me(playerid, "заменил колеса на своем грузовике",30.0);
		}
		case 4://заменить маслянный фильтр
		{
		    oGivePlayerMoney(playerid,-30);
		    PlayerInfo[playerid][pCarOilFilter]=PlayerInfo[playerid][pCarMileage];
		    Me(playerid, "заменил маслянный фильтр на своем грузовике",30.0);
		}
		case 5://заменить воздушный фильтр
		{
		    oGivePlayerMoney(playerid,-35);
		    PlayerInfo[playerid][pCarAirFilter]=PlayerInfo[playerid][pCarMileage];
		    Me(playerid, "заменил воздушный фильтр на своем грузовике",30.0);
		}
		case 6://заменить акб
		{
		    oGivePlayerMoney(playerid,-210);
		    PlayerInfo[playerid][pCarBattary]=PlayerInfo[playerid][pCarMileage];
		    Me(playerid, "заменил аккумулятор на своем грузовике",30.0);
		}
		case 7://заменить масло
		{
		    oGivePlayerMoney(playerid,-70);
		    PlayerInfo[playerid][pCarOil]=PlayerInfo[playerid][pCarMileage];
		    Me(playerid, "заменил масло на своем грузовике",30.0);
		}
		case 8://заменить прокладки
		{
		    oGivePlayerMoney(playerid,-160);
		    PlayerInfo[playerid][pCarGaskets]=PlayerInfo[playerid][pCarMileage];
		    Me(playerid, "поменял прокладки на своем грузовике",30.0);
		}
		case 9://заменить свечи
		{
		    oGivePlayerMoney(playerid,-130);
		    PlayerInfo[playerid][pCarSpark]=PlayerInfo[playerid][pCarMileage];
		    Me(playerid, "заменил свечи на своем грузовике",30.0);
		}
		case 10://общий ремонт двигателя
		{
		    oGivePlayerMoney(playerid,-600);
		    PlayerInfo[playerid][pCarHP]=1000.0;
		    SetVehicleHealth(PlayerInfo[playerid][pCarID],PlayerInfo[playerid][pCarHP]);
		    Me(playerid, "сделал полный общий ремонт двигателя своего грузовика",30.0);
		}
	}
	return 1;
}
