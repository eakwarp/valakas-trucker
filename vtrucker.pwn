#define GAMEMODENAME "Valakas Trucker 182(27.03.2024)"
#include "translations/RU"
/*
	Original developing by Eakwarp
	todo:
	//траслитеризатор
	//текстдрав в низу экрана с грузом и точкой доставки
	//отцепление прицепа на ктрл
	//потребление бензина
	//заправка бензина
	//повреждения груза в зависимости от указанного коэффициента хрупкости
	//отображение текущих повреждений груза в баре под спидометром
	//цена высчитывается из расстояния между точками
	//из цены вычитается процент поврежденного груза помноженный на 2
	//если повреждено более 50 процентов груза - цена будет отрицательной
	//сигнал мобильного телефона в баре под спидометром(в том числе, когда игрок не за рулем)
	//мобильные башни и их создание
	//телефоны, возможность звонить, отправлять смс (и невозможность если сигнал потерян)
	//отключение мобильного телефна, если отключен, в баре никакой информации о нем
	//записные книжки ( /note )
	//спек
	//realchat
	//цены грузовиков при регистрации
	//отрицательный счет согласно цене грузовика
	//поиск грузовика на карте
	//прокачка если баланс положительный, по 2 очка за заказ с фурой
	//по 1 очку за заказ на фургоне
	//новые грузовики и фуры
	//конвой от 100 очков(сугубо с фурой)
	//возможность создавать мини компанию нанимать кого либо от 1000 очков,
	//контракт ограничен общим количеством очков
	//голод
	//усталость
	//отели для отдыха
	//бары и кафешки для уталения голода, и потребления кофе(что частично утоляет усталость).
	//комманда для отдыха в отелях
	//комманда для вызова меню в кафешках(не забыть кофе, и не возможность его много пить)
	//во время входа в игру полностью черный экран
	//выбор скина при регистрации
	//затемнение экрана во время сильной усталости и во время отдыха в отеле
	//сохранение повреждений при парковке
	//система радаров и штрафов
	//возможность купить радар детектор
	//система препятствий на дорогах
	//сетстат
	//возможность отлить из своего бензобака кому либо бензин
	//магазин покупки траков
	//магазин покупки детаелй для траков
	тюнинг траков
	//износ состояния траков
	//расходники на траках(масло, фильтры, прокладки, пр).
	//удаление добавленных частей игрового мира(заданий, пропети, заправки, и прочее)
	//сохранение повреждений на траках
	//придумать способ интересно диагностировать и чинить грузовики
	//минимальные жизни автомобиля - 300, невозможность его взорвать
	//завод двигателя на пробел
	//для фар /lights
	//для открытия капота и багажника /open
	//реальное время
	//смена погоды каждые 20 минут
	//предмет позволяющий делать быструю заправку
	//значки заправок, забегаловок, тракстопов, мотелей и магазинов
	//профиксить сохранение деталей
	//сделать марк 0-9
	//информация о максимальной скорости на антирадаре
	//увеличение радиуса антирадара
	//за каждые 500 очков, можно нанять дополнительного водителя
	эффект при высоком голоде
	офисы компаний их покупка
	разделить сообщения по полам(муж/жен)
	//написать текст обучения
	//анимации
	//при заправке нужно глушить двигатель
	//после уничтожения машины профиксить завод двигателя
	//расширить максимальное количество забегаловок
	//исправить максимальные значения в гивмайфуел
	//руссифицировать /pay
	//добавить банкоматы и их создание
	//антирадар регариует только если игрок за рулем своей машины
	//иконки барьеров по первому объекту, так же тп по барьерам по первому объекту.
	интерьеры для офисов
	//проверить интерьеры фастфудов и отелей, исправить координаты внутри
	//ингейм регистрация с заявками, и ингейм проверка заявок администраторами
	//сделать комманды для входов выходов в интереры
	//система защиты от застервания в преградах
	//сделать ачат
	//сделать пищалку и красную лампочку при количестве бензина меньше 10 процентов
	//проверить стоимость старого грузовика при покупке нового
	//фикс park (бензин и повреждения)
	//уменьшить расход топлива на холостых оборотах
	переделать погрузку в процентах, пока игрок на чекпоинте, погрузка или разгрузка идет, уезжает - не идет.
	//модернизировать рацию, что бы после отправки сообщения, указывалось количество радиостанций его получивших
	//новый предмет - автоматический регулятор тяги, покупается только при наличии радар детектора, используется для автоматической установки спидлимита
*/
enum carinfo
{
	carModel,
	carPrice,
	carCapacity,
	carPoints
};
new CarInfo[][carinfo]=
{
	{440, 17000, 1500, 0},//Rumpo
	{499, 25000, 2000, 0},//Benson
	{403, 150000, 10000, 0},//Linerunner
	{413, 26000, 2700, 50},//Pony
	{482, 32000, 3000, 130},//Burrito
	{498, 35000, 4200, 160},//Boxville
	{414, 50000, 4500, 200},//Mule
	{514, 230000, 10000, 230},//Petrol Tanker
	{456, 75000, 5500, 270},//Yankee
	{455, 105000, 7000, 350},//Flatbed
	{515, 370000, 10000, 450}//Roadtrain
};


#define MYSQL_HOST "127.0.0.1"
#define MYSQL_USER "root"
#define MYSQL_PASS "****"
#define MYSQL_BASE "samp"
#define MYSQL_DEBUG 1 //1

#define INGAMEREGISTER

#pragma dynamic 16384//8192

#include <a_samp>
#include <omp>
#include <core>
#include <float>
#include "includes/foreach"
#include "includes/zcmd"
#include "includes/sscanf2"
#include "includes/a_mysql"
#include "includes/streamer"
#include "includes/Y_MD5"
#include "includes/cyberchat"
#include "systems/colorsdefine"
#include "systems/anims"
#include "systems/misc"

//some includes in end for core

#define DIALOG_LOGIN 1
#define DIALOG_REGISTER 2
#define DIALOG_SETSEX 3
#define DIALOG_DELIVERYLIST 4
#define DIALOG_PROPLIST 5
#define DIALOG_NOTE 6
#define DIALOG_HOTEL 7
#define DIALOG_CHANGESEX 8
#define DIALOG_FOOD 9
#define DIALOG_REPAIR 10
#define DIALOG_BUY 11
#define DIALOG_GASLIST 12
#define DIALOG_FOODLIST 13
#define DIALOG_HOTELLIST 14
#define DIALOG_MAGAZINELIST 15
#define DIALOG_REPAIRLIST 16
#define DIALOG_RADARLIST 17
#define DIALOG_MOBILESTATIONLIST 18
#define DIALOG_OFFICELIST 19
#define DIALOG_INVITE 20
#define DIALOG_ATMLIST 21
#define DIALOG_TUTORIAL 22// 23
#define DIALOG_ROADWORKLIST 24
#define DIALOG_ALLREGSHOW 25
#define DIALOG_REGSHOW 26
#define DIALOG_REGMENU 27
#define DIALOG_NEXTREG 28

#define MAX_HOTEL 32
#define MAX_TRUCKSTOPS 8
#define MAX_TRAILERS 128
#define MAX_PROPS 128
#define MAX_DELIVERYS 255
#define MAX_GAS 64
#define MAX_MOBILESTATION 32
#define MAX_FOOD 64
#define MAX_RADAR 32
#define MAX_REPAIRS 16
#define MAX_MAGAZINE 32
#define MAX_ROADWORKS 32
#define MAX_ROADWORK_OBJECT 128
#define MAX_LOADEDROADWORKS 5
#define MAX_OFFICE 32
#define MAX_COMPANY 128

#define MAX_PASSWORD_WARNS 5//минимум 1.
#define MAX_PASSWORD_LEINGHT 20

#define fixchars(%1) for(new charfixloop=0;charfixloop<strlen(%1);charfixloop++)if(%1[charfixloop]<0)%1[charfixloop]+=256

//#undef ShowPlayerDialog(%1,%2,%3,%4,%5,%6,%7)

forward ShowPlayerSafeDialog(playerid, dialogid, style, caption[], info[], button_1[], button_2[]);
public ShowPlayerSafeDialog(playerid, dialogid, style, caption[], info[], button_1[], button_2[])
{
	SetPVarInt(playerid,"DialogID",dialogid);

	new i = -1;
	while(caption[++i]) if(caption[i] == 0x25) caption[i] -= 0x2;
	i = -1;
	while(info[++i]) if(info[i] == 0x25) info[i] -= 0x2;
	i = -1;
	while(button_1[++i]) if(button_1[i] == 0x25) button_1[i] -= 0x2;
	i = -1;
	while(button_2[++i]) if(button_2[i] == 0x25) button_2[i] -= 0x2;

	return ShowPlayerDialog(playerid, dialogid, style, caption, info, button_1, button_2);
}

#define ShowPlayerDialog(%1,%2,%3,%4,%5,%6,%7) ShowPlayerSafeDialog(%1,%2,%3,%4,%5,%6,%7)

new questiontime = 1;
new noooc = 1;
new Text:speedo[MAX_PLAYERS];
new gSpeedo[MAX_PLAYERS];
new Float:g_fSpeedCap[ MAX_PLAYERS ] = { 0.0, ... };
new SpeedLimit[MAX_PLAYERS];
new Float:Gas[MAX_VEHICLES] = { 100.0, ... };
new gPlayerChangeTruck[MAX_PLAYERS];
new Text:ChangeText;
new DeathDeliveryTimer[MAX_PLAYERS];
new CP[MAX_PLAYERS];
new PlayerDeliveryStartTime[MAX_PLAYERS];
new PlayerDeliveryEndTime[MAX_PLAYERS];
new Text:HelpDraw[MAX_PLAYERS];
new InFill[MAX_PLAYERS];
new Signal[MAX_PLAYERS];
new Text:RealChatDraw[8];
new RealChat[MAX_PLAYERS];
new RealChatType[MAX_PLAYERS];
new CallerID[MAX_PLAYERS]= { INVALID_PLAYER_ID, ... };
new PlayerInCall[MAX_PLAYERS];
new Text:lbt[MAX_PLAYERS];
new InHotel[MAX_PLAYERS];
new PlayerCoffee[MAX_PLAYERS];
new FatigueBit[MAX_PLAYERS];
new PlayerTicket[MAX_PLAYERS];
new gEngineStart[MAX_PLAYERS];
new PlayerRadarDetect[MAX_PLAYERS];
new PlayerRadarDetectID[MAX_PLAYERS];
new PlayerConvoyCreater[MAX_PLAYERS];
new PlayerConvoyID[MAX_PLAYERS] = { INVALID_PLAYER_ID, ... };
new InviteOffer[MAX_PLAYERS]={ INVALID_PLAYER_ID, ... };

new PlayerTrailer[MAX_PLAYERS];
new PlayerDeliveryState[MAX_PLAYERS];

enum rcInfo // флаги
{
	rcL,
	rcA,
	rcB,
	rcR,
	rcS,
	rcC,
	rcO,
	rcHS
};
new RealChatInfo[MAX_PLAYERS][rcInfo];

stock MySQLConnect(sqlhost[], sqluser[], sqlpass[], sqldb[])
{
	print("MYSQL: Attempting to connect to server...");
	mysql_connect(sqlhost, sqluser, sqldb, sqlpass);
	mysql_debug(MYSQL_DEBUG);
	printf("(%s,%s,%s,%s)",sqlhost, sqluser, sqldb, sqlpass);
	if(mysql_ping())
 		return print("MYSQL: Database connection established");
	else
	{
		print("MYSQL: Connection error, retrying...");
		mysql_connect(sqlhost, sqluser, sqldb, sqlpass);
		mysql_debug(MYSQL_DEBUG);
		if(mysql_ping())
			return print("MYSQL: Reconnection successful. We can continue as normal.");
		else
		{
			print("MYSQL: Could not reconnect to server, terminating server...");
			SendRconCommand("exit");
			return 0;
		}
	}
}

enum hotelinfo
{
	hotelValid,
	hotelPrice,
	Float:hotelEnX,
	Float:hotelEnY,
	Float:hotelEnZ,
	hotelInt,
	hotelName[64],
};
new HotelInfo[MAX_HOTEL][hotelinfo];
new Text3D:HotelLabel[MAX_HOTEL];
new HotelPickup[MAX_HOTEL];
new HotelIcon[MAX_HOTEL];
enum pInfo
{
	pLogin,
	pLocal,//не сохранять
	pAdmin,
	pMoney,
	pPoints,
	pPhone,
	pPhoneOnline,//не сохранять
	pHelper,
	pMutedTime,
	pSex,
	pJailTime,
	pCarModel,
	pCarColor1,
	pCarColor2,
	Float:pCarMileage,
	Float:pCarX,
	Float:pCarY,
	Float:pCarZ,
	Float:pCarRot,
	pSpeedoX,
	pSpeedoY,
	pCarID,//не сохранять
	pTutorial,
	pTruckStop,
	pDeliveryID,//не сохранять
	pTrailerID,//не сохранять
	Float:pDeliveryHealth,//не сохранять
	Float:pHunger,//голод
	Float:pFatigue,//усталость
	pBan,
	pModel,//скин
	Float:pSpeed,//не сохранять
	Float:pCarGas,
	pCarDamagePanels,
	pCarDamageDoors,
	pCarDamageLights,
	pCarDamageTires,
	Float:pCarOilFilter,
	Float:pCarAirFilter,
	Float:pCarBattary,//акб
	Float:pCarOil,//масло
	Float:pCarGaskets,//прокладки
	Float:pCarSpark,
	Float:pCarHP,
	pCarFullHealth,
	pCarRadarDetector,//радар детектор
	pCarFuelTank,//дополнительный бензобак
	pCarRadio,//радио, увеличивает радиус действия рации в грузовике
	pCarAdditive,//присадка, уменьшает потребление топлива
	pCompany,
	pCompanyTime,
	pCarNeck,
	pAccepted,
	pCarDamper,
};
new PlayerInfo[MAX_PLAYERS][pInfo];
stock LoadPlayer(playerid)
{
	new query[2048],Field[1024],playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid,playername,sizeof(playername));
	format(query,sizeof(query),"SELECT pAdmin, pMoney, pPoints, pPhone, pHelper, pMutedTime, pSex, pJailTime, pCarModel, pCarColor1, pCarColor2, pCarMileage, pCarX, pCarY, pCarZ, pCarRot, pSpeedoX, pSpeedoY, pTutorial, pTruckStop, pHunger, pFatigue, pBan, pModel, pCarGas, pCarDamagePanels, pCarDamageDoors, pCarDamageLights, pCarDamageTires, pCarOilFilter,");
	format(query,sizeof(query),"%s pCarAirFilter, pCarBattary, pCarOil, pCarGaskets, pCarSpark, pCarHP, pCarFullHealth, pCarRadarDetector, pCarFuelTank, pCarRadio, pCarAdditive, pCompany, pCompanyTime, pCarNeck, pAccepted, pCarDamper FROM players WHERE Name='%s'",
	query,
	playername);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>dddddddddddfffffddddffddfddddffffffdddddddddd",
		PlayerInfo[playerid][pAdmin],
		PlayerInfo[playerid][pMoney],
		PlayerInfo[playerid][pPoints],
		PlayerInfo[playerid][pPhone],
		PlayerInfo[playerid][pHelper],
		PlayerInfo[playerid][pMutedTime],
		PlayerInfo[playerid][pSex],
		PlayerInfo[playerid][pJailTime],
		PlayerInfo[playerid][pCarModel],
		PlayerInfo[playerid][pCarColor1],
		PlayerInfo[playerid][pCarColor2],
		PlayerInfo[playerid][pCarMileage],
		PlayerInfo[playerid][pCarX],
		PlayerInfo[playerid][pCarY],
		PlayerInfo[playerid][pCarZ],
		PlayerInfo[playerid][pCarRot],
		PlayerInfo[playerid][pSpeedoX],
		PlayerInfo[playerid][pSpeedoY],
		PlayerInfo[playerid][pTutorial],
		PlayerInfo[playerid][pTruckStop],
		PlayerInfo[playerid][pHunger],
		PlayerInfo[playerid][pFatigue],
		PlayerInfo[playerid][pBan],
		PlayerInfo[playerid][pModel],
		PlayerInfo[playerid][pCarGas],
		PlayerInfo[playerid][pCarDamagePanels],
		PlayerInfo[playerid][pCarDamageDoors],
		PlayerInfo[playerid][pCarDamageLights],
		PlayerInfo[playerid][pCarDamageTires],
		PlayerInfo[playerid][pCarOilFilter],
		PlayerInfo[playerid][pCarAirFilter],
		PlayerInfo[playerid][pCarBattary],
		PlayerInfo[playerid][pCarOil],
		PlayerInfo[playerid][pCarGaskets],
		PlayerInfo[playerid][pCarSpark],
		PlayerInfo[playerid][pCarHP],
		
		PlayerInfo[playerid][pCarFullHealth],
		PlayerInfo[playerid][pCarRadarDetector],
		PlayerInfo[playerid][pCarFuelTank],
		PlayerInfo[playerid][pCarRadio],
		PlayerInfo[playerid][pCarAdditive],
		
		PlayerInfo[playerid][pCompany],
		PlayerInfo[playerid][pCompanyTime],
		PlayerInfo[playerid][pCarNeck],
		PlayerInfo[playerid][pAccepted],
		PlayerInfo[playerid][pCarDamper]);
		if(PlayerInfo[playerid][pBan])
			Kick(playerid);
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, PlayerInfo[playerid][pMoney]);//for fix
		PlayerInfo[playerid][pLogin]=1;
		SetPlayerTeam(playerid,PlayerInfo[playerid][pSex]);
		if(PlayerInfo[playerid][pTutorial])
		{
			CreatePlayerCar(playerid);
		}
		if(PlayerInfo[playerid][pPhone]==0)
		{
			new randphone = 10000 + random(89999);//minimum 1000  max 9999 //giving one at the start
			PlayerInfo[playerid][pPhone] = randphone;
		}
		SetPlayerSkin(playerid,PlayerInfo[playerid][pModel]);
		ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Вход","{FFFFFF}Нажмите кнопку {FFFF00}[spawn]{FFFFFF} внизу экрана","Ок","");
		format(query,sizeof(query),"UPDATE players SET online=1 WHERE Name='%s'",playername);
		mysql_query(query);
	}
	else
 		printf("player %s not in base",oGetPlayerName(playerid));

	mysql_free_result();
	return 1;
}
stock SavePlayer(playerid)
{
	if(!PlayerInfo[playerid][pLogin])return 1;
    new query[1024];
    new playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid,playername,sizeof(playername));
	PlayerInfo[playerid][pCarGas]=Gas[PlayerInfo[playerid][pCarID]];
	format(query,sizeof(query),
	"UPDATE players SET pAdmin=%d, pMoney=%d, pPoints=%d, pPhone=%d, pHelper=%d, pMutedTime=%d, pSex=%d, pJailTime=%d, pCarModel=%d, pCarColor1=%d, pCarColor2=%d, pCarMileage='%f', pCarX='%f', pCarY='%f', pCarZ='%f', pCarRot='%f', pSpeedoX=%d, pSpeedoY=%d, pTutorial=%d, pTruckStop=%d, pHunger='%f', pFatigue='%f', pBan=%d, pModel=%d, pCarGas='%f' WHERE Name='%s'",
	PlayerInfo[playerid][pAdmin],
	PlayerInfo[playerid][pMoney],
	PlayerInfo[playerid][pPoints],
	PlayerInfo[playerid][pPhone],
	PlayerInfo[playerid][pHelper],
	PlayerInfo[playerid][pMutedTime],
	PlayerInfo[playerid][pSex],
	PlayerInfo[playerid][pJailTime],
	PlayerInfo[playerid][pCarModel],
	PlayerInfo[playerid][pCarColor1],
	PlayerInfo[playerid][pCarColor2],
	PlayerInfo[playerid][pCarMileage],
	PlayerInfo[playerid][pCarX],
	PlayerInfo[playerid][pCarY],
	PlayerInfo[playerid][pCarZ],
	PlayerInfo[playerid][pCarRot],
	PlayerInfo[playerid][pSpeedoX],
	PlayerInfo[playerid][pSpeedoY],
	PlayerInfo[playerid][pTutorial],
	PlayerInfo[playerid][pTruckStop],
	PlayerInfo[playerid][pHunger],
	PlayerInfo[playerid][pFatigue],
	PlayerInfo[playerid][pBan],
	PlayerInfo[playerid][pModel],
	PlayerInfo[playerid][pCarGas],
	playername);
	mysql_query(query);
	
	GetVehicleDamageStatus(PlayerInfo[playerid][pCarID],
	PlayerInfo[playerid][pCarDamagePanels],
	PlayerInfo[playerid][pCarDamageDoors],
	PlayerInfo[playerid][pCarDamageLights],
	PlayerInfo[playerid][pCarDamageTires]);
	
	format(query,sizeof(query),
	"UPDATE players SET pCarDamagePanels=%d, pCarDamageDoors=%d, pCarDamageLights=%d, pCarDamageTires=%d, pCarOilFilter='%f', pCarAirFilter='%f', pCarBattary='%f', pCarOil='%f', pCarGaskets='%f', pCarSpark='%f', pCarHP='%f', pCarFullHealth=%d, pCarRadarDetector=%d, pCarFuelTank=%d, pCarRadio=%d, pCarAdditive=%d, pCompany=%d, pCompanyTime=%d, pCarNeck=%d, pAccepted=%d, pCarDamper=%d WHERE Name='%s'",
	PlayerInfo[playerid][pCarDamagePanels],
	PlayerInfo[playerid][pCarDamageDoors],
	PlayerInfo[playerid][pCarDamageLights],
	PlayerInfo[playerid][pCarDamageTires],
	PlayerInfo[playerid][pCarOilFilter],
	PlayerInfo[playerid][pCarAirFilter],
	PlayerInfo[playerid][pCarBattary],
	PlayerInfo[playerid][pCarOil],
	PlayerInfo[playerid][pCarGaskets],
    PlayerInfo[playerid][pCarSpark],
	PlayerInfo[playerid][pCarHP],
	PlayerInfo[playerid][pCarFullHealth],
	PlayerInfo[playerid][pCarRadarDetector],
	PlayerInfo[playerid][pCarFuelTank],
	PlayerInfo[playerid][pCarRadio],
	PlayerInfo[playerid][pCarAdditive],
	PlayerInfo[playerid][pCompany],
	PlayerInfo[playerid][pCompanyTime],
	PlayerInfo[playerid][pCarNeck],
	PlayerInfo[playerid][pAccepted],
	PlayerInfo[playerid][pCarDamper],
	playername);
	mysql_query(query);
	return 1;
}
stock ClearPlayerPerems(playerid)
{
    PlayerInfo[playerid][pAdmin]=0;
	PlayerInfo[playerid][pMoney]=0;
	PlayerInfo[playerid][pLogin]=0;
	PlayerInfo[playerid][pLocal]=-1;
	PlayerInfo[playerid][pPoints]=0;
	PlayerInfo[playerid][pPhone]=0;
	PlayerInfo[playerid][pPhoneOnline]=1;
	PlayerInfo[playerid][pHelper]=0;
	PlayerInfo[playerid][pMutedTime]=0;
	PlayerInfo[playerid][pSex]=0;
	PlayerInfo[playerid][pJailTime]=0;
	PlayerInfo[playerid][pCarModel]=0;
	PlayerInfo[playerid][pCarColor1]=0;
	PlayerInfo[playerid][pCarColor2]=0;
	PlayerInfo[playerid][pCarID]=0;
	PlayerInfo[playerid][pSpeedoX]=498;
	PlayerInfo[playerid][pSpeedoY]=99;
	PlayerInfo[playerid][pCarMileage]=0.0;
	PlayerInfo[playerid][pCarX]=0.0;
	PlayerInfo[playerid][pCarY]=0.0;
	PlayerInfo[playerid][pCarZ]=0.0;
	PlayerInfo[playerid][pCarRot]=0.0;
	PlayerInfo[playerid][pTutorial]=0;
	PlayerInfo[playerid][pTruckStop]=0;
	PlayerInfo[playerid][pHunger]=0.0;
	PlayerInfo[playerid][pFatigue]=0.0;
	PlayerInfo[playerid][pDeliveryID]=-1;//не сохранять
	PlayerInfo[playerid][pTrailerID]=0;//не сохранять
	PlayerInfo[playerid][pBan]=0;
	PlayerInfo[playerid][pModel]=0;
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
	PlayerInfo[playerid][pCompany]=-1;
	PlayerInfo[playerid][pCompanyTime]=0;
	PlayerInfo[playerid][pCarNeck]=0;
	PlayerInfo[playerid][pAccepted]=0;
	PlayerInfo[playerid][pCarDamper]=0;
	return 1;
}
new PasswordWarns[MAX_PLAYERS];

stock CheckPlayerPassword(playerid,pass[])
{
	if(strlen(pass) > MAX_PASSWORD_LEINGHT||!strlen(pass))return 0;
	if(!ValidPassSymbols(pass))return 0;
    new query[255];
	format(query,sizeof(query),"SELECT id FROM players WHERE Name='%s' AND Pass='%s'",oGetPlayerName(playerid),MD5_Hash(pass));
	mysql_query(query);
	mysql_store_result();
	if(!mysql_num_rows())
	{
	    mysql_free_result();
	    return 0;
	}
	mysql_free_result();
	return 1;
}

stock ValidPassSymbols(str[])
{
	for(new x=0; x < strlen(str); x++)
	{
		switch(str[x])
		{
		    case 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z': continue;
			default: return 0;
		}
	}
	return 1;
}


stock IsValidPlayer(playerid)
{
	new query[128];
	format(query,sizeof(query),"SELECT id FROM players WHERE Name='%s'",oGetPlayerName(playerid));
	mysql_query(query);
	mysql_store_result();
	if(mysql_num_rows()!=0)
	{
	    mysql_free_result();
	    return 1;
	}
	else
	{
	    mysql_free_result();
		return 0;
	}
}

stock RegisterPlayer(playerid,password[])
{
	if(strlen(password)>MAX_PASSWORD_LEINGHT||!strlen(password))
	{
	    StartPlayerRegister(playerid,1);
		return 0;
	}
    if(!ValidPassSymbols(password))
    {
        StartPlayerRegister(playerid,2);
        return 0;
    }
    new query[255];
	format(query,sizeof(query),"INSERT INTO players SET Name='%s', Pass='%s'",oGetPlayerName(playerid),MD5_Hash(password));
	mysql_query(query);
	format(query,sizeof(query),"Поздравляем с успешной регистрацией\nАккаунт - %s\nПароль - %s\n\nСохраните эти данные.",oGetPlayerName(playerid),password);
	ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX," ",query,"Ок","");
	return 1;
}

forward Givecashdelaytimer(playerid);
forward SetupPlayerForClassSelection(playerid);
forward SendPlayerFormattedText(playerid, const str[], define);
forward SendAllFormattedText(playerid, const str[], define);

main()
	print("\nValakas Trucker Gamemode\n");

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}
new PlayerIP[MAX_PLAYERS][16];
new speedotimer[MAX_PLAYERS];
public OnPlayerConnect(playerid)
{
    SetPVarInt(playerid,"DialogID",-1);
    if (!IsPlayerNPC(playerid))
	{
	    new str[255];
    	GetPlayerIp(playerid,PlayerIP[playerid],16);
		format(str, sizeof(str), "Con: [%d]%s (%s)", playerid, oGetPlayerName(playerid), PlayerIP[playerid]);
	    SendAddMessage(COLOR_WHITE,str);
	    DeleteObjectsConnect(playerid);
	    LbtCreate(playerid);
	    TextDrawShowForPlayer(playerid, lbt[playerid]);
	    PlayerTrailer[playerid]=0;
	    InHotel[playerid]=-1;
	    PlayerRadarDetect[playerid]=0;
	    PlayerRadarDetectID[playerid]=0;
	    FatigueBit[playerid]=0;
	    PlayerTicket[playerid]=0;
	    PlayerCoffee[playerid]=0;
	    PlayerInCall[playerid]=0;
     	CallerID[playerid]=INVALID_PLAYER_ID;
	    CreateHelpDraw(playerid);
	    speedotimer[playerid]=SetTimerEx("PlayerSpeedoUpdate", 100, 1, "d", playerid);
	    CP[playerid]=0;
	    DeathDeliveryTimer[playerid] = 0;
	    gPlayerChangeTruck[playerid] = 0;
	    PlayerDeliveryStartTime[playerid] = 0;
	    PlayerDeliveryEndTime[playerid] = 0;
	    gSpeedo[playerid] = 0;
	    PasswordWarns[playerid]=0;
	    ClearPlayerPerems(playerid);
	    CreateSpeedo(playerid);
	    RealChat[playerid]=0;
		RealChatType[playerid]=0;
		gEngineStart[playerid]=0;
		PlayerConvoyCreater[playerid]=0;
		PlayerConvoyID[playerid] =INVALID_PLAYER_ID;
		InviteOffer[playerid]=INVALID_PLAYER_ID;
		gPlayerUsingLoopingAnim[playerid] = 0;
		gPlayerAnimLibsPreloaded[playerid] = 0;
		PlayerDeliveryState[playerid] = 0;
		PlayerAnim[playerid] = 0;
		if(IsValidPlayer(playerid))
		{
		    StartPlayerLogin(playerid);
		}
		else
		{
#if defined INGAMEREGISTER
		    StartPlayerRegister(playerid,0);
#else
			format(str,sizeof(str),"
			ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Регистрация","{FFFFFF}Аккаунт не зарегистрирован\nРегистрация на trucker.valakas.ru","Ок","");
            SetTimerEx("kick", 1000, 0, "d", playerid);
#endif
		}
	}
	return 1;
}
forward kick(playerid);
public kick(playerid)
	return Kick(playerid);

//------------------------------------------------------------------------------------------------------
new lenreason[3][24] =
{
	"Timeout",
	"Leave",
	"Kicked"
};

public OnPlayerDisconnect(playerid,reason)
{
    DeletePVar(playerid,"DialogID");
    if (!IsPlayerNPC(playerid))
	{
	    new str[255];
	    
	    format(str,sizeof(str),"Discon: [%d]%s (%s) %s", playerid, oGetPlayerName(playerid), PlayerIP[playerid], lenreason[reason]);
		SendAddMessage(COLOR_WHITE,str);
		if(PlayerConvoyCreater[playerid])//удаление конвоя
		{
		    format(str,sizeof(str),"%s удалил конвой",
		        GetPlayerNameEx(playerid));
		    PlayerConvoyCreater[playerid]=0;
		    foreach(Player,a)
			{
				if(PlayerConvoyID[a]==playerid)
				{
				    PlayerConvoyID[a]=INVALID_PLAYER_ID;
				    SendClientMessage(a,COLOR_WHITE,str);
				}
			}
			SendClientMessage(playerid,COLOR_WHITE,"Вы удалили конвой, все его участники оповещены");
		}
		if(PlayerConvoyID[playerid]!=INVALID_PLAYER_ID)
		{
		    format(str,sizeof(str),"%s вышел из конвоя",
		        GetPlayerNameEx(playerid));
			new b=PlayerConvoyID[playerid];
			PlayerConvoyID[playerid]=INVALID_PLAYER_ID;
	        foreach(Player,a)
			{
				if(PlayerConvoyID[a]==b)
				{
				    SendClientMessage(a,COLOR_WHITE,str);
				}
			}
			SendClientMessage(playerid,COLOR_WHITE,"Вы вышли из конвоя");
		}
	    Spec(playerid,0,3);
	    Spec(playerid,0,7);
	    LbtDestroy(playerid);
		CallDeath(playerid);
	    DestroyHelpDraw(playerid);
		KillTimer(speedotimer[playerid]);
	    DeatroySpeedo(playerid);
		if(PlayerInfo[playerid][pLogin])
		{
		    format(str,sizeof(str),"UPDATE players SET online=0 WHERE Name='%s'",oGetPlayerName(playerid));
			mysql_query(str);
		    SavePlayer(playerid);
		    PlayerInfo[playerid][pLogin]=0;
		    if(PlayerInfo[playerid][pCarModel]!=0)
				DestroyVehicle(PlayerInfo[playerid][pCarID]);
		}
	}
	return 1;
}
//------------------------------------------------------------------------------------------------------

COMMAND:pay(playerid, params[])
{
	if(!IsPlayerInAtm(playerid))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не у банкомата");
    new string[128],giveplayerid,moneys;
	if (sscanf(params, "ui", giveplayerid,moneys))
		return SendClientMessage(playerid, COLOR_WHITE, " ИСПОЛЬЗУЙТЕ: /pay [id игрока/часть имени] [сумма]");
	if (IsPlayerConnected(giveplayerid))
	{
		new playermoney = oGetPlayerMoney(playerid);
		if (moneys > 0 && playermoney >= moneys)
		{
			oGivePlayerMoney(playerid, (0 - moneys));
			oGivePlayerMoney(giveplayerid, moneys);
			format(string, sizeof(string), "Вы отправили %s(%d), $%d.", oGetPlayerName(giveplayerid),giveplayerid, moneys);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			format(string, sizeof(string), "Вы получили $%d от %s(%d).", moneys, oGetPlayerName(playerid), playerid);
			SendClientMessage(giveplayerid, COLOR_YELLOW, string);
			printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",oGetPlayerName(playerid), playerid, moneys, oGetPlayerName(giveplayerid), giveplayerid);
		}
		else
		{
			SendClientMessage(playerid, COLOR_YELLOW, "Неправильная сумма.");
		}
	}
	else
	{
		format(string, sizeof(string), "%d нет такого игрока.", giveplayerid);
		SendClientMessage(playerid, COLOR_YELLOW, string);
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerSpawn(playerid)
{
	if(!PlayerInfo[playerid][pLogin])
		return Kick(playerid);
    PreloadAnimLibs(playerid);
    new h,m,s;
	gettime(h, m, s);
	SetPlayerTime(playerid,h,m);
    SetPlayerSkin(playerid,PlayerInfo[playerid][pModel]);
    //TogglePlayerClock(playerid,1);
    if(!PlayerInfo[playerid][pAccepted])
        return CheckRegStatus(playerid);
    if(!PlayerInfo[playerid][pTutorial])
		return PlayerTutorial(playerid,0);
	else
	{
	    StartShowLbt(playerid,1,0);
	    ShowPlayerDialog(playerid,-1,DIALOG_STYLE_MSGBOX," "," "," ","");
	}
    if(PlayerInfo[playerid][pJailTime]>0)
	{
		SetPlayerInterior(playerid, 1);
		SetPlayerPos(playerid,2216.5884,-1071.6406,1050.4844);
		SetPlayerVirtualWorld(playerid,playerid);
		return 1;
	}
	TruckStopSpawn(playerid);
	return 1;
}


//------------------------------------------------------------------------------------------------------

public OnPlayerRequestClass(playerid, classid)
{
	SetupPlayerForClassSelection(playerid);
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
 	SetPlayerInterior(playerid,14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
}

forward OnGameModeInitTimer();
public OnGameModeInitTimer()
{
	TruckStopInit();
	PropInit();
	TrailerInit();
	DeliveryInit();
	GasInit();
	MobileStationInit();
	HotelInit();
	FoodInit();
	RadarInit();
	RepairInit();
	MagazineInit();
	VehBuyInit();
	RoadworkInit();
	OfficeInit();
	AtmInit();
	return 1;
}

new tmphour;
public OnGameModeInit()
{
	MySQLConnect(MYSQL_HOST,MYSQL_USER,MYSQL_PASS,MYSQL_BASE);
	SendAddMessage(COLOR_GREEN,"  Welcome to Valakas Trucker Roleplay");
	mysql_query("UPDATE players SET online=0");
	SetGameModeText(GAMEMODENAME);
	CreateChangeText();
	AnimInit();
	SetTimer("OneSecTimer",1000,1);
	SetTimer("OnGameModeInitTimer",1000,0);
	new m,s;
	gettime(tmphour,m,s);
	ShowPlayerMarkers(1);
	ShowNameTags(1);
	EnableStuntBonusForAll(0);
    CreateRealchatDraws();
	ObjectsInit();
    DisableInteriorEnterExits();
    ManualVehicleEngineAndLights();

	AddPlayerClass(1,1958.3783,1343.1572,15.3746,270.1425,0,0,0,0,0,0);

	return 1;
}

public SendPlayerFormattedText(playerid, const str[], define)
{
	new tmpbuf[256];
	format(tmpbuf, sizeof(tmpbuf), str, define);
	SendClientMessage(playerid, 0xFF004040, tmpbuf);
}

public SendAllFormattedText(playerid, const str[], define)
{
	new tmpbuf[256];
	format(tmpbuf, sizeof(tmpbuf), str, define);
	SendClientMessageToAll(0xFFFF00AA, tmpbuf);
}


public OnGameModeExit()
{
    mysql_close();
	return 1;
}

stock StartPlayerLogin(playerid)
{
	if(PasswordWarns[playerid]>MAX_PASSWORD_WARNS)return Kick(playerid);
	new str[128];
	format(str,sizeof(str),"Вход на сервер\nАккаунт %s - найден\nВведите пароль(осталось попыток %d):",oGetPlayerName(playerid),MAX_PASSWORD_WARNS-PasswordWarns[playerid]);
	ShowPlayerDialog(playerid,DIALOG_LOGIN,DIALOG_STYLE_PASSWORD," ",str,"Войти","");
	PasswordWarns[playerid]++;
	return 1;
}

stock StartPlayerRegister(playerid,reason)
{
	if(!IsValidNickname(playerid))
	{
	    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX," ","Ник вашего персонажа не соответствует правилам сервера,\nдальнейшая регистрация не возможна, вы кикнуты","Ок","");
		SetTimerEx("kick", 1000, 0, "d", playerid);
		return 1;
	}
    new str[255];
    switch(reason)
    {
        case 0: format(str,sizeof(str),"Вход на сервер\nАккаунт %s - не найден\nЗапущен протокол регистрации\nВведите пароль:",oGetPlayerName(playerid));
		case 1: format(str,sizeof(str),"Вход на сервер\nАккаунт %s - не найден\nЗапущен протокол регистрации\nНайдена ошибка в пароле\nДлинна пароля должна составлять не более %d символов\nВведите пароль:",oGetPlayerName(playerid),MAX_PASSWORD_LEINGHT);
		case 2: format(str,sizeof(str),"Вход на сервер\nАккаунт %s - не найден\nЗапущен протокол регистрации\nНайдена ошибка в пароле\nВ пароле запрещенные символы, используете A-Z a-z 0-9\nВведите пароль:",oGetPlayerName(playerid));
	}
	ShowPlayerDialog(playerid,DIALOG_REGISTER,DIALOG_STYLE_INPUT," ",str,"Войти","");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new b = -1;
	while(inputtext[++b])
	{
	    switch(inputtext[b])
	    {
	        case 0x12..0xFF: continue;
			default: return 0;
		}
	}
	if(GetPVarInt(playerid,"DialogID") != dialogid) return 0;
	
	switch(dialogid)
	{
	    case DIALOG_LOGIN:
	    {
	        if(!response)return 1;
	        if(!CheckPlayerPassword(playerid,inputtext))
	        {
                StartPlayerLogin(playerid);
	        }
	        else
	        {
				LoadPlayer(playerid);
				//SpawnPlayer(playerid);
	        }
			return 1;
	    }
	    case DIALOG_REGISTER:
	    {
	        if(!response)return 1;
	        if(RegisterPlayer(playerid,inputtext))
	        {
	        	LoadPlayer(playerid);
				//SpawnPlayer(playerid);
	        }
	        return 1;
	    }
	    case DIALOG_SETSEX:
	    {
	        ShowPlayerDialog(playerid,DIALOG_CHANGESEX,DIALOG_STYLE_LIST,"Выберите пол персонажа:","Мужской\nЖенский","Выбор","");
	    }
	    case DIALOG_DELIVERYLIST:
	    {
            if(!response)return 1;
			new bit,str[32];
			sscanf(inputtext,"is[32]",bit,str);
			if(strcmp(str,"next", true ) == 0 )
				ShowDelivery(playerid,bit,bit+30);
	    }
	    case DIALOG_PROPLIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowProp(playerid,bit,bit+30);
			else
				GotoProp(playerid,bit);
	    }
	    case DIALOG_NOTE:
	    {
	        if(response)
	        {
	            new cmd[32],idx=-1;
				sscanf(inputtext,"s[32]i",cmd,idx);
				if(strcmp(cmd, "/help", true)==0)
				{
                    return ShowPlayerDialog(playerid,DIALOG_NOTE,DIALOG_STYLE_INPUT,"Блокнот(/help для дополнительной информации):","Блокнот предназначен для занесения IC записей всевозможного рода в него.\nДоступные комманды(вводить прямо в текстовое поле):\n /page [номер страницы]\n /delete [номер записи]","Отправить","Выход");
				}
	            else if(strcmp(cmd, "/page", true)==0)
    			{
			        if(idx==-1) return ShowPlayerDialog(playerid,DIALOG_NOTE,DIALOG_STYLE_INPUT,"Блокнот(/help для дополнительной информации):","/page [номер страницы]","Отправить","Выход");
			        ShowNote(playerid,idx);
    			    return 1;
    			}
    			else if(strcmp(cmd, "/delete", true)==0)
    			{
    			    if(idx==-1) return ShowPlayerDialog(playerid,DIALOG_NOTE,DIALOG_STYLE_INPUT,"Блокнот(/help для дополнительной информации):","/delete [номер записи]","Отправить","Выход");
    			    DeleteNote(playerid, idx);
    			    return 1;
				}
		        AddNote(playerid,inputtext);
		    }
	    }
	    case DIALOG_HOTEL:
	    {
	        InHotel[playerid]=-1;
	        StartShowLbt(playerid,1,0);
	        TogglePlayerControllable(playerid,1);
	    }
	    case DIALOG_CHANGESEX:
	    {
	        switch(listitem)
	        {
	            case 0:
	                PlayerInfo[playerid][pSex]=1;
	            case 1:
	            	PlayerInfo[playerid][pSex]=2;
	        }
	        PlayerTutorial(playerid,1);
	    }
	    case DIALOG_FOOD:
	    {
	        if(response)
	            PlayerEat(playerid,listitem);
	    }
	    case DIALOG_REPAIR:
	    {
	        if(response)
	        	PlayerInRepair(playerid,listitem);
	    }
	    case DIALOG_BUY:
	    {
	        if(response)
	            PlayerInMagazine(playerid,listitem);
	    }
	    case DIALOG_GASLIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowGas(playerid,bit,bit+30);
			else
				GotoGas(playerid,bit);
	    }
	    case DIALOG_FOODLIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowFood(playerid,bit,bit+30);
			else
				GotoFood(playerid,bit);
	    }
	    case DIALOG_HOTELLIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowHotel(playerid,bit,bit+30);
			else
				GotoHotel(playerid,bit);
	    }
	    case DIALOG_MAGAZINELIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowMagazine(playerid,bit,bit+30);
			else
				GotoMagazine(playerid,bit);
	    }
	    case DIALOG_REPAIRLIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowRepair(playerid,bit,bit+30);
			else
				GotoRepair(playerid,bit);
	    }
	    case DIALOG_RADARLIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowRadar(playerid,bit,bit+30);
			else
				GotoRadar(playerid,bit);
	    }
	    case DIALOG_MOBILESTATIONLIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowMobileStation(playerid,bit,bit+30);
			else
				GotoMobileStation(playerid,bit);
	    }
	    case DIALOG_OFFICELIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowOffice(playerid,bit,bit+30);
			else
				GotoOffice(playerid,bit);
	    }
	    case DIALOG_INVITE:
	    {
			if(response)
			    AcceptInvite(playerid);
			else
			    CancelInvite(playerid);
	    }
	    case DIALOG_ATMLIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowAtm(playerid,bit,bit+30);
			else
				GotoAtm(playerid,bit);
	    }
	    case DIALOG_TUTORIAL:
	    {
	        DialogTutorial1(playerid);
		}
		case DIALOG_TUTORIAL+1:
		{
		    DialogTutorial2(playerid);
	    }
	    case DIALOG_ROADWORKLIST:
	    {
	        if(!response)return 1;
	        new bit,str[32];
	        sscanf(inputtext,"p<|>is[32]",bit,str);
	        if(strcmp(str,"next", true ) == 0 )
	            ShowRoadwork(playerid,bit,bit+30);
			else
				GotoRoadwork(playerid,bit);
	    }
	    case DIALOG_ALLREGSHOW:
		{
		    if(response)
		        ShowReg(playerid,inputtext);
		}
		case DIALOG_REGSHOW:
		{
			if(response)
			    ShowMenuReg(playerid);
		}
		case DIALOG_REGMENU:
		{
		    if(response)
		        ShowMenuRegUse(playerid,listitem);
		}
		case DIALOG_NEXTREG:
		{
		    NextQuestion(playerid,response,inputtext);
		}
	}
	return 1;
}

stock oGivePlayerMoney(playerid, amount)
{
	ResetPlayerMoney(playerid);
	PlayerInfo[playerid][pMoney]+=amount;
	GivePlayerMoney(playerid, PlayerInfo[playerid][pMoney]);
	return 1;
}
stock oGetPlayerMoney(playerid)
	return PlayerInfo[playerid][pMoney];

new PlayerDamaged[MAX_PLAYERS];
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
	if(issuerid!=INVALID_PLAYER_ID)
	{
		SetPlayerDrunkLevel(playerid, 3000);
		if(!PlayerDamaged[playerid])
		{
		    PlayerDamaged[playerid]=1;
		    SetTimerEx("PlayerDamageOff", 750, 0, "d", playerid);
		}
	}
	return 1;
}

forward PlayerDamageOff(playerid);
public PlayerDamageOff(playerid)
{
    SetPlayerDrunkLevel(playerid, 0);
    PlayerDamaged[playerid]=0;
	return 1;
}
new minbit;

new CoffeeBit[MAX_PLAYERS];
forward OneSecTimer();
public OneSecTimer()
{
    new h,m,s;
	gettime(h,m,s);
	if(tmphour != h)
	{
		tmphour=h;
	    //BizsPayToOwners();
	}
	new str[255],carid;
	new engine,lights,alarm,doors,bonnet,boot,objective;
	foreach(Player,i)
	{
	    SetPlayerTime(i,h,m);
	    SetPlayerScore(i, PlayerInfo[i][pPoints]);
	    if(PlayerInfo[i][pMutedTime] > 0)
        {
            PlayerInfo[i][pMutedTime]--;
            if(PlayerInfo[i][pMutedTime] <= 0) SendClientMessage(i,COLOR_RED," Срок Вашей заглушки истек. Вы разглушенны");
        }
        if(PlayerCoffee[i]>0)
        {
		    CoffeeBit[i]++;
		    if(CoffeeBit[i]==1200)
		    {
			    CoffeeBit[i]=0;
			    PlayerCoffee[i]--;
		    }
		}
		if(PlayerTicket[i]>0)
		    PlayerTicket[i]--;
		if(PlayerConvoyID[i]!=INVALID_PLAYER_ID)
		    CheckConvoy(i);
		if(PlayerInfo[i][pJailTime] > 0)
		{
			PlayerInfo[i][pJailTime]--;

			if(PlayerInfo[i][pJailTime] <= 0)
			{
                SetPlayerVirtualWorld(i,0);
				SpawnPlayer(i);
			}
		}
		if(PlayerDeliveryStartTime[i] > 0)
		{
			format(str,sizeof(str),"~r~LOADING~n~~y~%d",PlayerDeliveryStartTime[i]);
		    GameTextForPlayer(i, str, 1000, 4);
		    if(IsPlayerInCheckpoint(i)&&PlayerInfo[i][pSpeed]<10.0)
		    	PlayerDeliveryStartTime[i]--;
			if(PlayerDeliveryStartTime[i]==0)
			    PlayerDeliveryStartTimerEnd(i);
		}
		if(PlayerDeliveryEndTime[i] > 0)
		{
			format(str,sizeof(str),"~r~LANDING~n~~y~%d",PlayerDeliveryEndTime[i]);
		    GameTextForPlayer(i, str, 1000, 4);
		    if(IsPlayerInCheckpoint(i)&&PlayerInfo[i][pSpeed]<10.0)
		    	PlayerDeliveryEndTime[i]--;
			if(PlayerDeliveryEndTime[i]==0)
			    PlayerDeliveryEndTimerEnd(i);
		}
		if(DeathDeliveryTimer[i] > 0)
		{
		    format(str,sizeof(str),"~r~TRAILER LOST~n~~y~%d",DeathDeliveryTimer[i]);
		    GameTextForPlayer(i, str, 1000, 4);
		    DeathDeliveryTimer[i]--;
		    if(DeathDeliveryTimer[i]==0)
		        PlayerDeathDelivery(i);
		}
		if(GetPlayerState(i)==PLAYER_STATE_DRIVER)
		{
		    if(PlayerInfo[i][pCarID]!=0)
		    {
			    GetVehicleHealth(PlayerInfo[i][pCarID],PlayerInfo[i][pCarHP]);
			    if(PlayerInfo[i][pCarHP] < 290.0)
			    {
			        PlayerInfo[i][pCarHP]= 300.0;
			        SetVehicleHealth(PlayerInfo[i][pCarID],PlayerInfo[i][pCarHP]);
			    }
		    }
			carid=GetPlayerVehicleID(i);
			GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
			if(engine)
			{
			    if(Gas[carid]>0.0)
			    {
			        if(Gas[carid]<10.0)
			            PlayerPlaySound(i, 5201, 0.0, 0.0, 0.0);
			        if(PlayerInfo[i][pCarAdditive])
			        {
			        	if(PlayerInfo[i][pSpeed]>10.0)
			        		Gas[carid]-=0.035;
						else
						    Gas[carid]-=0.0175;
				    }
			        else
			        {
						if(PlayerInfo[i][pSpeed]>10.0)
							Gas[carid]-=0.05;
				        else
				            Gas[carid]-=0.025;
				    }
				}
				if(Gas[carid]<0.0)
					SetVehicleParamsEx(carid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
			}
			if(carid==PlayerInfo[i][pCarID])
			{
				TrailerUpdate(i,carid);
				GetVehicleDamage(i,carid);
			}
		}
		if(InHotel[i]>=0)
		{
		    if(PlayerInfo[i][pFatigue]>0.0)
		    PlayerInfo[i][pFatigue]-=0.5;
		    if(PlayerInfo[i][pFatigue]<0.0)
		    	PlayerInfo[i][pFatigue]=0.0;
		    else
		    	oGivePlayerMoney(i, -HotelInfo[InHotel[i]][hotelPrice]);
		    format(str,sizeof(str),"Вы отдыхаете, остаток усталости %0.1f",PlayerInfo[i][pFatigue]);
			ShowPlayerDialog(i,DIALOG_HOTEL,DIALOG_STYLE_MSGBOX,"Отель",str,"Встать","");
	    }
		else
		{
			if(PlayerInfo[i][pFatigue] > 75.0)
			{
			    FatigueBit[i]++;
			    if(PlayerInfo[i][pFatigue] > 95.0)
			    {
			        if(FatigueBit[i]>=7)
					{
					    StartShowLbt(i,0,1);
					    FatigueBit[i]=0;
			        }
			    }
			    else if(PlayerInfo[i][pFatigue] > 90.0)
			    {
			        if(FatigueBit[i]>=15)
					{
					    StartShowLbt(i,0,1);
					    FatigueBit[i]=0;
			        }
			    }
		     	else if(PlayerInfo[i][pFatigue] > 85.0)
			    {
			        if(FatigueBit[i]>=30)
					{
					    StartShowLbt(i,0,1);
					    FatigueBit[i]=0;
			        }
			    }
			    else if(PlayerInfo[i][pFatigue] > 80.0)
			    {
			        if(FatigueBit[i]>=45)
					{
					    StartShowLbt(i,0,1);
					    FatigueBit[i]=0;
			        }
			    }
			    else
			    {
			        if(FatigueBit[i]>=60)
					{
					    StartShowLbt(i,0,1);
					    FatigueBit[i]=0;
			        }
			    }
			}
		}
		if(InFill[i])
		{
		    Fill(i);
		}
		if(GetPlayerInterior(i)==0)
			Signal[i]=GetSignal(i);
		if(Signal[i]<1)CallDeath(i);
		if(PlayerInfo[i][pHunger]<100.0)
		    PlayerInfo[i][pHunger]+=0.03;

		if(PlayerInfo[i][pFatigue]<100.0)
		    PlayerInfo[i][pFatigue]+=0.015;
	}
	minbit++;
	if(minbit==60)
	{
	    minbit=0;
		OneMinTimer();
	}
	return 1;
}

new weatherbit;
forward OneMinTimer();
public OneMinTimer()
{
    TimeRoadWorks();
    UpdateCompanys();
	weatherbit++;
	if(weatherbit==20)
	{
	    weatherbit=0;
	    Weather();
	}
	return 1;
}

public OnPlayerText(playerid, text[])
{
	//fixchars(text);
	if(PlayerInfo[playerid][pMutedTime] > 0)
	{
		PlayerMuteMessage(playerid);
		return 0;
	}
	if(PlayerInCall[playerid] && PlayerInCall[CallerID[playerid]])
	{
		new str[255];
	    format(str, sizeof(str), "%s говорит в трубку: %s", GetPlayerNameEx(playerid), text);
		ProxDetector(10.0, playerid, str, COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		
		format(str, sizeof(str), "[Телефон] #[%d]{FFFF00} говорит: %s", PlayerInfo[playerid][pPhone], text);
		SendClientMessage(CallerID[playerid], COLOR_WHITE,str);
		return 0;
    }
	if(RealChat[playerid] == 1)
	{
		switch(RealChatType[playerid])
		{
			case 1:
			{
			    cmd_a(playerid,text);
				return 0;
			}
   			case 2:
			{
			    cmd_b(playerid,text);
				return 0;
			}
			case 3:
			{
			    cmd_r(playerid,text);
				return 0;
			}
			case 4:
			{
			    cmd_s(playerid,text);
				return 0;
			}
			case 5:
			{
			    cmd_c(playerid,text);
				return 0;
			}
			case 6:
			{
			    cmd_o(playerid,text);
				return 0;
			}
			case 7:
			{
				cmd_hs(playerid,text);
				return 0;
			}
		}
	}
	new string[255];
	if(IsPlayerInAnyVehicle(playerid))
	{
	    //new carid=GetPlayerVehicleID(playerid);
		if(PlayerInfo[playerid][pSex] == 1) format(string, sizeof(string), "%s произнес(в машине): %s", GetPlayerNameEx(playerid), text);
		else format(string, sizeof(string), "%s произнесла(в машине): %s", GetPlayerNameEx(playerid), text);
		ProxDetector(10.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	}
	else
	{
		format(string, sizeof(string), "%s произнес: %s", GetPlayerNameEx(playerid), text);
		if(PlayerInfo[playerid][pSex] == 2) format(string, sizeof(string), "%s произнесла: %s", GetPlayerNameEx(playerid), text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1,0,1,1,1,1);
		SetTimerEx("ClearAnims", strlen(text)*100, 0, "d", playerid);
	}
	format(string,sizeof(string)," Говорит: %s",text);
	SetPlayerChatBubble(playerid, string, COLOR_WHITE, 20.0, 3500);
	return 0;
}

COMMAND:speedlimit(playerid,params[])
{
    new limit,string[128];
	if (!sscanf(params, "i", limit))
	{
		if(limit < 1)
		{
		    DisablePlayerSpeedCap(playerid);
		    SpeedLimit[playerid]=0;
		    SendClientMessage(playerid, COLOR_GREEN, "* Лимит скорости снят");
		    return 1;
		}
		if(limit<15 || limit>90)
		    return SendClientMessage( playerid,COLOR_WHITE, " Не менее 15 и не более 90 м/ч." );

		SpeedLimit[playerid]=limit;
		format(string,sizeof(string),"0.%d",SpeedLimit[playerid]);
		g_fSpeedCap[playerid] = floatstr(string);
		g_fSpeedCap[playerid]/=1.4;
		format(string, sizeof(string), "* Лимит скорости установлен в: %d м/ч", SpeedLimit[playerid]);
		SendClientMessage(playerid, COLOR_GREEN, string);
	}
	else
	    SendClientMessage(playerid,COLOR_WHITE, " ИСПОЛЬЗОВАНИЕ: /speedlimit [максимальная скорость] (0 для снятия лимита)" );
	return 1;
}

stock DisablePlayerSpeedCap( playerid )
{
	if ( 0 <= playerid < sizeof( g_fSpeedCap ) )
	{
		g_fSpeedCap[ playerid ] = 0.0;
		SpeedLimit[playerid]=0;
	}
	return 1;
}

stock CreatePlayerCar(playerid)
{
	if(PlayerInfo[playerid][pCarModel]!=0&& PlayerInfo[playerid][pCarID]==0)
	{
		PlayerInfo[playerid][pCarID]=CreateVehicle(PlayerInfo[playerid][pCarModel],PlayerInfo[playerid][pCarX],PlayerInfo[playerid][pCarY],PlayerInfo[playerid][pCarZ],PlayerInfo[playerid][pCarRot],PlayerInfo[playerid][pCarColor1],PlayerInfo[playerid][pCarColor2],120000);
        if(PlayerInfo[playerid][pCarHP] > 300.0)
			SetVehicleHealth(PlayerInfo[playerid][pCarID],PlayerInfo[playerid][pCarHP]);
        Gas[PlayerInfo[playerid][pCarID]]=PlayerInfo[playerid][pCarGas];
        
        UpdateVehicleDamageStatus(PlayerInfo[playerid][pCarID],
		PlayerInfo[playerid][pCarDamagePanels],
		PlayerInfo[playerid][pCarDamageDoors],
		PlayerInfo[playerid][pCarDamageLights],
		PlayerInfo[playerid][pCarDamageTires]);
		new engine,lights,alarm,doors,bonnet,boot,objective;
		GetVehicleParamsEx(PlayerInfo[playerid][pCarID],engine,lights,alarm,doors,bonnet,boot,objective);
		SetVehicleParamsEx(PlayerInfo[playerid][pCarID],VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
	static
		s_iVehicle
	;

	if ( g_fSpeedCap[ playerid ] != 0.0 && GetPlayerState( playerid ) == PLAYER_STATE_DRIVER )
	{
		s_iVehicle = GetPlayerVehicleID( playerid );

		if ( s_iVehicle )
		{
			static
				Float:s_fX,
				Float:s_fY,
				Float:s_fZ,
				Float:s_fVX,
				Float:s_fVY,
				Float:s_fVZ
			;

			GetVehiclePos( s_iVehicle, s_fX, s_fY, s_fZ );
			GetVehicleVelocity( s_iVehicle, s_fVX, s_fVY, s_fVZ );

			if ( !IsPlayerInRangeOfPoint( playerid, g_fSpeedCap[ playerid ] + 0.05, s_fX + s_fVX, s_fY + s_fVY, s_fZ + s_fVZ ) )
			{
				static
					Float:s_fLength
				;

				s_fLength = floatsqroot( ( s_fVX * s_fVX ) + ( s_fVY * s_fVY ) + ( s_fVZ * s_fVZ ) );

				s_fVX = ( s_fVX / s_fLength ) * g_fSpeedCap[ playerid ];
				s_fVY = ( s_fVY / s_fLength ) * g_fSpeedCap[ playerid ];
				s_fVZ = ( s_fVZ / s_fLength ) * g_fSpeedCap[ playerid ];

				if ( s_iVehicle )
					SetVehicleVelocity( s_iVehicle, s_fVX, s_fVY, s_fVZ );
				else
					SetPlayerVelocity( playerid, s_fVX, s_fVY, s_fVZ );
			}
		}
	}

	return 1;
}

new TruckChange[MAX_PLAYERS];
new SkinChange[MAX_PLAYERS];

forward ParkS(playerid);
public ParkS(playerid)
{
	cmd_park(playerid,"");
	return 1;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    AchatKeyLst(playerid,newkeys);
    SpecOnPlayerKeyStateChange(playerid, newkeys);
	switch(newkeys)
	{
	    case KEY_ANALOG_LEFT:
	    {
	        switch(gPlayerChangeTruck[playerid])
	        {
		        case 1:
		        {
			        TruckStopPrevKey(playerid);
	            }
	            case 2:
				{
				    TruckChange[playerid]--;
				    if(TruckChange[playerid] < 0)
				        TruckChange[playerid]=sizeof(CarInfo);
				    ShowPlayerTruck(playerid);
				}
				case 3:
				{
                    SkinChange[playerid]--;
                    if(SkinChange[playerid] < 0)
                    {
	                    switch(PlayerInfo[playerid][pSex])
	                    {
							case 1://муж
								SkinChange[playerid]=sizeof(MaleSkin);
							case 2://жен
								SkinChange[playerid]=sizeof(FeMaleSkin);
	                    }
                    }
                    ShowPlayerSkin(playerid);
				}
				case 4:
				{
				    PlayerVehBuy(playerid,1);
				}
			}
			RealChatKeyLeft(playerid);
	    }
	    case KEY_ANALOG_RIGHT:
	    {
	        switch(gPlayerChangeTruck[playerid])
	        {
		        case 1:
		        {
			        TruckStopNextKey(playerid);
		        }
	            case 2:
				{
				    TruckChange[playerid]++;
				    if(TruckChange[playerid] >= sizeof(CarInfo))
				        TruckChange[playerid]=0;
				    ShowPlayerTruck(playerid);
				}
				case 3:
				{
                    SkinChange[playerid]++;
                    switch(PlayerInfo[playerid][pSex])
                    {
						case 1://муж
						{
						    if(SkinChange[playerid] >= sizeof(MaleSkin))
                                SkinChange[playerid]=0;
						}
						case 2://жен
						{
						   	if(SkinChange[playerid] >= sizeof(FeMaleSkin))
						   	    SkinChange[playerid]=0;
						}
                    }
                    ShowPlayerSkin(playerid);
				}
				case 4:
				{
				    PlayerVehBuy(playerid,2);
				}
			}
			RealChatKeyRight(playerid);
	    }
	    case KEY_YES:
	    {
	        switch(gPlayerChangeTruck[playerid])
	        {
		        case 1:
		        {
		            PlayerTutorial(playerid,2);
	        	}
	            case 2:
				{
				    if(PlayerInfo[playerid][pPoints]<CarInfo[TruckChange[playerid]][carPoints])
    				{
    				    return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Выбор грузовика","У вас недостаточно очков, что бы выбрать данный грузовик","Ок","");
    				}
				    PlayerTutorial(playerid,3);
				}
				case 3:
				{
				    PlayerTutorial(playerid,4);
				}
				case 4:
				{
				    PlayerVehBuy(playerid,3);
				}
			}
	    }
	    case KEY_NO:
	    {
	        if(gPlayerChangeTruck[playerid]==4)
                ExitShowPlayerTruck(playerid);
	    }
	    case KEY_FIRE:
		{
		    PlayerDeathTrailer(playerid);
		}
		case KEY_CROUCH:
		{
		    StartFill(playerid);
		}
		case KEY_HANDBRAKE:
		{
		    if(gEngineStart[playerid] != 0)
				StartEngineAndLights(playerid);
		}
		case KEY_SPRINT:
		{
		    if(gPlayerUsingLoopingAnim[playerid])
			{
			    StopLoopingAnim(playerid);
			    PlayerAnim[playerid]=0;
		        TextDrawHideForPlayer(playerid,txtAnimHelper);
		    }
		}
	}
	return 1;
}

stock ShowPlayerSkin(playerid)
{
	switch(PlayerInfo[playerid][pSex])
	{
	    case 1:
	    {
			PlayerInfo[playerid][pModel]=MaleSkin[SkinChange[playerid]];
	    }
	    case 2:
	    {
	        PlayerInfo[playerid][pModel]=FeMaleSkin[SkinChange[playerid]];
	    }
	}
	SetPlayerSkin(playerid,PlayerInfo[playerid][pModel]);
    SetupPlayerForClassSelection(playerid);
	return 1;
}


stock CreateChangeText()
{
	ChangeText = TextDrawCreate(14.000000,410.000000,"~<~~k~~VEHICLE_TURRETLEFT~                             ~k~~CONVERSATION_YES~                               ~k~~VEHICLE_TURRETRIGHT~~>~");
	TextDrawAlignment(ChangeText,0);
	TextDrawBackgroundColor(ChangeText,0x000000ff);
	TextDrawFont(ChangeText,3);
	TextDrawLetterSize(ChangeText,0.499999,1.700000);
	TextDrawColor(ChangeText,0xffffffff);
	TextDrawSetOutline(ChangeText,1);
	TextDrawSetProportional(ChangeText,1);
	TextDrawSetShadow(ChangeText,1);
	return 1;
}

COMMAND:park(playerid,params[])
{
	if(GetPlayerState(playerid)!=PLAYER_STATE_DRIVER)
	    return SendClientMessage(playerid,COLOR_WHITE,"Вы не за рулем");
	new carid=GetPlayerVehicleID(playerid);
    if(PlayerInfo[playerid][pCarID]!=carid)
        return SendClientMessage(playerid,COLOR_WHITE,"Вы не в своей машине");
    new Float:vehhp,engine,lights,alarm,doors,bonnet,boot,objective,CarDamagePanels,CarDamageDoors,CarDamageLights,CarDamageTires;
    
	GetVehicleHealth(carid,vehhp);
    GetVehicleDamageStatus(carid,CarDamagePanels,CarDamageDoors,CarDamageLights,CarDamageTires);
	GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
	GetVehiclePos(PlayerInfo[playerid][pCarID],PlayerInfo[playerid][pCarX],PlayerInfo[playerid][pCarY],PlayerInfo[playerid][pCarZ]);
	GetVehicleZAngle(PlayerInfo[playerid][pCarID],PlayerInfo[playerid][pCarRot]);
	PlayerInfo[playerid][pCarGas]=Gas[PlayerInfo[playerid][pCarID]];
    DestroyVehicle(PlayerInfo[playerid][pCarID]);

	PlayerInfo[playerid][pCarID]=CreateVehicle(PlayerInfo[playerid][pCarModel],PlayerInfo[playerid][pCarX],PlayerInfo[playerid][pCarY],PlayerInfo[playerid][pCarZ],PlayerInfo[playerid][pCarRot],PlayerInfo[playerid][pCarColor1],PlayerInfo[playerid][pCarColor2],120000);
	Gas[PlayerInfo[playerid][pCarID]]=PlayerInfo[playerid][pCarGas];
	SetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
	SetTimerEx("UpdateVehDamStatus", 2000, 0, "ddddd", carid,CarDamagePanels,CarDamageDoors,CarDamageLights,CarDamageTires);
	//UpdateVehicleDamageStatus(carid,CarDamagePanels,CarDamageDoors,CarDamageLights,CarDamageTires);
    SetVehicleHealth(carid,vehhp);
    
	PutPlayerInVehicle(playerid,PlayerInfo[playerid][pCarID],0);
	SendClientMessage(playerid,COLOR_WHITE,"Машина припаркована!");
	return 1;
}
forward UpdateVehDamStatus(carid,CarDamagePanels,CarDamageDoors,CarDamageLights,CarDamageTires);
public UpdateVehDamStatus(carid,CarDamagePanels,CarDamageDoors,CarDamageLights,CarDamageTires)
{
    UpdateVehicleDamageStatus(carid,CarDamagePanels,CarDamageDoors,CarDamageLights,CarDamageTires);
	return 1;
}

COMMAND:gps(playerid,params[])
{
	if(!(CP[playerid]==0 || CP[playerid]==3))
	    return SendClientMessage(playerid,COLOR_GREY,"В данный момент не доступно");
	if(IsPlayerInAnyVehicle(playerid))
	{
		new carid=GetPlayerVehicleID(playerid);
		if(carid==PlayerInfo[playerid][pCarID])
		    return SendClientMessage(playerid,COLOR_GREY,"Вы уже в своей машине");
	}
    CP[playerid]=3;
    SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCarX],PlayerInfo[playerid][pCarY],PlayerInfo[playerid][pCarZ], 10.0);
    SendClientMessage(playerid,COLOR_YELLOW,"Маркер установлен на ваш грузовик");
	return 1;
}


stock PlayerDeathTrailer(playerid)
{
	new carid=GetPlayerVehicleID(playerid);
	if(IsATruck(carid))DetachTrailerFromVehicle(carid);
	return 1;
}

COMMAND:engine(playerid,params[])
{
    if(GetPlayerState(playerid)!=PLAYER_STATE_DRIVER)
		return SendClientMessage(playerid,COLOR_GREY,"   Вы можете использовать это только когда Вы водитель !");
	new carid=GetPlayerVehicleID(playerid);
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
    if(engine==VEHICLE_PARAMS_ON)
		SetVehicleParamsEx(carid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
	else
	{
	    if(Gas[carid] > 0.0)
			SetVehicleParamsEx(carid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
		else
		    GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~No fuel in Vehicle",2500,3);
	}
	return 1;
}
COMMAND:lights(playerid,params[])
{
    if(GetPlayerState(playerid)!=PLAYER_STATE_DRIVER)
		return SendClientMessage(playerid,COLOR_GREY,"Вы можете использовать это только когда Вы водитель !");
    new carid=GetPlayerVehicleID(playerid);
	new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
	if(lights==VEHICLE_PARAMS_ON)
		SetVehicleParamsEx(carid,engine,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
	else
		SetVehicleParamsEx(carid,engine,VEHICLE_PARAMS_ON,alarm,doors,bonnet,boot,objective);
	return 1;
}
COMMAND:open(playerid,params[])
{
    if(!IsPlayerInAnyVehicle(playerid))
    {
		new carid=GetClosestCarInRadiusNearPlayer(playerid,5.0);
		if(carid != -1)
		{
			new Float:cx,Float:cy,Float:cz,Float:rot;
			GetVehiclePos(carid,cx,cy,cz);
		    new Float:x[2],Float:y[2];
		    GetVehicleZAngle(carid,rot);
            //new Float:b_x, Float:b_y, Float:b_z, Float:b_a;
			x[0]=cx + 2*floatsin(-rot, degrees);
			y[0]=cy + 2*floatcos(-rot, degrees);
			x[1]=cx - 2*floatsin(-rot, degrees);
			y[1]=cy - 2*floatcos(-rot, degrees);
			new Float:dis[2];
			new Float:px,Float:py,Float:pz;
			GetPlayerPos(playerid,px,py,pz);
			dis[0]= floatsqroot(floatpower(floatabs(floatsub(px,x[0])),2)+floatpower(floatabs(floatsub(py,y[0])),2)+floatpower(floatabs(floatsub(cz,pz)),2));
            dis[1]= floatsqroot(floatpower(floatabs(floatsub(px,x[1])),2)+floatpower(floatabs(floatsub(py,y[1])),2)+floatpower(floatabs(floatsub(cz,pz)),2));
			//dis2 =GetDistanceBetweenPlayers(x,p1);
			new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
			if(dis[0] > dis[1])//багажник
			{
			    switch(boot)
			    {
	  	    		case VEHICLE_PARAMS_ON:SetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_OFF,objective);
	  				default:SetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,VEHICLE_PARAMS_ON,objective);
  	            }
			}
			else //капот
			{
			    switch(bonnet)
			    {
				    case VEHICLE_PARAMS_ON:SetVehicleParamsEx(carid,engine,lights,alarm,doors,VEHICLE_PARAMS_OFF,boot,objective);
					default:SetVehicleParamsEx(carid,engine,lights,alarm,doors,VEHICLE_PARAMS_ON,boot,objective);
				}
			}
			return 1;
		}
	}
	return 1;
}





stock SetPlayerStartEngine(playerid,carid)
{
    new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
	if(!engine)
	{
	    GameTextForPlayer(playerid, "~r~~k~~VEHICLE_HANDBRAKE~ ~w~for start Engine", 5000, 1);
		gEngineStart[playerid]=1;
	}
	else
	{
	    gEngineStart[playerid]=0;
	}
	return 1;
}
stock StartEngineAndLights(playerid)
{
	new carid=GetPlayerVehicleID(playerid);
    new engine,lights,alarm,doors,bonnet,boot,objective;
	GetVehicleParamsEx(carid,engine,lights,alarm,doors,bonnet,boot,objective);
	if(Gas[carid] >= 1)
	{
		SetVehicleParamsEx(carid,VEHICLE_PARAMS_ON,lights,alarm,doors,bonnet,boot,objective);
	}
	else
	{
	    GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~No fuel in Vehicle",2500,3);
	}
	gEngineStart[playerid]=0;
	return 1;
}
new allowedweather[20] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19};
stock Weather()
{
	new n=random(sizeof(allowedweather));
    SetWeather(allowedweather[n]);
    return 1;
}

COMMAND:audio(playerid,params[])
{
	new i;
	if(sscanf(params,"i",i))
	    return SendClientMessage(playerid, COLOR_GRAD2, "/audio [id звука]");
    PlayerPlaySound(playerid, i, 0.0, 0.0, 0.0);
    return 1;
}

//new PlayerConvoyCreater[MAX_PLAYERS];
//new PlayerConvoyID[MAX_PLAYERS] = { INVALID_PLAYER_ID, ... };

COMMAND:enter(playerid,params[])
	return PlayerEnterExitTimer(playerid);
COMMAND:exit(playerid,params[])
    return PlayerEnterExitTimer(playerid);
stock PlayerEnterExitTimer(playerid)
{
	switch(PlayerInfo[playerid][pLocal])
	{
	    case -1:
	    {
		    if(HotelExitFor(playerid))
				return 1;
		    if(FoodExitFor(playerid))
				return 1;
			if(MagazineExitFor(playerid))
				return 1;
			if(OfficeExitFor(playerid))
				return 1;
	    }
	    case 1://в отеле
		{
			if(HotelExitTimer(playerid))
				return 1;
		}
		case 2://в забегаловке
		{
		    if(FoodExitTimer(playerid))
				return 1;
		}
		case 3://в магазине
		{
		   	if(MagazineExitTimer(playerid))
				return 1;
		}
		case 4://в офисе
		{
		    if(OfficeExitTimer(playerid))
				return 1;
		}
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	foreach(Player,i)
	{
		if(PlayerInfo[i][pCarID]==vehicleid)
		{
		    new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(PlayerInfo[i][pCarID],engine,lights,alarm,doors,bonnet,boot,objective);
			SetVehicleParamsEx(PlayerInfo[i][pCarID],VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
			break;
		}
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	OnPlayerDeathAnim(playerid, killerid, reason);
	return 1;
}

#include "systems/chatsandphone"
#include "systems/truckstops"
#include "systems/tutorial"
#include "systems/trailer"
#include "systems/property"
#include "systems/delivery"
#include "systems/help"
#include "systems/gas"
#include "systems/lbt"
#include "systems/mobilestations"
#include "systems/note"
#include "systems/objects"
#include "systems/realchat"
#include "systems/hotel"
#include "systems/food"
#include "systems/admin"
#include "systems/radars"
#include "systems/speedo"
#include "systems/repair"
#include "systems/shop"
#include "systems/vehbuy"
#include "systems/convoy"
#include "systems/roadworks"
#include "systems/office"
#include "systems/company"
#include "systems/registration"
#include "systems/atm"