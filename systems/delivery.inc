
enum deliveryinfo
{
    deliveryValid,
    deliveryProd[32],
    deliveryStartProp,
    deliveryEndProp,
    deliveryFragility,
    deliveryPrice,
    deliveryTrailer,
	Float:deliveryValue,
};
new DeliveryInfo[MAX_DELIVERYS][deliveryinfo];
stock LoadDelivery(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT deliveryProd, deliveryStartProp, deliveryEndProp, deliveryFragility, deliveryPrice, deliveryTrailer, deliveryValue FROM deliverys WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>s[32]dddddf",
		DeliveryInfo[i][deliveryProd],
	    DeliveryInfo[i][deliveryStartProp],
	    DeliveryInfo[i][deliveryEndProp],
	    DeliveryInfo[i][deliveryFragility],
	    DeliveryInfo[i][deliveryPrice],
		DeliveryInfo[i][deliveryTrailer],
		DeliveryInfo[i][deliveryValue]);
	    DeliveryInfo[i][deliveryValid]=1;
	}
	else
	    DeliveryInfo[i][deliveryValid]=0;
	mysql_free_result();
	return 1;
}
stock DeliveryInit()
{
    for(new i=0; i<MAX_DELIVERYS; i++)
        LoadDelivery(i);
	return 1;
}
stock SaveDelivery(i)
{
    if(DeliveryInfo[i][deliveryValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE deliverys SET deliveryProd='%s', deliveryStartProp=%d, deliveryEndProp=%d, deliveryFragility=%d, deliveryPrice=%d, deliveryValue='%f' WHERE id=%d",
		DeliveryInfo[i][deliveryProd],
	    DeliveryInfo[i][deliveryStartProp],
	    DeliveryInfo[i][deliveryEndProp],
	    DeliveryInfo[i][deliveryFragility],
	    DeliveryInfo[i][deliveryPrice],
	    DeliveryInfo[i][deliveryTrailer],
	    DeliveryInfo[i][deliveryValue],
		i);
		mysql_query(query);
	}
	return 1;
}

stock CreateDelivery(name[],start,end,fragility,price,trailer,Float:value)
{
    for(new i=0; i<MAX_DELIVERYS; i++)
    {
        if(!DeliveryInfo[i][deliveryValid])
        {
            new query[255];
	        format(query,sizeof(query),"INSERT INTO deliverys SET deliveryProd=' %s', deliveryStartProp=%d, deliveryEndProp=%d, deliveryFragility=%d, deliveryPrice=%d, deliveryTrailer=%d, deliveryValue='%f', id=%d",
			name,start,end,fragility,price,trailer,value,
			i);
			mysql_query(query);
	        LoadDelivery(i);
	        return i;
        }
    }
    return 1;
}

COMMAND:deliverycreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new name[32],start,price,end,fragility,trailer,Float:value;
    if (sscanf(params, "fiiiis[32]",value,start,end,fragility,trailer,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /deliverycreate [коэф.ценности 0.1-0.9] [стартовый биз] [конечный биз] [хрупкость(10-90)] [тип трейлера] [н-ие про-та]");
	if(value < 0.1 || value > 0.9)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Коэффициент ценности от 0.1 до 0.9");
	if(start==end)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Конечная точка задания не может совпадать с начальной");
	if(!PropInfo[start][propValid])
	    return SendClientMessage(playerid, COLOR_GRAD2, "Начальная точка не существует");
	if(!PropInfo[end][propValid])
	    return SendClientMessage(playerid, COLOR_GRAD2, "Конечная точка не существует");
	if(fragility < 10 || fragility > 90)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Хрупкость от 10 до 90");
	if(trailer < 0 || trailer > 3)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Трейлеры 0 - обычный и укороченный обычный, 1 - сыпучий, 2 - цистерна, 3 - маленькие грузовики");
    new Float:floatprice=GetDistanceBetweenPoints(PropInfo[start][propX],PropInfo[start][propY],PropInfo[start][propZ],PropInfo[end][propX],PropInfo[end][propY],PropInfo[end][propZ]);
    new str[255];
	format(str,sizeof(str),"%f",floatprice);
	price=strval(str);
	new i=CreateDelivery(name,start,end,fragility,price,trailer,value);
	new str1[32];
	switch(trailer)
	{
	    case 0:str1="обычный";
	    case 1:str1="кузов";
	    case 2:str1="цистерна";
	    case 3:str1="маленький грузовик";
	}
	format(str,sizeof(str),"Вы создали доставку, груз [%s], хрупкость [%d], цена [%d], тип прицепа[%s] коэффициент ценности [%f]",
	DeliveryInfo[i][deliveryProd],
    DeliveryInfo[i][deliveryFragility],
    DeliveryInfo[i][deliveryPrice],
	str1,
	DeliveryInfo[i][deliveryValue]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	format(str,sizeof(str),"старт [%s (%d)], конец [%s (%d)]",
	PropInfo[DeliveryInfo[i][deliveryStartProp]][propName],
    DeliveryInfo[i][deliveryStartProp],
    PropInfo[DeliveryInfo[i][deliveryEndProp]][propName],
    DeliveryInfo[i][deliveryEndProp]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:deliverydelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /deliverydelete [ид доставки]");
    if(!DeliveryInfo[i][deliveryValid])
        return SendClientMessage(playerid, COLOR_GRAD2, "Нечего удалять.");
	new query[255];
	format(query,sizeof(query),"DELETE FROM deliveys WHERE id=%d",i);
	mysql_query(query);
	LoadDelivery(i);
    format(query,sizeof(query),"Вы удалили доставку %d",i);
    SendClientMessage(playerid, COLOR_GRAD2, query);
	return 1;
}
COMMAND:propdelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /propdelete [ид бизнесса]");
    if(!PropInfo[i][propValid])
        return SendClientMessage(playerid, COLOR_GRAD2, "Нечего удалять.");
	new query[255];
	format(query,sizeof(query),"DELETE FROM props WHERE id=%d",i);
	mysql_query(query);
	LoadProp(i);
    format(query,sizeof(query),"Вы удалили бизнес %d",i);
    SendClientMessage(playerid, COLOR_GRAD2, query);
	return 1;
}
COMMAND:deliverysetprod(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new name[32],i;
    if (sscanf(params, "is[32]",i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /deliverysetprod [id доставки] [название продукта]");
	format(DeliveryInfo[i][deliveryProd],32," %s",name);
	SaveDelivery(i);
	new str[255];
	format(str,sizeof(str),"Вы установили имя доставки %d - %s",i,name);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:deliverysetstart(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new start,i;
    if (sscanf(params, "ii",i,start))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /deliverysetstart [id доставки] [id стартового бизнесса]");
    if(!PropInfo[start][propValid])
	    return SendClientMessage(playerid, COLOR_GRAD2, "Начальная точка не существует");
	DeliveryInfo[i][deliveryStartProp]=start;
	SaveDelivery(i);
	new str[255];
	format(str,sizeof(str),"Вы установили старт доставки %d - %s (%d)",i,PropInfo[DeliveryInfo[i][deliveryStartProp]][propName],DeliveryInfo[i][deliveryStartProp]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:deliverysetend(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new start,i;
    if (sscanf(params, "ii",i,start))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /deliverysetend [id доставки] [id конечного бизнесса]");
    if(!PropInfo[start][propValid])
	    return SendClientMessage(playerid, COLOR_GRAD2, "Конечная точка не существует");
	DeliveryInfo[i][deliveryEndProp]=start;
	SaveDelivery(i);
	new str[255];
	format(str,sizeof(str),"Вы установили конец доставки %d - %s (%d)",i,PropInfo[DeliveryInfo[i][deliveryEndProp]][propName],DeliveryInfo[i][deliveryEndProp]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:deliverysetfragility(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new fragility,i;
    if (sscanf(params, "ii",i,fragility))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /deliverysetfragility [id доставки] [хрупкость 0-100]");
    if(fragility < 0 || fragility > 100)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Хрупкость от 0 до 100");
	DeliveryInfo[i][deliveryFragility]=fragility;
	SaveDelivery(i);
	new str[255];
	format(str,sizeof(str),"Вы установили хрупкость доставки %d - %d",i,DeliveryInfo[i][deliveryFragility]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:deliverysetprice(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new fragility,i;
    if (sscanf(params, "ii",i,fragility))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /deliverysetprice [id доставки] [цена]");
	DeliveryInfo[i][deliveryPrice]=fragility;
	SaveDelivery(i);
	new str[255];
	format(str,sizeof(str),"Вы установили цену доставки %d - %d",i,DeliveryInfo[i][deliveryPrice]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:deliverysettrailer(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new trailer,i;
    if (sscanf(params, "ii",i,trailer))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /deliverysetprice [id доставки] [тип трейлера]");
    if(trailer < 0 || trailer > 2)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Трейлеры 0 - обычный и укороченный обычный, 1 - сыпучий, 2 - цистерна.");
    new str1[24];
	switch(trailer)
	{
	    case 0:str1="обычный";
	    case 1:str1="кузов";
	    case 2:str1="цистерна";
	}
	DeliveryInfo[i][deliveryTrailer]=trailer;
	SaveDelivery(i);
	new str[255];
	format(str,sizeof(str),"Вы установили трейлер доставки %d - %s (%d)",i,str1,DeliveryInfo[i][deliveryTrailer]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:deliveryshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowDelivery(playerid,0,29);
    return 1;
}
stock ShowDelivery(playerid,startid,endid)
{
	new str[4096],bit;
	for(new i=startid; i<MAX_DELIVERYS; i++)
    {
        if(DeliveryInfo[i][deliveryValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d %s(%s(%d) - %s(%d)) %d %d$\n",
            str,
            i,
        	DeliveryInfo[i][deliveryProd],
			PropInfo[DeliveryInfo[i][deliveryStartProp]][propName],
		    DeliveryInfo[i][deliveryStartProp],
		    PropInfo[DeliveryInfo[i][deliveryEndProp]][propName],
		    DeliveryInfo[i][deliveryEndProp],
		    DeliveryInfo[i][deliveryFragility],
		    DeliveryInfo[i][deliveryPrice]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список доставок [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_DELIVERYLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}
forward OnTrailerAttach(playerid,trailerid,vehicleid);
forward OnTrailerDetach(playerid,trailerid,vehicleid);
new TrailerBit[MAX_PLAYERS];

stock TrailerUpdate(playerid,vehicleid)
{
	PlayerTrailer[playerid]=GetVehicleTrailer(vehicleid);
    if(PlayerTrailer[playerid]>0)
    {
		if(TrailerBit[playerid]==0)
		{
	        TrailerBit[playerid]=1;
	        OnTrailerAttach(playerid,PlayerTrailer[playerid],PlayerInfo[playerid][pCarID]);
        }
    }
    else
    {
		if(TrailerBit[playerid]==1)
	    {
	        OnTrailerDetach(playerid,PlayerTrailer[playerid],vehicleid);
	        PlayerTrailer[playerid]=0;
            TrailerBit[playerid]=0;
	    }
	}
	return 1;
}
public OnTrailerAttach(playerid,trailerid,vehicleid)
{
	if(PlayerInfo[playerid][pCarID]==vehicleid)
	{
	    for(new i=0; i<MAX_TRAILERS; i++)
		{
		    if(TrailerInfo[i][tiValid])
			{
			    if(TrailerInfo[i][tiCarID]==trailerid)
			    {
					new str[255];
					new model=GetVehicleModel(trailerid);
					if(PlayerInfo[playerid][pDeliveryID]==-1)
					{
						PlayerInfo[playerid][pTrailerID]=trailerid;
						switch(model)
						{
						    case 435, 591://обычный
						    	format(str,sizeof(str),"Вы подцепили обычный прицеп(%d), используйте /delivery для получения заказа",trailerid);
							case 450://кузов
							    format(str,sizeof(str),"Вы подцепили прицеп кузовного типа(%d), используйте /delivery для получения заказа",trailerid);
							case 584://цистерна
							    format(str,sizeof(str),"Вы подцепили прицеп цистерну(%d), используйте /delivery для получения заказа",trailerid);
						}
					}
					else
					{
					    if(TrailerInfo[i][tiCarID]!=PlayerInfo[playerid][pTrailerID])
						{
						   	switch(model)
							{
							    case 435, 591://обычный
							    	format(str,sizeof(str),"Вы подцепили обычный прицеп(%d), внимание, это не ваш прицеп, текущий заказ с ним не выполнить!",trailerid);
								case 450://кузов
								    format(str,sizeof(str),"Вы подцепили прицеп кузовного типа(%d), внимание, это не ваш прицеп, текущий заказ с ним не выполнить!",trailerid);
								case 584://цистерна
								    format(str,sizeof(str),"Вы подцепили прицеп цистерну(%d), внимание, это не ваш прицеп, текущий заказ с ним не выполнить!",trailerid);
							}
						}
						else
						{
						    PlayerInfo[playerid][pTrailerID]=trailerid;
						    DeathDeliveryTimer[playerid]=0;
						    switch(model)
							{
							    case 435, 591://обычный
							    	format(str,sizeof(str),"Вы подцепили обычный прицеп(%d), он подходит для текущей доставки",trailerid);
								case 450://кузов
								    format(str,sizeof(str),"Вы подцепили прицеп кузовного типа(%d), он подходит для текущей доставки",trailerid);
								case 584://цистерна
								    format(str,sizeof(str),"Вы подцепили прицеп цистерну(%d), он подходит для текущей доставки",trailerid);
							}
						}
					}
					SendClientMessage(playerid,COLOR_YELLOW,str);
			        return 1;
			    }
			}
		}
	}
	return 1;
}
public OnTrailerDetach(playerid,trailerid,vehicleid)
{
    if(PlayerInfo[playerid][pDeliveryID]!=-1)
	{
	    new str[128];
		/*if(PlayerInfo[playerid][pTrailerID]==trailerid)
		{*/
	    DeathDeliveryTimer[playerid]=60;
        format(str,sizeof(str),"Вы потеряли ваш трейлер, у вас есть %d секунд что бы его подцепить!",DeathDeliveryTimer[playerid]);
		/*}
		else
		{
		    DeathDeliveryTimer[playerid]+=20;
		    format(str,sizeof(str),"Вы отцепили чужой трейлер, у вас осталось %d секунд что бы подцепить свой",DeathDeliveryTimer[playerid]);
		}*/
		SendClientMessage(playerid,COLOR_YELLOW,str);
	}
	else
	{
        PlayerInfo[playerid][pTrailerID]=0;
	    SendClientMessage(playerid,COLOR_YELLOW,"Вы отцепили трейлер");
	}
	return 1;
}

stock PlayerStartDelivery(playerid,bits)
{
	new trailer=3;
	new model=GetVehicleModel(PlayerInfo[playerid][pTrailerID]);
	switch(model)
	{
		case 435, 591://обычный
	    	trailer=0;
		case 450://кузов
		    trailer=1;
		case 584://цистерна
		    trailer=2;
	}
	/*if(trailer==-1)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Внутренняя ошибка!");*/
	new i;
	switch(bits)
	{
		case 0:
		{
			new delid[MAX_DELIVERYS],bit;
			new maxid;
			for(i=0; i<MAX_DELIVERYS; i++)
		    {
		        if(DeliveryInfo[i][deliveryValid])
		        {
		            if(DeliveryInfo[i][deliveryTrailer]==trailer)
		            {
		                delid[bit]=i;
						bit++;
						maxid=bit;
		            }
		        }
		    }
		    if(maxid==0)
		        return SendClientMessage(playerid, COLOR_GRAD2, "Нет подходящих доставок!");
		    new b=random(maxid);
			i=delid[b];
		}
		case 1:
		{
		    new delid[MAX_DELIVERYS],bit;
		    new maxid;
		    for(i=0; i<MAX_DELIVERYS; i++)
		    {
		        if(DeliveryInfo[i][deliveryValid])
		        {
		            if(DeliveryInfo[i][deliveryTrailer]==trailer)
		            {
			            if(IsPlayerInRangeOfPoint(playerid,10.0,PropInfo[DeliveryInfo[i][deliveryStartProp]][propX],PropInfo[DeliveryInfo[i][deliveryStartProp]][propY],PropInfo[DeliveryInfo[i][deliveryStartProp]][propZ]))
						{
						    delid[bit]=i;
							bit++;
							maxid=bit;
						}
					}
		        }
		    }
		    if(bit == -1)
		        return SendClientMessage(playerid, COLOR_GRAD2, "Нет подходящих доставок!");
			new b=random(maxid);
			i=delid[b];
		}
	}
    PlayerInfo[playerid][pDeliveryID]=i;
    new s=DeliveryInfo[i][deliveryStartProp];
    new e=DeliveryInfo[i][deliveryEndProp];
	new str[512];
    format(str,sizeof(str),"[Заказ] Продукт %s, хрупкость %d процентов, доставка из %s в %s",
	DeliveryInfo[i][deliveryProd],
	DeliveryInfo[i][deliveryFragility],
	PropInfo[s][propName],
	PropInfo[e][propName]);
    SendClientMessage(playerid,COLOR_YELLOW,str);
    CP[playerid]=1;
    PlayerInfo[playerid][pDeliveryHealth]=0;
    SetPlayerCheckpoint(playerid, PropInfo[s][propX],PropInfo[s][propY],PropInfo[s][propZ], 10.0);
    format(str,sizeof(str),"~b~trucker.valakas.ru ~r~/help             ~y~Produkt: ~r~%s ~y~iz ~r~%s",
    Translate(DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryProd]),
    Translate(PropInfo[s][propName]));
    SetHelpDraw(playerid,str);
	return 1;
}
COMMAND:delivery(playerid,params[])
{
    if(PlayerInfo[playerid][pDeliveryID]!=-1)
	    return SendClientMessage(playerid, COLOR_GRAD2, "У вас уже есть заказ!");
	if(!IsPlayerInAnyVehicle(playerid))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в машине!");
	if(GetPlayerVehicleID(playerid) != PlayerInfo[playerid][pCarID])
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в своем грузовике!");
    if(PlayerInfo[playerid][pTrailerID]==0 && IsATruck(PlayerInfo[playerid][pCarID]))
        return SendClientMessage(playerid, COLOR_GRAD2, "У вас нет трейлера!");
    PlayerStartDelivery(playerid,0);
	return 1;
}
COMMAND:closestdelivery(playerid,params[])
{
	if(PlayerInfo[playerid][pPoints]<650)
	     return SendClientMessage(playerid, COLOR_GRAD2, "Для того что бы брать ближайшую доставку нужно иметь более 650 очков!");
    if(PlayerInfo[playerid][pDeliveryID]!=-1)
	    return SendClientMessage(playerid, COLOR_GRAD2, "У вас уже есть заказ!");
	if(!IsPlayerInAnyVehicle(playerid))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в машине!");
	if(GetPlayerVehicleID(playerid) != PlayerInfo[playerid][pCarID])
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в своем грузовике!");
    if(PlayerInfo[playerid][pTrailerID]==0 && IsATruck(PlayerInfo[playerid][pCarID]))
        return SendClientMessage(playerid, COLOR_GRAD2, "У вас нет трейлера!");
    PlayerStartDelivery(playerid,1);
    return 1;
}
stock PlayerDeathDelivery(playerid)//неудачное выполнение
{
    new str[255],Float:money,price;
    money=
    (
	CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carCapacity]*DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryValue]*0.1
	+
	DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryPrice]*0.1)*DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryFragility]/100
	+
	(CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carCapacity]*
	DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryValue]*0.1+
	DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryPrice]*0.1);
	//money=money/100*(100-PlayerInfo[playerid][pDeliveryHealth]); тут не нужна, так или иначе платить за весь груз
    format(str,sizeof(str),"%f",money);
	price=strval(str);
	oGivePlayerMoney(playerid,-price);
	format(str,sizeof(str),"Вы провалили доставку, с вас удержана неустойка %d $",price);
    SendClientMessage(playerid,COLOR_YELLOW,str);
	PlayerInfo[playerid][pDeliveryID]=-1;
	DisablePlayerCheckpoint(playerid);
    CP[playerid]=0;
    SetHelpDraw(playerid,"~b~trucker.valakas.ru ~r~/help");
	return 1;
}
public OnVehicleDeath(vehicleid)
{
    foreach(Player,i)
    {
        if(PlayerInfo[i][pCarID]==vehicleid)
        {
            if(PlayerInfo[i][pDeliveryID]!=-1)
                PlayerDeathDelivery(i);
            return 1;
        }
    }
    return 1;
}
stock PlayerEndDelivery(playerid)
{
	new str[255],Float:money,price;
	if(PlayerInfo[playerid][pDeliveryHealth]>50.0)
	{
//        цена=(объем*расстояние*хрупкость/100)%целость груза
        money=
	    (
		CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carCapacity]*DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryValue]*0.1
		+
		DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryPrice]*0.1)*DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryFragility]/100
		+
		(CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carCapacity]*
		DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryValue]*0.1+
		DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryPrice]*0.1);
		money=money/100*PlayerInfo[playerid][pDeliveryHealth];
	    format(str,sizeof(str),"%f",money);
		price=strval(str);
		new convoy=CheckCountConvoy(playerid);
		new convoybonus;
		if(convoy)
		{
			convoybonus=price/100*convoy*5;
			oGivePlayerMoney(playerid,convoybonus);
		}
		oGivePlayerMoney(playerid,price);
		if(oGetPlayerMoney(playerid)>0)
	    {
		    if(IsATruck(GetPlayerVehicleID(playerid)))
		    {

		        format(str,sizeof(str),"Поздравляем с удачной доставкой, ваш гонорар %d $, так же полученно два очка доставки",price);
	    		PlayerInfo[playerid][pPoints]+=2;
			}
			else
			{
			    PlayerInfo[playerid][pPoints]++;
				format(str,sizeof(str),"Поздравляем с удачной доставкой, ваш гонорар %d $, так же полученно одно очко доставки",price);
			}
		}
		else
		    format(str,sizeof(str),"Поздравляем с удачной доставкой, ваш гонорар %d $",price);
		if(convoy)
			format(str,sizeof(str),"%s, бонус конвоя %d $",str,convoybonus);
		SendClientMessage(playerid,COLOR_YELLOW,str);
    }
	else
	{
	    money=
	    (
		CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carCapacity]*DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryValue]*0.1
		+
		DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryPrice]*0.1)*DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryFragility]/100
		+
		(CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carCapacity]*
		DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryValue]*0.1+
		DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryPrice]*0.1);
		money=money/100*(100-PlayerInfo[playerid][pDeliveryHealth]);
	    format(str,sizeof(str),"%f",money);
		price=strval(str);
        oGivePlayerMoney(playerid,-price);
		format(str,sizeof(str),"Увы, доставка была неудачной, груз сильно поврежден, неустойка %d $",price);
	    SendClientMessage(playerid,COLOR_YELLOW,str);
	}
    PlayerInfo[playerid][pDeliveryID]=-1;
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	switch(CP[playerid])
	{
	    case 1://доставка к бизнессу откуда необходимо забрать продукты.
	    {
			if(!PlayerDeliveryState[playerid])
				PlayerDeliveryOnStart(playerid);
	    }
	    case 2://доставка к бизнессу куда необходимо доставить продукты.
	    {
	        if(!PlayerDeliveryState[playerid])
	        	PlayerDeliveryOnEnd(playerid);
	    }
	    case 3://поиск собственной машины.
	    {
	        DisablePlayerCheckpoint(playerid);
	    }
	}
	return 1;
}
stock PlayerDeliveryOnStart(playerid)
{
	if(GetPlayerVehicleID(playerid) != PlayerInfo[playerid][pCarID])
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в своем грузовике!");
	PlayerDeliveryState[playerid]=1;
	PlayerDeliveryStartTime[playerid]=(CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carCapacity]/100);
	new str[255];
	format(str,sizeof(str),"Идет погрузка %s",DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryProd]);
	SendClientMessage(playerid,COLOR_YELLOW,str);
	return 1;
}
new Float:VehicleHealth[MAX_VEHICLES];
stock GetVehicleDamage(playerid,vehicleid)
{
	new Float:hp,Float:raz;
	GetVehicleHealth(vehicleid,hp);
	if(hp < VehicleHealth[vehicleid])
	{
	    PlayerInfo[playerid][pCarFullHealth]--;
	    if(PlayerInfo[playerid][pDeliveryID]!=-1)
	    {
	        if(PlayerInfo[playerid][pDeliveryHealth]>0.0)
	        {
				raz=VehicleHealth[vehicleid]-hp;
				PlayerInfo[playerid][pDeliveryHealth]-=raz*DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryFragility]/50;
				if(PlayerInfo[playerid][pDeliveryHealth] < 0.0)
				    PlayerInfo[playerid][pDeliveryHealth]=0.0;
			}
		}
	}
    VehicleHealth[vehicleid]=hp;
	return 1;
}

stock PlayerDeliveryStartTimerEnd(playerid)
{
    new e=DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryEndProp];
    new str[512];
	format(str,sizeof(str),"Погрузка %s завершена, отправляйтесь в %s",DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryProd],PropInfo[e][propName]);
	SendClientMessage(playerid,COLOR_YELLOW,str);
    PlayerDeliveryState[playerid]=0;
    PlayerInfo[playerid][pDeliveryHealth]=100.0;
    CP[playerid]=2;
    SetPlayerCheckpoint(playerid, PropInfo[e][propX],PropInfo[e][propY],PropInfo[e][propZ], 10.0);
    format(str,sizeof(str),"~b~trucker.valakas.ru ~r~/help             ~y~Product: ~r~%s ~y~v ~r~%s",
    Translate(DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryProd]),
    Translate(PropInfo[e][propName]));
    SetHelpDraw(playerid,str);
	return 1;
}
stock PlayerDeliveryOnEnd(playerid)
{
    if(GetPlayerVehicleID(playerid) != PlayerInfo[playerid][pCarID])
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в своем грузовике!");
	PlayerDeliveryState[playerid]=1;
	PlayerDeliveryEndTime[playerid]=(CarInfo[GetBuyIDFromModel(PlayerInfo[playerid][pCarModel])][carCapacity]/100);
	new str[255];
	format(str,sizeof(str),"Идет разгрузка %s",DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryProd]);
	SendClientMessage(playerid,COLOR_YELLOW,str);
	return 1;
}
stock PlayerDeliveryEndTimerEnd(playerid)
{
    new str[255];
	format(str,sizeof(str),"Разгрузка %s завершена",DeliveryInfo[PlayerInfo[playerid][pDeliveryID]][deliveryProd]);
	SendClientMessage(playerid,COLOR_YELLOW,str);
    DisablePlayerCheckpoint(playerid);
    PlayerDeliveryState[playerid]=0;
    CP[playerid]=0;
    SetHelpDraw(playerid,"~b~trucker.valakas.ru ~r~/help");
    PlayerEndDelivery(playerid);
    return 1;
}