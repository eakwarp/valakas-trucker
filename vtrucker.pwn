#define GAMEMODENAME "Valakas Trucker 181"

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

#define MYSQL_HOST "127.0.0.1"
#define MYSQL_USER "root"
#define MYSQL_PASS "****"
#define MYSQL_BASE "samp"
#define MYSQL_DEBUG 1 //1

#define INGAMEREGISTER

#pragma dynamic 16384//8192

#include <a_samp>
#include <core>
#include <float>
#include "includes/foreach"
#include "includes/zcmd"
#include "includes/sscanf2"
#include "includes/a_mysql"
#include "includes/streamer"
#include "includes/Y_MD5"
#include "includes/cyberchat"

#define COLOR_GREY 		0xAFAFAFAA
#define COLOR_GREEN 	0x33AA33FF
#define COLOR_RED 		0xAA3333AA
#define COLOR_YELLOW 	0xFFFF00AA
#define COLOR_WHITE 	0xFFFFFFAA
#define COLOR_GRAD1 	0xB4B5B7FF
#define COLOR_GRAD2 	0xBFC0C2FF
#define COLOR_LIGHTRED 	0xFF6347AA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_PURPLE 	0xC2A2DAAA
#define COLOR_FADE1 	0xE6E6E6E6
#define COLOR_FADE2 	0xC8C8C8C8
#define COLOR_FADE3 	0xAAAAAAAA
#define COLOR_FADE4 	0x8C8C8C8C
#define COLOR_FADE5 	0x6E6E6E6E
#define COLOR_YELLOW2 0xF5DEB3AA

#define RADIO_MESSAGE 0x8dffb000
#define ADMIN_MESSAGE 0xf1fd2aFF
#define HELPER_CHAT_COLOR 0xEEDD82FF
#define OOC_MESSAGE 0xa1cc82FF
#define TEAM_ORANGE_COLOR 0xFF830000

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
new gPlayerUsingLoopingAnim[MAX_PLAYERS];
new gPlayerAnimLibsPreloaded[MAX_PLAYERS];
new Text:txtAnimHelper;
new PlayerAnim[MAX_PLAYERS];
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

new MaleSkin[]=
{
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    32,
    33,
    34,
    35,
    36,
    37,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    57,
    58,
    59,
    60,
    62,
    66,
    67,
    68,
    72,
    73,
    78,
    79,
    86,
    94,
    95,
    96,
    98,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    132,
    133,
    134,
    135,
    136,
    137,
    142,
    143,
    144,
    147,
    149,
    153,
    158,
    159,
    160,
    161,
    163,
    164,
    165,
    166,
    170,
    171,
    173,
    174,
    175,
    176,
    177,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    198,
    199,
    200,
    202,
    206,
    208,
    210,
    212,
    213,
    217,
    220,
    221,
    222,
    223,
    227,
    228,
    229,
    230,
    234,
    235,
    236,
    239,
    240,
    241,
    242,
    247,
    248,
    250,
    254,
    258,
    259,
    260,
    261,
    262,
    268,
    269,
    270,
    271,
    272,
    273,
    289,
    290,
    291,
    292,
    294,
    295,
    296,
    297,
    299
};
new FeMaleSkin[]=
{
    9,
    10,
    11,
    12,
    13,
    31,
    38,
    39,
    40,
    41,
    53,
    54,
    55,
    56,
    63,
    64,
    65,
    69,
    75,
    76,
    77,
    85,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    129,
    130,
    131,
    141,
    148,
    150,
    151,
    152,
    157,
    169,
    172,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    201,
    207,
    211,
    214,
    215,
    216,
    218,
    219,
    224,
    225,
    226,
    231,
    232,
    233,
    237,
    238,
    243,
    245,
    256,
    263,
    298
};

new CarName[212][] = {
"Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana",
"Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto", "Taxi", "Washington", "Bobcat",
"Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife",
"Trailer 1", "Previon", "Coach", "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo",
"Seasparrow", "Pizzaboy", "Tram", "Trailer 2", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
"Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic", "Sanchez", "Sparrow",
"Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX", "Burrito",
"Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring",
"Sandking", "Blista Compact", "Police Maverick", "Boxvillde", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B",
"Bloodring Banger", "Rancher", "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster","Stunt",  "Tanker",
"Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan", "Blade", "Freight", "Streak",
"Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck LA", "Hustler", "Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit",
"Utility", "Nevada", "Yosemite", "Windsor", "Monster A", "Monster B", "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance",
"RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito", "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway",
"Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Trailer 3", "Emperor", "Wayfarer", "Euros", "Hotdog",
"Club", "Freight Carriage", "Trailer 4", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car (LSPD)", "Police Car (SFPD)",
"Police Car (LVPD)", "Police Ranger", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage Trailer A",
"Luggage Trailer B", "Stairs", "Boxville", "Tiller", "Utility Trailer" };

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
    if(!gPlayerAnimLibsPreloaded[playerid])
	{
   		PreloadAnimLib(playerid,"BOMBER");
   		PreloadAnimLib(playerid,"RAPPING");
    	PreloadAnimLib(playerid,"SHOP");
   		PreloadAnimLib(playerid,"BEACH");
   		PreloadAnimLib(playerid,"SMOKING");
    	PreloadAnimLib(playerid,"FOOD");
    	PreloadAnimLib(playerid,"ON_LOOKERS");
    	PreloadAnimLib(playerid,"DEALER");
		PreloadAnimLib(playerid,"CRACK");
		PreloadAnimLib(playerid,"CARRY");
		PreloadAnimLib(playerid,"COP_AMBIENT");
		PreloadAnimLib(playerid,"PARK");
		PreloadAnimLib(playerid,"INT_HOUSE");
		PreloadAnimLib(playerid,"FOOD");
		gPlayerAnimLibsPreloaded[playerid] = 1;
	}
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
	        new str[4096];
	        strcat(str,
			"{FF4500}Грузовики:{FFFFFF}\n\
			Все грузовики различны по объему перевозимого груза, и доступности игроку. В начале игры вы сможете выбрать один из доступных 3х грузовиков,\n\
			два маленьких без прицепных, и один трак. Все остальные, вы сможете приобрести только тогда, когда перестанете отдавать долги и начнете\n"
            );
			strcat(str,
			"зарабатывать деньги, но об этом ниже. После приобретения вы сможете припарковать свой грузовик командой /park, а если потеряете, найти его\n\
			посредством команды /gps. Игрок может пользоваться только своим грузовиком. У всех грузовиков есть пробег, и износ чем они больше, тем грузовик\n\
			дешевле при продаже(во время покупки нового). Купить новый грузовик можно с 50 очков доставки, в одном из автосалонов, посредством команды /buycar\n"
			);
			strcat(str,
			"{FF4500}Доставки и грузы:{FFFFFF}\n\
			Конечно основная составляющая сервера - доставки. Всего существует 4 основных типа доставок, и они разделены по типу вашего грузовика, 3 из них\n\
			для трейлеров(для обычного, кузова и цистерны), а 4й отдельный, для всех прочих грузовых перевозок. Что бы взять доставку для вашего прицепа\n\
			или грузовика, достаточно воспользоваться командой /delivery, и вам автоматически будет дана доступная доставка, сначала нужно будет забрать\n"
            );
			strcat(str,
			"груз(добраться до красного маркера на карте), погрузить, а затем доставить его(так же до красного маркера). У доставки есть несколько вводных\n\
			параметров, это ценность перевозимого груза, хрупкость, и расстояние перевозки, от них и целости груза зависит конечный заработок. Если вы\n\
			сильно побьете груз(более 50%, информация о целости груза отображается в баре, под значением cargo), в месте назначения вам придется заплатить\n"
            );
			strcat(str,
			"неустойку, так же, неустойку придется платить в случае потери груза. В случае удачной доставки вы получите как минимум деньги. А если вы\n\
			отдадите долг за грузовик, и будете в плюсе, к деньгам вы получите еще и очки доставки(о них ниже). Кроме всего, текущая информация о\n\
			доставке выводится в низу экрана. После получения игроком 650 очков доставки, он может воспользоваться командой /closestdelivery , которая\n\
			позволит ему взять ближайшее к нему в данный момент, доступное задание доставки.\n"
			);
            strcat(str,
			"{FF4500}Очки доставки:{FFFFFF}\n\
			После того, как вы отдадите долг за грузовик, доставляя грузы, вы будете получать очки доставки(по 1 или 2 за доставку). 50 очков доставки\n\
			откроют вам доступ к первым новым грузовикам. 100 очков - к возможности ездить с другими дальнобойщиками конвоем и получать за это бонус от\n"
            );
            strcat(str,
			"доставок. 1000 очков к возможности нанимать других дальнобойщиков для работы на вас, нанятый дальнобойщик не только приносит деньги работодателю,\n\
			но и имеет некий бонус при доставке. Каждые следующие 500 очков, дадут возможность нанять дополнительного дальнобойщика. Чем больше очков всего,\n\
		 	тем дольше максимальное время найма.\n"
            );
            strcat(str,
			"{FF4500}Топливо:{FFFFFF}\n\
			Все грузовики конечно нужно заправлять бензином, обычно это делается на заправках, достаточно нажать гудок, и начнется заправка. Кроме, можно\n\
			отлить топливо из своего грузовика другому дальнобойщику, для этого существует команда /givemyfuel [id игрока/часть имени] [объем топлива]\n"
			);
            strcat(str,
			"{FF4500}Радары:{FFFFFF}\n\
			Каждый дальнобойщик оснащен gps навигатором, отображающим его всем остальным дальнобойщиком. Кроме того, gps навигатор индексирует игрока для\n\
		 	дорожных скоростных радаров, увы, если вы будете слишком быстро ехать и попадете в объектив такого, с вашего счета будет автоматически списан\n"
            );
            strcat(str,
			"штраф за превышение скорости. Что бы такого не происходило, можно пользоваться ограничителем скорости, посредством команды\n\
			/speedlimit [максимальная скорость]. Кроме этого, в магазине можно купить радар детектор, который будет определять находящийся неподалеку\n\
			радар - заранее, и сигнализировать об этом в баре под спидометром."
            );
            ShowPlayerDialog(playerid,DIALOG_TUTORIAL+1,DIALOG_STYLE_MSGBOX," ",str,"Далее","");
		}
		case DIALOG_TUTORIAL+1:
		{
		    new str[4096];
            strcat(str,
			"{FF4500}Дорожные приключения:{FFFFFF}\n\
			Время от времени, в разных частях карты, перекрываются дороги, иногда на ремонт, иногда из за аварий, а иногда из за природных явлений, например\n\
		 	обвалов, требуется время, что бы они снова открылись."
			);
            strcat(str,
			"{FF4500}Конвой:{FFFFFF}\n\
			После 100 очков доставки игрок может участвовать, либо создавать конвой посредством команды /convoy, участие в конвое дает бонус доставки.\n\
			Находясь в конвое, игроки не могут уезжать далеко от его членов. Если кто то отстанет, он автоматически покинет конвой. Конвой ведет его\n\
			создатель, он единственный, кого не выкинет из режима при отрыве от колонны.\n"
            );
            strcat(str,
			"{FF4500}Состояние грузовика:{FFFFFF}\n\
			Грузовик практически невозможно уничтожить, но можно сильно поломать. Все грузовики получили новую переменную, их состояние, чем больше вы били\n\
			свой грузовик - тем дешевле он будет стоить во время продажи. Кроме этого, время от времени в грузовике нужно менять расходники, масло, фильтры,\n"
            );
            strcat(str,
			"свечи и прочие детали, это можно сделать на станциях тех обслуживания, воспользовавшись командой /repair. Кроме замены расходников, здесь можно\n\
			произвести частичный ремонт автомобиля, например поменять колеса, или заменить помятую дверь.\n"
            );
            strcat(str,
			"{FF4500}Полезные вкусности для грузовика:{FFFFFF}\n\
			В штате есть сеть магазинов авто запчастей, воспользовавшись командой /buy можно приобрести такие полезные вещи как: радар детектор, позволяющий\n\
			издалека обнаружить радар, дополнительный бензобак, увеличивающий объем бензобака в двое, присадку в двигатель, уменьшающую расход топлива, и\n"
            );
            strcat(str,
			"стационарную рацию, имеющую гораздо более большой радиус действия, чем обычная воки токи, а так же спортивную горловину бензобака, несколько\n\
			ускоряющую заправку грузовика.\n"
            );
            strcat(str,
			"{FF4500}Записная книжка:{FFFFFF}\n\
			У каждого дальнобойщика есть записная книжка, что бы ей воспользоваться, достаточно ввести команду /note.\n"
            );
            strcat(str,
			"{FF4500}Компании:{FFFFFF}\n\
			После 1000 очков доставки, игрок получает возможность открыть компанию(/opencompany), с уплатой налогового взноса в 1 миллион долларов. Это\n\
			позволит ему купить для компании офис, и нанимать сотрудников. Время найма ограничено количеством очков, равно как и количество нанимаемых\n"
            );
            strcat(str,
			"сотрудников. Для примера, 1000 очков доставки позволят нанять одного водителя на 16 часов 40 минут. Что бы нанять нескольких водителей, за\n\
			каждого последующего, глава компании должен иметь дополнительные 500 очков доставки. 1 очко главы компании - одна дополнительная минута найма,\n\
			время контракта идет даже если нанимаемый игрок находится вне игры. Все нанятые водители, имеют 5 процентный бонус доставки, и еще 5 процентов\n"
            );
            strcat(str,
			"приносят в копилку компании. В последствии глава компании может управлять заработанными деньгами, посредством команд /companybank и\n\
			/companywithdraw.\n"
            );
            strcat(str,
			"{FF4500}Офисы:{FFFFFF}\n\
			Компании могут покупать офисы, для РП процесса, использовать их для собеседования с сотрудниками, или для любых других IC целей. Офисы на\n\
			данный момент единственный элемент недвижимости в игре.\n\n"
			);
			strcat(str,
			"{FFFF00}Описание, конец:\n{FFFFFF}\
			Более подробное описание, можно прочитать на сайте или форуме проекта.");
			ShowPlayerDialog(playerid,DIALOG_SETSEX,DIALOG_STYLE_MSGBOX," ",str,"Ок","");
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

stock oGetPlayerName(playerid)
{
	new str[MAX_PLAYER_NAME];
    GetPlayerName(playerid,str,sizeof(str));
    return str;
}

stock GetPlayerNameEx(playerid)
{
    new string[MAX_PLAYER_NAME];
    GetPlayerName(playerid,string,MAX_PLAYER_NAME);
    new str[MAX_PLAYER_NAME];
    strmid(str,string,0,strlen(string),MAX_PLAYER_NAME);
    for(new i = 0; i < MAX_PLAYER_NAME; i++)
    {
        if (str[i] == '_') str[i] = ' ';
    }
    return str;
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

COMMAND:report(playerid,params[])
{
	new string[255];
    if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /report [id] [описание нарушения]");
	format(string, sizeof(string), " Жалоба от (id:%d) %s: %s", playerid, GetPlayerNameEx(playerid), params);
	ABroadCast(COLOR_RED,string,1);
	HBroadCast(COLOR_RED,string,1);
	SendClientMessage(playerid, COLOR_YELLOW, " Ваше письмо с жалобой (оригинал смотрите ниже) отправлено Администраторам.");
	SendClientMessage(playerid, COLOR_RED, params);
    return 1;
}
COMMAND:question(playerid,params[])
{
	new string[255];
    if(questiontime==0) return SendClientMessage(playerid, COLOR_GREY, "   В сервисы можно писать не чаще чем раз в 5 секунд!");
	if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /question [текст]");
	format(string, sizeof(string), "* Вопрос от %s (%d): %s", GetPlayerNameEx(playerid), playerid, params);
	ABroadCast(COLOR_LIGHTBLUE,string,1);
	HBroadCast(COLOR_LIGHTBLUE,string,1);
	format(string, sizeof(string), "* Вы задали вопрос: %s", params);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
    SetTimer("QuestionOn", 5000, 0);questiontime = 0;
    return 1;
}
COMMAND:request(playerid,params[])
{
	new string[255];
    if(questiontime==0) return SendClientMessage(playerid, COLOR_GREY, "   В сервисы можно писать не чаще чем раз в 5 секунд!");
	if(isnull(params)) return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /request [текст]");
	format(string, sizeof(string), "* Просьба от %s (%d): %s", GetPlayerNameEx(playerid), playerid, params);
	ABroadCast(COLOR_LIGHTBLUE,string,1);
	HBroadCast(COLOR_LIGHTBLUE,string,1);
	format(string, sizeof(string), "* Вы отправили просьбу: %s", params);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	SetTimer("QuestionOn", 5000, 0);questiontime = 0;
    return 1;
}
COMMAND:answer(playerid,params[])
	return cmd_an(playerid,params);
COMMAND:an(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pHelper] > 0)
	{
	    new giveplayerid,string[255],giveplayer[MAX_PLAYER_NAME],sendername[MAX_PLAYER_NAME],result[255];

	    if (sscanf(params, "us[64]", giveplayerid,result))
			return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: (/an)swer [id_игрока/ЧастьИмени] [текст]");
		if (IsPlayerConnected(giveplayerid))
		{
		    if(giveplayerid != INVALID_PLAYER_ID)
	   		{
				GetPlayerName(playerid, sendername, sizeof(sendername));
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				if(PlayerInfo[playerid][pAdmin] > 0)
					format(string, sizeof(string), "* Администратор %s отвечает: %s", sendername, (result));
				else if(PlayerInfo[playerid][pHelper] > 0)
					format(string, sizeof(string), "* Хелпер %s отвечает: %s", sendername, (result));

				SendClientMessage(giveplayerid, COLOR_LIGHTRED, string);
				format(string, sizeof(string), " %s ответил %s: %s", sendername, giveplayer, (result));
				HABroadCast(playerid,COLOR_LIGHTRED,string,1);
				format(string, sizeof(string), " Вы ответили %s(ID: %d): %s", giveplayer, giveplayerid, (result));
				SendClientMessage(playerid,  COLOR_LIGHTRED, string);
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d - нет такого игрока.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	}
	else
        SendClientMessage(playerid, COLOR_GREY, "   Вы не администратор/хелпер !");
	return 1;
}

stock HABroadCast(playerid,color,const string[],level)
{
	foreach (Player, i)
	{
	    if(i!=playerid)
		{
			if (PlayerInfo[i][pHelper] >= level||PlayerInfo[i][pAdmin] >= level)
				SendClientMessage(i, color, string);
		}
	}
	printf("%s", string);
	return 1;
}

stock HBroadCast(color,const string[],level)
{
	foreach (Player, i)
	{
		if(PlayerInfo[i][pAdmin] == 0)
		{
			if (PlayerInfo[i][pHelper] >= level)
				SendClientMessage(i, color, string);
		}
	}
	printf("%s", string);
	return 1;
}

stock ABroadCast(color,const string[],level)
{
	foreach (Player, i)
	{
		if (PlayerInfo[i][pAdmin] >= level)
			SendClientMessage(i, color, string);
	}
	printf("%s", string);
	return 1;
}

forward QuestionOn();
public QuestionOn()
{
    questiontime=1;
	return 1;
}

COMMAND:me(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /me [действие]");
	Me(playerid, params,30.0);
	return 1;
}

COMMAND:do(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /do [действие]");
	new string[255];
	format(string, sizeof(string), "* %s ((%s))", params, GetPlayerNameEx(playerid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	return 1;
}

COMMAND:todo(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params) || strfind( params , "*" , true ) == -1 )
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /todo [текст]*[действие] (звездочка разделяет текст и действие!)");
    new arrCoords[2][128],string[255];
    sscanf(params,"p<*>s[128]s[128]",arrCoords[0],arrCoords[1]);
    if(PlayerInfo[playerid][pSex] == 2)
		format(string, sizeof(string), "{E6E6E6}\"%s\", - сказала %s,{C2A2DA} %s",arrCoords[0], GetPlayerNameEx(playerid),arrCoords[1]);
	else
		format(string, sizeof(string), "\"%s\", - сказал %s,{C2A2DA} %s",arrCoords[0], GetPlayerNameEx(playerid),arrCoords[1]);
	ProxDetector(30.0, playerid, string, COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	return 1;
}

COMMAND:try(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	new sendername[MAX_PLAYER_NAME],string[255];
	GetPlayerName(playerid, sendername, sizeof(sendername));
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /try [действие]");
	new temptryrand = random(2);
	if(temptryrand == 1)
	{
	    if(PlayerInfo[playerid][pSex] == 2) format(string, sizeof(string), "* %s попыталась %s. (удачно)", sendername, params);
		else format(string, sizeof(string), "* %s попытался %s. (удачно)", sendername, params);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	else
	{
	    if(PlayerInfo[playerid][pSex] == 2) format(string, sizeof(string), "* %s попыталась %s. (не удалось)", sendername, params);
		else format(string, sizeof(string), "* %s попытался %s. (не удалось)", sendername, params);
		ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	return 1;
}

stock PlayerMuteMessage(playerid)
{
	new string[255];
	format(string,sizeof(string), " Вы не можете разговаривать, Вы заглушены администратором. Оставшееся время заглушки - %d секунд.", PlayerInfo[playerid][pMutedTime]);
	SendClientMessage(playerid,COLOR_RED,string);
	SetPlayerChatBubble(playerid, "[mute]", COLOR_RED, 5.0, 3500);
	return 1;
}

stock Me(playerid, string[],Float:dist)
{
	new result[128];
	format(result, sizeof(result), "* %s %s", GetPlayerNameEx(playerid), string);
	ProxDetector(dist, playerid, result, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	SetPlayerChatBubble(playerid, result, COLOR_PURPLE, dist, 3500);
	printf("%s", result);
}

stock ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	new Float:posx, Float:posy, Float:posz;
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	new world = GetPlayerVirtualWorld(playerid);
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	foreach (Player, i)
	{
	    if(GetPlayerVirtualWorld(i) == world)
	    {
			GetPlayerPos(i, posx, posy, posz);
			tempposx = (oldposx -posx);
			tempposy = (oldposy -posy);
			tempposz = (oldposz -posz);
			if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
				SendClientMessage(i, col1, string);
			else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
				SendClientMessage(i, col2, string);
			else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
				SendClientMessage(i, col3, string);
			else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
				SendClientMessage(i, col4, string);
			else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				SendClientMessage(i, col5, string);
		}
	}
	return 1;
}

COMMAND:b(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /b [местный ooc чат]");
	new string[255];
	format(string, sizeof(string), "%s произнес: (( %s ))", GetPlayerNameEx(playerid), params);
	ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	printf("%s", string);
	return 1;
}

COMMAND:l(playerid,params[])
	return LocalUse(playerid,params);
COMMAND:local(playerid,params[])
	return LocalUse(playerid,params);

stock LocalUse(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
	 	return PlayerMuteMessage(playerid);
	new sendername[MAX_PLAYER_NAME],string[255];
	GetPlayerName(playerid, sendername, sizeof(sendername));
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: (/l)ocal [местный чат]");
	switch(PlayerInfo[playerid][pSex])
	{
	    case 2: format(string, sizeof(string), "%s произнесла: %s", sendername, params);
	    default: format(string, sizeof(string), "%s произнес: %s", sendername, params);
	}
	ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	printf("%s", string);
	return 1;
}

COMMAND:c(playerid,params[])
	return CloseUse(playerid,params);
COMMAND:close(playerid,params[])
    return CloseUse(playerid,params);
stock CloseUse(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /(c)lose [закрытый текст чата]");
	new string[255];
	format(string, sizeof(string), "%s тихо говорит: %s", GetPlayerNameEx(playerid), params);
    ProxDetector(3.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	printf("%s", string);
	return 1;
}

COMMAND:s(playerid,params[])
	return ShoutUse(playerid,params);
COMMAND:shout(playerid,params[])
	return ShoutUse(playerid,params);
stock ShoutUse(playerid,params[])
{
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: (/s)hout [местный чат]");
	new string[255];
	format(string, sizeof(string), "%s кричит: %s!!", GetPlayerNameEx(playerid), params);
	ProxDetector(30.0, playerid, string,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_FADE1,COLOR_FADE2);
	printf("%s", string);
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1; //Shout.Animation.
    ApplyAnimation(playerid,"RIOT","RIOT_shout",4.0,0,0,0,0,0);
	return 1;
}

COMMAND:r(playerid,params[])
{
    new sendername[MAX_PLAYER_NAME],string[255];
	sendername = GetPlayerNameEx(playerid);
    if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /r [радио чат]");
    format(string, sizeof(string), "[Радио волна] %s: %s",  sendername, params);
    new Float:Pos[3];
    GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
    new Float:rad=800.0;
    if(PlayerInfo[playerid][pCarRadio])
		rad=1800.0;
	new bit;
	foreach(Player,i)
	{
	    if(i==playerid)continue;
	    if(PlayerInfo[i][pCarRadio])
	    {
	        if(IsPlayerInRangeOfPoint(i,1800.0,Pos[0],Pos[1],Pos[2]))
	        {
	            bit++;
	            SendClientMessage(i,RADIO_MESSAGE,string);
	        }
		}
		else
		{
	    	if(IsPlayerInRangeOfPoint(i,rad,Pos[0],Pos[1],Pos[2]))
	    	{
	    	    bit++;
	        	SendClientMessage(i,RADIO_MESSAGE,string);
	   		}
	    }
	}
	format(string,sizeof(string),"[Радио волна(станций вокруг %d)] %s: %s",bit,sendername,params);
	SendClientMessage(playerid,RADIO_MESSAGE,string);
	printf("%s", string);
	return 1;
}

COMMAND:a(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] <= 0) return 1;
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: (/a)dmin [admin chat]");
	new string[128];
	format(string, sizeof(string), "[Level %d] %s: %s", PlayerInfo[playerid][pAdmin], GetPlayerNameEx(playerid), params);
	SendAdminMessage(ADMIN_MESSAGE, string);
	return 1;
}

stock SendAdminMessage(color, string[])
{
	foreach (Player, i)
	{
	    if(PlayerInfo[i][pAdmin] >= 1)
			SendClientMessage(i, color, string);
	}
	print(string);
	return 1;
}

COMMAND:hs(playerid,params[])
{
	new string[128];
	if(PlayerInfo[playerid][pHelper] <= 0) return 1;
	if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /hs [сообщение]");
	if(PlayerInfo[playerid][pHelper]==1339)
		format(string, sizeof(string), "* Босс %s: %s", GetPlayerNameEx(playerid), params);
	else
		format(string, sizeof(string), "[Level %d] %s: %s", PlayerInfo[playerid][pHelper], GetPlayerNameEx(playerid), params);
	SendHelperMessage(HELPER_CHAT_COLOR, string);
	return 1;
}

stock SendHelperMessage(color, string[])
{
	foreach (Player, i)
	{
	    if(PlayerInfo[i][pHelper] >= 1)
			SendClientMessage(i, color, string);
	}
	printf("%s", string);
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

forward ClearAnims(playerid);
public ClearAnims(playerid)
{
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0);
}

COMMAND:ooc(playerid,params[])
	return OOCUse(playerid,params);
COMMAND:o(playerid,params[])
    return OOCUse(playerid,params);
stock OOCUse(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] < 1  && PlayerInfo[playerid][pHelper] < 1337 && noooc)
		return SendClientMessage(playerid, COLOR_GRAD2, "   Канал OOC отключен администратором!");
	if(PlayerInfo[playerid][pMutedTime] > 0)
		return PlayerMuteMessage(playerid);
	new string[255];
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: (/o)oc [ooc-чат]");
	format(string, sizeof(string), "(( %s: %s ))", GetPlayerNameEx(playerid), params);
	foreach (Player, i)
		SendClientMessage(i, OOC_MESSAGE, string);

	printf("%s", string);
	return 1;
}

COMMAND:noooc(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1 && !noooc)
	{
		noooc = 1;
		SendClientMessageToAll(COLOR_GRAD2, "   OOC чат отключен администратором!");
	}
	else if (PlayerInfo[playerid][pAdmin] >= 1 && noooc)
	{
		noooc = 0;
		SendClientMessageToAll(COLOR_GRAD2, "   OOC чат включен администратором!");
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:makeadmin(playerid,params[])
{
	new para1,level,sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME],string[255];
	if(sscanf(params, "ui", para1,level))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /makeadmin [id_игрока/ЧастьИмени] [уровень(1-1339)]");
	if (PlayerInfo[playerid][pAdmin] >= 1337)
	{
	    if(IsPlayerConnected(para1))
	    {
	        if(para1 != INVALID_PLAYER_ID)
	        {
				GetPlayerName(para1, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				PlayerInfo[para1][pAdmin] = level;
				printf("AdmCmd: %s сделал %s админом уровня %d.", sendername, giveplayer, level);
				format(string, sizeof(string), "   Админом уровня %d сделал Вас %s", level, sendername);
				SendClientMessage(para1, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "   Вы сделали %s админом уровня %d.", giveplayer,level);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			}
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:makehelper(playerid,params[])
{
	new para1,level,sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME],string[255];
	if(sscanf(params, "ui", para1,level))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /makehelper [id_игрока/ЧастьИмени] [уровень]");
	if (PlayerInfo[playerid][pAdmin] >= 1337 || PlayerInfo[playerid][pHelper] >= 1339)
	{
	    if(IsPlayerConnected(para1))
	    {
	        if(para1 != INVALID_PLAYER_ID)
	        {
				GetPlayerName(para1, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				PlayerInfo[para1][pHelper] = level;
				printf("AdmCmd: %s сделал %s хелпером уровня %d.", sendername, giveplayer, level);
				format(string, sizeof(string), "   Хелпером уровня %d сделал Вас %s", level, sendername);
				SendClientMessage(para1, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "   Вы сделали %s хелпером уровня %d.", giveplayer,level);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "   %s сделал %s хелпером уровня %d!", sendername, giveplayer, level);
				ABroadCast(COLOR_LIGHTRED, string, 1);
			}
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:mute(playerid,params[])
{
	new playa,money,result[128],string[255],giveplayer[MAX_PLAYER_NAME],sendername[MAX_PLAYER_NAME];
	if(sscanf(params, "uis[64]", playa,money,result))
		return SendClientMessage(playerid, COLOR_GRAD2, "ИСПОЛЬЗУЙТЕ: /mute [id_игрока/ЧастьИмени] [время(минуты)] [причина]");
	if(IsPlayerNPC(playa))return 1;
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    if(IsPlayerConnected(playa))
	    {
	        if(playa != INVALID_PLAYER_ID)
	        {
		        GetPlayerName(playa, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "* Вас заглушил администратор %s на %d минут, причина: %s", sendername, money, (result));
				SendClientMessage(playa, COLOR_LIGHTRED, string);
				PlayerInfo[playa][pMutedTime] = money*60;
				format(string, sizeof(string), "AdmCmd: %s был заглушен администратором %s на %d минут, причина: %s",giveplayer ,sendername, money, (result));
				SendClientMessageToAll(COLOR_LIGHTRED, string);
			}
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:jail(playerid,params[])
{
	new playa,money,result[128];
	if(sscanf(params, "uis[64]", playa,money,result))
		return SendClientMessage(playerid, COLOR_GRAD2, "ИСПОЛЬЗУЙТЕ: /jail [id_игрока/ЧастьИмени] [time(minutes)] [reason/причина]");
	if(IsPlayerNPC(playa))return 1;
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    if(IsPlayerConnected(playa))
	    {
	        if(playa != INVALID_PLAYER_ID)
	        {
	            new giveplayer[MAX_PLAYER_NAME],sendername[MAX_PLAYER_NAME],string[255];
		        GetPlayerName(playa, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "* Вас заключил в тюрьму администратор %s, причина: %s", sendername, (result));
				SendClientMessage(playa, COLOR_LIGHTRED, string);
				ResetPlayerWeapons(playa);
				SetPlayerVirtualWorld(playa,playa);
				PlayerInfo[playa][pJailTime] = money*60;
				SetPlayerInterior(playa, 1);
				SetPlayerPos(playa, 2216.5884,-1071.6406,1050.4844);
				format(string, sizeof(string), "AdmCmd: %s был заключён в тюрьму администратором %s на %d минут, причина: %s ",giveplayer ,sendername, money, (result));
				SendClientMessageToAll(COLOR_LIGHTRED, string);
				format(string, sizeof(string), "*Вы заключены в тюрьму на %d минут.", money);
				SendClientMessage(playa, COLOR_LIGHTBLUE, string);
			}
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

COMMAND:dn(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz-2);
		return 1;
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:up(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz+2);
		return 1;
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:upp(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly, slz+15);
		return 1;
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:uppfly(playerid,params[])
{
    new playa;
	if(sscanf(params, "u", playa))
		return SendClientMessage(playerid, COLOR_GRAD1, " ИСПОЛЬЗУЙТЕ: /uppfly [id игрока/ЧастьИмени]");
	if (PlayerInfo[playerid][pAdmin] >= 4)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playa, slx, sly, slz);
		SetPlayerPos(playa, slx, sly, slz+1500);
		SendClientMessage(playa, COLOR_GREY, " Пошел! Пошел! Пошел!");
        new name[MAX_PLAYER_NAME];
		GetPlayerName(playa,name,sizeof(name));
	}
	return 1;
}

COMMAND:fly(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:b_x, Float:b_y, Float:b_z, Float:b_a;
		GetPlayerPos(playerid, Float:b_x, Float:b_y, Float:b_z);
		GetPlayerFacingAngle(playerid, b_a);
		b_x += 5*floatsin(-b_a, degrees);
		b_y += 5*floatcos(-b_a, degrees);
		SetPlayerPos(playerid,Float:b_x, Float:b_y, Float:b_z+5.0);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:lt(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx-2, sly, slz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:rt(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx+2, sly, slz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:ft(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly+2, slz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}
COMMAND:bk(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:slx, Float:sly, Float:slz;
		GetPlayerPos(playerid, slx, sly, slz);
		SetPlayerPos(playerid, slx, sly-2, slz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы не Администратор!");
	return 1;
}

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

enum radarinfo
{
	radarValid,
	radarObjID,//не сохранять
	Float:radarObjX,
	Float:radarObjY,
	Float:radarObjZ,
	Float:radarObjRot,

	Float:radarZoneX,
	Float:radarZoneY,
	Float:radarZoneZ,
	Float:radarZoneRad,
	Float:radarMaxSpeed,
};
new RadarInfo[MAX_RADAR][radarinfo];


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
							new st[24];
							format(st,sizeof(st),"%f",RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
						    radarspeedbit[i]=strval(st);
						    cmd_speedlimit(i,radarspeedbit[i]);
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
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%d):", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
					    	case 2:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%d)::", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
					    	case 3:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%d):::", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
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
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%d)~y~:", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
					    	case 2:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%d)~y~::", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
					    	case 3:
					    		format(sdstring, sizeof(sdstring), "%s~n~~g~Radar: ~r~(%d)~y~:::", sdstring,RadarInfo[PlayerRadarDetectID[i]][radarMaxSpeed]);
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

stock IsVehicleDrivingBackwards(vehicleid,Float:x,Float:y) // By Joker
{
	new Float:rot;
	GetVehicleZAngle(vehicleid, rot);
	if(rot < 90)
	{
		if(x > 0 && y < 0) return true;
	}
	else if(rot < 180)
	{
		if(x > 0 && y > 0) return true;
	}
	else if(rot < 270)
	{
		if(x < 0 && y > 0) return true;
	}
	else if(x < 0 && y < 0) return true;

	return false;
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

COMMAND:endround(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1337)
		GameModeExit();
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

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
new TruckChange[MAX_PLAYERS];
new SkinChange[MAX_PLAYERS];
stock PlayerTutorial(playerid,bit)
{
	switch(bit)
	{
	    case 0:
	    {
			new str[4096];
	        strcat(str,
			"{FFFF00}Описание, вступление:\n{FFFFFF}\
			Добро пожаловать на Valakas Trucker Roleplay.\n\
			В общем и целом это легкая версия валакаса с совершенно другим функционалом, не связанная с основным сервером и его ролевым процессом.\n\
		 	Основное отличие, в данный момент здесь существует только одна роль - роль дальнобойщика и все ее вытекающие градации.\n"
            );
			strcat(str,
			"{FFFF00}Описание, введение персонажа в игровой процесс:\n\n{FFFFFF}\
 			Ваш персонаж приехал в штат на заработки, увы, сейчас здесь нужна только рабочая сила, все, что вы можете себе позволить, это кредит на\n\
		 	грузовик, и далеко не на самый лучший, он может жить в кредит, но не стоит забывать, что его нужно выплачивать. Жесткая конкуренция,\n\
		  	война за доход, нескончаемая череда перевозок это лишь малая толика, того, что здесь ждет вашего персонажа.\n"
			);
			strcat(str,
			"{FFFF00}Описание, начало игры:\n{FFFFFF}\
			Сейчас вам нужно будет выбрать 4 вещи, среди них пол вашего персонажа, основной тракстоп(это место, откуда ваш персонаж будет начинать\n\
			игру), грузовик(после получения 50 очков доставки, вы сможете купить другой), и скин вашего персонажа. Обратите внимание, в отличии от\n\
			грузовика и тракстопа, пол и скин, в дальнейшем вы поменять не сможете. Так же напоминаем, что вы берете грузовик в кредит, не пугайтесь\n"
			);
			strcat(str,
			"отрицательного баланса вашего счета. После этого, вы сможете приступить к развозу продуктов, если вы преобрете трак, сначала вам нужно\n\
			будет подцепить прицеп, а если обычный грузовик, то можете сразу воспользоваться командой {F5DEB3}/delivery\n\
			{FFFF00}Описание, функции:\n"
			);
			strcat(str,
			"{FF4500}Усталость и отели:{FFFFFF}\n\
			У персонажа есть несколько жизненно важных параметров, один из них -усталость. Персонаж не может находится сутки на пролет за рулем, ему\n\
			нужно отдыхать, для этих целей по штату открыто множество мотелей, в которых можно отдохнуть посредством команды /hotel(внутри). Если не\n"
			);
			strcat(str,
			"отдыхать, у вашего персонажа будут слепаться глаза, и есть очень большой шанс попасть в аварию. Кроме того, можно стать бодрее выпив кофе,\n\
			или другой стимулирующий напиток в забегаловках, но об этом ниже.\n"
			);
			strcat(str,
			"{FF4500}Голод и забегаловки:{FFFFFF}\n\
			Второй жизненно важный параметр - голод. Персонаж должен есть, и восполнять свои силы, для этой цели в штате есть целая куча разнообразных\n\
			забегаловок, с разнообразными меню. В любой забегаловке можно воспользоваться командой /food, что бы открыть меню. Кроме еды, в меню\n\
			забегаловок есть кофейные напитки, они повышают бодрость персонажа, но немного.\n"
			);
			strcat(str,
			"{FF4500}Тракстопы:{FFFFFF}\n\
			Основное место наземной жизни дальнобойщиков - тракстопы. Каждый из них - это островок, где можно заняться ремонтом грузовика, взять нужный\n\
			для вашей доставки прицеп, немного отдохнуть, и заправиться в конце концов. Основной тракстоп выбирается при регистрации, сменить его в\n\
			дальнейшем можно командой /truckstop.\n"
			);
			strcat(str,
			"{FF4500}Телефон и прочая связь:{FFFFFF}\n\
			У каждого дальнобойщика есть как минимум 2 средства связи, это его мобильный телефон, и рация. Рация имеет радиус действия в пол километра,\n\
			чуть больше, чем у воки-токи. Все же это неплохая замена телефонной связи, у которой здесь есть один нюанс, далеко не весь штат покрыт\n\
			телефонной сетью, у игрока появился новый параметр - сигнал телефона. Его можно потерять, и звонить или отправлять сообщения станет невозможно.\n"
			);
			strcat(str,
			"В остальном, все как обычно, звонить можно посредством /call [номер абонента], поднимать и опускать трубку посредством (/h)angup и (/p)ickup,\n\
			а отправлять сообщения, посредством /sms [номер абонента] [текст сообщения]. Кроме прочего, телефон можно отключать и включать, посредством\n\
			команды /togphone.\n"
			);
			
	        ShowPlayerDialog(playerid,DIALOG_TUTORIAL,DIALOG_STYLE_MSGBOX," ",str,"Далее","");
	    }
	    case 1:
	    {
	        StartShowLbt(playerid,1,0);
	        ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Обучение","{FFFFFF}Посредством кнопок {FFFF00}[NUM 4] {FFFFFF}и{FFFF00}[NUM 6]{FFFFFF} выберите тракстоп\nЗакрепите результат с помощью кнопки {FFFF00}[Y]","Ок","");
	        TextDrawShowForPlayer(playerid,ChangeText);
	       	gPlayerChangeTruck[playerid]=1;
    		ShowPlayerTruckStop(playerid);
	    }
	    case 2:
	    {
	        ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Обучение","{FFFFFF}Посредством кнопок {FFFF00}[NUM 4] {FFFFFF}и{FFFF00}[NUM 6]{FFFFFF} выберите грузовик\nНе забудьте, что вам еще этот грузовик, нужно будет окупить на доставках.\nЗакрепите результат с помощью кнопки {FFFF00}[Y]","Ок","");
	        gPlayerChangeTruck[playerid]=2;
	        SetPlayerVirtualWorld(playerid,playerid);
	        new i = PlayerInfo[playerid][pTruckStop];
	        PlayerInfo[playerid][pCarID]=CreateVehicle(PlayerInfo[playerid][pCarModel],TruckStopInfo[i][tsX],TruckStopInfo[i][tsY],TruckStopInfo[i][tsZ],PlayerInfo[playerid][pCarRot],PlayerInfo[playerid][pCarColor1]=random(126),PlayerInfo[playerid][pCarColor2]=random(126),120000);
            new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(PlayerInfo[playerid][pCarID],engine,lights,alarm,doors,bonnet,boot,objective);
			SetVehicleParamsEx(PlayerInfo[playerid][pCarID],VEHICLE_PARAMS_OFF,VEHICLE_PARAMS_OFF,alarm,doors,bonnet,boot,objective);
			ShowPlayerTruck(playerid);
		}
		case 3:
		{
		    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Обучение","{FFFFFF}Посредством кнопок {FFFF00}[NUM 4] {FFFFFF}и{FFFF00}[NUM 6]{FFFFFF} выберите скин вашего персонажа\nЗакрепите результат с помощью кнопки {FFFF00}[Y]","Ок","");
		    gPlayerChangeTruck[playerid]=3;
		   	ShowPlayerSkin(playerid);
		}
		case 4:
		{
		    SetVehicleVirtualWorld(PlayerInfo[playerid][pCarID],0);
		    SetPlayerVirtualWorld(playerid,0);
		    SetHelpDraw(playerid,"~b~trucker.valakas.ru ~r~/help");
			oGivePlayerMoney(playerid,-CarInfo[TruckChange[playerid]][carPrice]);
		    TextDrawHideForPlayer(playerid,ChangeText);
		    gPlayerChangeTruck[playerid]=0;
		    SetCameraBehindPlayer(playerid);
		    TogglePlayerControllable(playerid,1);
		    SpawnPlayer(playerid);
		    PlayerInfo[playerid][pTutorial]=1;
		    SetTimerEx("PlayerPutToHisVehicle", 2000, 0, "d", playerid);
		    //PutPlayerInVehicle(playerid,PlayerInfo[playerid][pCarID],0);
		}
	}
	return 1;
}
forward PlayerPutToHisVehicle(playerid);
public PlayerPutToHisVehicle(playerid)
{
    PutPlayerInVehicle(playerid,PlayerInfo[playerid][pCarID],0);
    SetTimerEx("ParkS", 4000, 0, "d", playerid);
    return 1;
}
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
            if(RealChat[playerid] == 1)
			{
			    new oldchat = RealChatType[playerid];
				new newchat = oldchat;
				switch(oldchat)
				{
				    case 0:
				    {
				        if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
				    	else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
				    	else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
				    	else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
				    	else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
				    	else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
				        else if(RealChatInfo[playerid][rcA] == 1)newchat = 1;
						//else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
				    }
					case 1:
					{
					    if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
					    else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
				    	else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
				    	else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
				    	else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
				    	else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
				    	else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
				        //else if(RealChatInfo[playerid][rcA] == 1)newchat = 1;
						//else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
					}
					case 2:
					{
     					if(RealChatInfo[playerid][rcA] == 1)newchat = 1;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
					    else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
				    	else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
				    	else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
				    	else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
				    	else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
					}
					case 3:
					{
					    if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
				        else if(RealChatInfo[playerid][rcA] == 1)newchat = 1;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
					    else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
				    	else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
				    	else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
				    	else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
					}
					case 4:
					{
					    if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
				    	else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
				        else if(RealChatInfo[playerid][rcA] == 1)newchat = 1;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
					    else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
				    	else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
				    	else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
					}
					case 5:
					{
					    if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
				    	else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
				    	else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
				        else if(RealChatInfo[playerid][rcA] == 1)newchat = 1;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
					    else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
				    	else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
					}
					case 6:
					{
					    if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
				    	else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
				    	else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
				    	else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
				        else if(RealChatInfo[playerid][rcA] == 1)newchat = 1;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
					    else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
					}
					case 7:
					{
					    if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
				    	else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
				    	else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
				    	else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
				    	else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
				        else if(RealChatInfo[playerid][rcA] == 1)newchat = 1;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
					}
				}
				SetPlayerRealChat(playerid,newchat);
			}
	    }
	    case KEY_ANALOG_RIGHT:
	    {
	        switch(gPlayerChangeTruck[playerid])
	        {
		        case 1:
		        {
			        PlayerInfo[playerid][pTruckStop]++;
			        if(!TruckStopInfo[PlayerInfo[playerid][pTruckStop]][tsValid])
			        	PlayerInfo[playerid][pTruckStop]=0;
			        ShowPlayerTruckStop(playerid);
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
			if(RealChat[playerid] == 1)
			{
	      		new oldchat = RealChatType[playerid];
				new newchat = oldchat;
				switch(oldchat)
				{
				    case 0:
				    {
						if(RealChatInfo[playerid][rcA] == 1) newchat = 1;
						else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
						else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
						else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
						else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
						else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
						else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
				    }
					case 1:
					{
						if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
						else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
						else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
						else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
						else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
						else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
		    			else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
					}
					case 2:
					{
						if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
						else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
						else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
						else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
						else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
						else if(RealChatInfo[playerid][rcA] == 1) newchat = 1;
					}
					case 3:
					{
						if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
						else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
						else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
						else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
						else if(RealChatInfo[playerid][rcA] == 1) newchat = 1;
						else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
					}
					case 4:
					{
						if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
						else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
						else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
						else if(RealChatInfo[playerid][rcA] == 1) newchat = 1;
						else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
						else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
					}
					case 5:
					{
      					if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
						else if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
						else if(RealChatInfo[playerid][rcA] == 1) newchat = 1;
						else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
						else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
						else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
					}
					case 6:
					{
						if(RealChatInfo[playerid][rcHS] == 1)newchat = 7;
						else if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
						else if(RealChatInfo[playerid][rcA] == 1) newchat = 1;
						else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
						else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
						else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
						else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
					}
					case 7:
					{
						if(RealChatInfo[playerid][rcL] == 1)newchat = 0;
						else if(RealChatInfo[playerid][rcA] == 1) newchat = 1;
						else if(RealChatInfo[playerid][rcB] == 1)newchat = 2;
						else if(RealChatInfo[playerid][rcR] == 1)newchat = 3;
						else if(RealChatInfo[playerid][rcS] == 1)newchat = 4;
						else if(RealChatInfo[playerid][rcC] == 1)newchat = 5;
                        else if(RealChatInfo[playerid][rcO] == 1)newchat = 6;
					}
				}
			    SetPlayerRealChat(playerid,newchat);
			}
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

enum propinfo
{
	propValid,
	propName[64],
	Float:propX,
	Float:propY,
	Float:propZ,
};
new PropInfo[MAX_PROPS][propinfo];
stock LoadProp(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT propName, propX, propY, propZ FROM props WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>s[64]fff",
		PropInfo[i][propName],
        PropInfo[i][propX],
        PropInfo[i][propY],
        PropInfo[i][propZ]);
		PropInfo[i][propValid]=1;
	}
	else
	    PropInfo[i][propValid]=0;
	mysql_free_result();
	return 1;
}
stock PropInit()
{
    for(new i=0; i<MAX_PROPS; i++)
        LoadProp(i);
    return 1;
}
stock SaveProp(i)
{
	if(PropInfo[i][propValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE props SET propName='%s', propX='%f', propY='%f', propZ='%f' WHERE id=%d",
		PropInfo[i][propName],
        PropInfo[i][propX],
        PropInfo[i][propY],
        PropInfo[i][propZ],
		i);
		mysql_query(query);
	}
	return 1;
}

COMMAND:propshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowProp(playerid,0,29);
    return 1;
}

stock ShowProp(playerid,startid,endid)
{
	new str[4096],bit;
	for(new i=startid; i<MAX_PROPS; i++)
    {
        if(PropInfo[i][propValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%s\n",
            str,
            i,
        	PropInfo[i][propName]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список бизнессов [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_PROPLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoProp(playerid,i)
{
	SetPlayerPos(playerid,PropInfo[i][propX],PropInfo[i][propY],PropInfo[i][propZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к бизнессу %d (%s)",i,PropInfo[i][propName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:propcreate(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    if(isnull(params))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /propcreate [название предприятия]");
    for(new i=0; i<MAX_PROPS; i++)
    {
        if(!PropInfo[i][propValid])
        {
			new query[255];
		    new str[128];
		    GetPlayerPos(playerid,PropInfo[i][propX],PropInfo[i][propY],PropInfo[i][propZ]);
		    format(query,sizeof(query),"INSERT INTO props SET propName=' %s', propX='%f', propY='%f', propZ='%f', id=%d",
			params,
	        PropInfo[i][propX],
	        PropInfo[i][propY],
	        PropInfo[i][propZ],
	        i);
	        mysql_query(query);
	        LoadProp(i);
		    format(str,sizeof(str),"Вы создали предприятие %s под id %d",PropInfo[i][propName],i);
		    SendClientMessage(playerid, COLOR_GRAD2, str);
		    return 1;
		}
	}
	return 1;
}
COMMAND:propsetname(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,strl[64];
    if (sscanf(params, "is[64]",i,strl))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /propsetname [id предприятия] [название предприятия]");
    format(PropInfo[i][propName],64," %s",strl);
    SaveProp(i);
    new str[128];
    format(str,sizeof(str),"Вы установили имя предприятия %d - %s",i,PropInfo[i][propName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:propsetpos(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /propsetpos [id предприятия]");
    GetPlayerPos(playerid,PropInfo[i][propX],PropInfo[i][propY],PropInfo[i][propZ]);
    SaveProp(i);
    new str[128];
    format(str,sizeof(str),"Вы установили позицию предприятия %d ( %s )",i,PropInfo[i][propName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:gotocar(playerid,params[])
{
	new testcar;
	if(sscanf(params, "i", testcar))
		return SendClientMessage(playerid, COLOR_GRAD1, " ИСПОЛЬЗОВАНИЕ: /gotocar [id]");
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		new Float:cwx2,Float:cwy2,Float:cwz2;
		GetVehiclePos(testcar, cwx2, cwy2, cwz2);
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, cwx2+2, cwy2+2, cwz2);
		}
		else
			SetPlayerPos(playerid, cwx2+2, cwy2+2, cwz2);
		SendClientMessage(playerid, COLOR_GRAD1, "   Вы телепортированы к указанной машине!");
		SetPlayerInterior(playerid,0);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:getcar(playerid,params[])
{
	new Float:plocx,Float:plocy,Float:plocz;
	new plo;
	if(sscanf(params, "i", plo))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /getcar [id машины]");
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		GetPlayerPos(playerid, plocx, plocy, plocz);
		SetVehiclePos(plo,plocx,plocy+4, plocz);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:entercar(playerid,params[])
{
    new testcar,testcarpos=1,testcarpl=playerid;
	if(sscanf(params, "iii", testcar,testcarpos,testcarpl))
		return SendClientMessage(playerid, COLOR_GRAD1, " ИСПОЛЬЗОВАНИЕ: /entercar [id машины] [сиденье] [игрок]");
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		PutPlayerInVehicle(testcarpl, testcar, testcarpos);
		SendClientMessage(testcarpl, COLOR_GRAD1, "   Вы телепортированы в указанную машину!");
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}

new Float:TeleportDest[MAX_PLAYERS][3][10];
COMMAND:mark(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    new i=0;
	    sscanf(params,"i",i);
	    if(i>9)return 1;
		GetPlayerPos(playerid, TeleportDest[playerid][0][i],TeleportDest[playerid][1][i],TeleportDest[playerid][2][i]);
		new str[255];
		format(str,sizeof(str),"Пункт назначения телепорта [%d] установлен.",i);
		SendClientMessage(playerid, COLOR_GRAD1, str);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:gotomark(playerid,params[])
{
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    new i=0;
	    sscanf(params,"i",i);
	    if(i>9)return 1;
		if (GetPlayerState(playerid) == 2)
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			SetVehiclePos(tmpcar, TeleportDest[playerid][0][i],TeleportDest[playerid][1][i],TeleportDest[playerid][2][i]);
		}
		else
			SetPlayerPos(playerid, TeleportDest[playerid][0][i],TeleportDest[playerid][1][i],TeleportDest[playerid][2][i]);
        new str[255];
        SetPlayerInterior(playerid,0);
		format(str,sizeof(str),"Вы телепортированы к назначенному телепорту [%d].",i);
		SendClientMessage(playerid, COLOR_GRAD1, str);
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:goto(playerid,params[])
{
	new Float:plocx,Float:plocy,Float:plocz;
	new plo;
	new string[128];
	if(sscanf(params, "u", plo))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /goto [id_игрока/ЧастьИмени]");
	if (IsPlayerConnected(plo))
	{
	    if(plo != INVALID_PLAYER_ID)
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				GetPlayerPos(plo, plocx, plocy, plocz);
				SetPlayerInterior(playerid,GetPlayerInterior(plo));
				SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(plo));
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
				}
				else
					SetPlayerPos(playerid,plocx,plocy+2, plocz);
				format(string,sizeof(string),"   Вы телепортированы к указанному игроку (%d)!", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
			else
				SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
		}
	}
	else
	{
		format(string, sizeof(string), "   %d - нет такого игрока.", plo);
		SendClientMessage(playerid, COLOR_GRAD1, string);
	}
	return 1;
}
//----------------------------------[GETHERE]-----------------------------------------------

new Float:BackTelePosX[MAX_PLAYERS],Float:BackTelePosY[MAX_PLAYERS],Float:BackTelePosZ[MAX_PLAYERS],BackTeleInt[MAX_PLAYERS],BackTeleWorld[MAX_PLAYERS];

COMMAND:gethere(playerid,params[])
{
	new Float:plocx,Float:plocy,Float:plocz;
	new plo;
	new string[128];
	if(sscanf(params, "u", plo))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /gethere [id_игрока/ЧастьИмени]");
	if (IsPlayerConnected(plo))
	{
	    if(plo != INVALID_PLAYER_ID)
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
			    new interior=GetPlayerInterior(playerid);
			    new world=GetPlayerVirtualWorld(playerid);
				GetPlayerPos(playerid, plocx, plocy, plocz);
				GetPlayerPos(plo, BackTelePosX[plo],BackTelePosY[plo],BackTelePosZ[plo]);
			    BackTeleInt[plo]=GetPlayerInterior(plo);
	   		 	BackTeleWorld[plo]=GetPlayerVirtualWorld(plo);
				if (GetPlayerState(plo) == 2)
				{
					new tmpcar = GetPlayerVehicleID(plo);
					SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
					SetPlayerInterior(plo,interior);
					PlayerInfo[plo][pLocal] = PlayerInfo[playerid][pLocal];
					SetPlayerVirtualWorld(plo,world);
					LinkVehicleToInterior(tmpcar,interior);
					SetVehicleVirtualWorld(tmpcar,world);
				}
				else
				{
				    SetPlayerInterior(plo,interior);
					PlayerInfo[plo][pLocal] = PlayerInfo[playerid][pLocal];
					SetPlayerVirtualWorld(plo,world);
					SetPlayerPos(plo,plocx,plocy+1.5, plocz);
				}
				SendClientMessage(plo, COLOR_GRAD1, "   Вас телепортировали!");
			}
			else
				SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
		}
	}
	else
	{
		format(string, sizeof(string), "   %d - нет такого игрока.", plo);
		SendClientMessage(playerid, COLOR_GRAD1, string);
	}
	return 1;
}
COMMAND:backhere(playerid,params[])
{
    if (PlayerInfo[playerid][pAdmin] >= 1)
	{
	    new plo,string[255];
		if(sscanf(params, "u", plo))
			return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /backhere [id_игрока/ЧастьИмени]");
		if (IsPlayerConnected(plo))
		{
	    	if(plo != INVALID_PLAYER_ID)
	    	{
	    	    if(BackTelePosZ[plo]!=0.0)
	    	    {
		    	    SetPlayerPos(plo, BackTelePosX[plo],BackTelePosY[plo],BackTelePosZ[plo]);
				    GetPlayerInterior(BackTeleInt[plo]);
		   		 	GetPlayerVirtualWorld(BackTeleWorld[plo]);
		   		 	SendClientMessage(plo, COLOR_GRAD1, " Вас телепортировали обратно!");
		   		 	SendClientMessage(playerid, COLOR_GRAD1, " Вы вернули игрока на место первоначальной телепортации!");
		   		 	BackTelePosZ[plo]=0.0;
	   		 	}
	   		 	else
	   		 		SendClientMessage(playerid, COLOR_GRAD1, " Этого игрока еще не телепортировали!");
	    	}
	    	else
			{
				format(string, sizeof(string), "   %d - нет такого игрока.", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
	    }
	    else
		{
			format(string, sizeof(string), "   %d - нет такого игрока.", plo);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:tpto(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
	    new string[255],sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME];
		new telename[MAX_PLAYER_NAME];
		new giveplayerid,teleid;
		new Float:pX, Float:pY, Float:pZ,interior,world;
		if (!sscanf(params, "uu", giveplayerid,teleid))
		{
			if (IsPlayerConnected(giveplayerid) && IsPlayerConnected(teleid))
			{
				GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				GetPlayerName(teleid, telename, sizeof(telename));
				GetPlayerPos(teleid, pX,pY,pZ);
				interior=GetPlayerInterior(teleid);
				world=GetPlayerVirtualWorld(teleid);
				SetPlayerInterior(giveplayerid,interior);
				SetPlayerVirtualWorld(giveplayerid,world);
				SetPlayerPos(giveplayerid, pX,pY,pZ);
				PlayerInfo[giveplayerid][pLocal] = PlayerInfo[teleid][pLocal];
				format(string, sizeof(string), " * Вы телепортировали %s'а (id: %d) к %s'у (id: %d).", giveplayer,giveplayerid,telename,teleid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), " * Вы были телепортированы к %s'у (id: %d) %s'ом (id: %d).", telename,teleid,sendername,playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
			}
			if (!IsPlayerConnected(giveplayerid))
			{
				format(string, sizeof(string), " * %d - неверный id игрока. (Игрок отсутствует на сервере)", giveplayerid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
			if (!IsPlayerConnected(teleid))
			{
				format(string, sizeof(string), " * %d - неверный id игрока. (Игрок отсутствует на сервере)", teleid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		}
		else
		    SendClientMessage(playerid, COLOR_WHITE, " * Используйте: /tpto [id игрока] [к id игрока]");
	}
	return 1;
}

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
stock Float:GetDistanceBetweenPoints(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
	return floatadd(floatadd(floatsqroot(floatpower(floatsub(x1,x2),2)),floatsqroot(floatpower(floatsub(y1,y2),2))),floatsqroot(floatpower(floatsub(z1,z2),2)));

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

COMMAND:help(playerid,params[])
{
	new str[4096];
	strcat(str,"{FFFF00}Основное: {FFFFFF}/help /stats /pay /report /question /request /truckstop /hotel /food /repair /buy /buycar /gps /convoy /rc\n");
    strcat(str,"{FFFF00}Основное: {FFFFFF}/speedo /speedlimit /park /delivery /engine /open /lights /note /givemyfuel /closestdelivery /animlist\n");
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
	new query[255],Field[255];
	format(query,sizeof(query),"SELECT gasX, gasY, gasZ FROM gas WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>fff",
		GasInfo[i][gasX],
		GasInfo[i][gasY],
		GasInfo[i][gasZ]);
	    GasInfo[i][gasValid]=1;
	    GasLabel[i]=CreateDynamic3DTextLabel("Заправка\nНажмите гудок [H]", COLOR_GREEN,GasInfo[i][gasX], GasInfo[i][gasY], GasInfo[i][gasZ], 15.0);
		GasPickup[i]=CreateDynamicPickup(1676,2,GasInfo[i][gasX], GasInfo[i][gasY], GasInfo[i][gasZ]);
		GasIcon[i]=CreateDynamicMapIcon(GasInfo[i][gasX], GasInfo[i][gasY], GasInfo[i][gasZ],55, -1,-1,-1, -1, 250.0);
	}
	else
	    GasInfo[i][gasValid]=0;
	mysql_free_result();
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
		mysql_query(query);
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
			mysql_query(query);
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
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили заправку %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
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

stock Translate(str[])
{
    new retstr[512];
    for(new i=0;i<strlen(str);i++)
	{
		switch(str[i])
		{
			case 'А':strcat(retstr,"A");
			case 'Б':strcat(retstr,"B");
			case 'В':strcat(retstr,"V");
			case 'Г':strcat(retstr,"G");
			case 'Д':strcat(retstr,"D");
			case 'Е':strcat(retstr,"E");
			case 'Ё':strcat(retstr,"Jo");
			case 'Ж':strcat(retstr,"Zh");
            case 'З':strcat(retstr,"Z");
            case 'И':strcat(retstr,"I");
            case 'Й':strcat(retstr,"J");
            case 'К':strcat(retstr,"K");
            case 'Л':strcat(retstr,"L");
            case 'М':strcat(retstr,"M");
            case 'Н':strcat(retstr,"N");
            case 'О':strcat(retstr,"O");
            case 'П':strcat(retstr,"P");
            case 'Р':strcat(retstr,"R");
            case 'С':strcat(retstr,"S");
            case 'Т':strcat(retstr,"T");
            case 'У':strcat(retstr,"U");
            case 'Ф':strcat(retstr,"F");
            case 'Х':strcat(retstr,"H");
            case 'Ц':strcat(retstr,"C");
            case 'Ч':strcat(retstr,"Ch");
            case 'Ш':strcat(retstr,"Sh");
            case 'Щ':strcat(retstr,"Shh");
            case 'Ь':strcat(retstr,"#");
            case 'Ы':strcat(retstr,"Y");
            case 'Ъ':strcat(retstr,"'");
            case 'Э':strcat(retstr,"Je");
            case 'Ю':strcat(retstr,"Ju");
            case 'Я':strcat(retstr,"Ja");
            case 'а':strcat(retstr,"a");
			case 'б':strcat(retstr,"b");
			case 'в':strcat(retstr,"v");
			case 'г':strcat(retstr,"g");
			case 'д':strcat(retstr,"d");
			case 'е':strcat(retstr,"e");
			case 'ё':strcat(retstr,"jo");
			case 'ж':strcat(retstr,"zh");
            case 'з':strcat(retstr,"z");
            case 'и':strcat(retstr,"i");
            case 'й':strcat(retstr,"j");
            case 'к':strcat(retstr,"k");
            case 'л':strcat(retstr,"l");
            case 'м':strcat(retstr,"m");
            case 'н':strcat(retstr,"n");
            case 'о':strcat(retstr,"o");
            case 'п':strcat(retstr,"p");
            case 'р':strcat(retstr,"r");
            case 'с':strcat(retstr,"s");
            case 'т':strcat(retstr,"t");
            case 'у':strcat(retstr,"u");
            case 'ф':strcat(retstr,"f");
            case 'х':strcat(retstr,"h");
            case 'ц':strcat(retstr,"c");
            case 'ч':strcat(retstr,"ch");
            case 'ш':strcat(retstr,"sh");
            case 'щ':strcat(retstr,"shh");
            case 'ъ':strcat(retstr,"#");
            case 'ы':strcat(retstr,"y");
            case 'ь':strcat(retstr,"'");
            case 'э':strcat(retstr,"je");
            case 'ю':strcat(retstr,"ju");
            case 'я':strcat(retstr,"ja");
            case ' ':strcat(retstr," ");
            case '0':strcat(retstr,"0");
            case '1':strcat(retstr,"1");
            case '2':strcat(retstr,"2");
            case '3':strcat(retstr,"3");
            case '4':strcat(retstr,"4");
            case '5':strcat(retstr,"5");
            case '6':strcat(retstr,"6");
            case '7':strcat(retstr,"7");
            case '8':strcat(retstr,"8");
            case '9':strcat(retstr,"9");
            case 'a':strcat(retstr,"a");
            case 'b':strcat(retstr,"b");
            case 'c':strcat(retstr,"c");
            case 'd':strcat(retstr,"d");
            case 'e':strcat(retstr,"e");
            case 'f':strcat(retstr,"f");
            case 'g':strcat(retstr,"g");
            case 'h':strcat(retstr,"h");
            case 'i':strcat(retstr,"i");
            case 'j':strcat(retstr,"j");
            case 'k':strcat(retstr,"k");
            case 'l':strcat(retstr,"l");
            case 'm':strcat(retstr,"m");
            case 'n':strcat(retstr,"n");
            case 'o':strcat(retstr,"o");
            case 'p':strcat(retstr,"p");
            case 'q':strcat(retstr,"q");
            case 'r':strcat(retstr,"r");
            case 's':strcat(retstr,"s");
            case 't':strcat(retstr,"t");
            case 'u':strcat(retstr,"u");
            case 'v':strcat(retstr,"v");
            case 'w':strcat(retstr,"w");
            case 'x':strcat(retstr,"x");
            case 'y':strcat(retstr,"y");
            case 'z':strcat(retstr,"z");
            case 'A':strcat(retstr,"A");
            case 'B':strcat(retstr,"B");
            case 'C':strcat(retstr,"C");
            case 'D':strcat(retstr,"D");
            case 'E':strcat(retstr,"E");
            case 'F':strcat(retstr,"F");
            case 'G':strcat(retstr,"G");
            case 'H':strcat(retstr,"H");
            case 'I':strcat(retstr,"I");
            case 'J':strcat(retstr,"J");
            case 'K':strcat(retstr,"K");
            case 'L':strcat(retstr,"L");
            case 'M':strcat(retstr,"M");
            case 'N':strcat(retstr,"N");
            case 'O':strcat(retstr,"O");
			case 'P':strcat(retstr,"P");
            case 'Q':strcat(retstr,"Q");
            case 'R':strcat(retstr,"R");
            case 'S':strcat(retstr,"S");
            case 'T':strcat(retstr,"T");
            case 'U':strcat(retstr,"U");
            case 'V':strcat(retstr,"V");
            case 'W':strcat(retstr,"W");
            case 'X':strcat(retstr,"X");
            case 'Y':strcat(retstr,"Y");
            case 'Z':strcat(retstr,"Z");
            case '!':strcat(retstr,"!");
            case '@':strcat(retstr,"@");
            case '#':strcat(retstr,"#");
            case '$':strcat(retstr,"$");
            case '%':strcat(retstr,"%");
            case '^':strcat(retstr,"^");
            case '&':strcat(retstr,"&");
            case '*':strcat(retstr,"*");
            case '(':strcat(retstr,"(");
            case ')':strcat(retstr,")");
            case '-':strcat(retstr,"-");
            case '_':strcat(retstr,"_");
            case '=':strcat(retstr,"=");
            case '+':strcat(retstr,"+");
            case ';':strcat(retstr,";");
            case ':':strcat(retstr,":");
            case '|':strcat(retstr,"|");
            case '[':strcat(retstr,"[");
            case ']':strcat(retstr,"]");
            case '{':strcat(retstr,"{");
            case '}':strcat(retstr,"}");
            case '.':strcat(retstr,".");
            case ',':strcat(retstr,",");
            case '?':strcat(retstr,"?");
            case '/':strcat(retstr,"/");
            default: strcat(retstr,str[i]);
		}
	}
	return retstr;
}

stock PlayerDeathTrailer(playerid)
{
	new carid=GetPlayerVehicleID(playerid);
	if(IsATruck(carid))DetachTrailerFromVehicle(carid);
	return 1;
}

stock IsATruck(carid)
{
    switch(GetVehicleModel(carid))
    {
		case 403,514,515: return 1;
	}
	return 0;
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

enum mobilestation
{
    mobilestationValid,
	Float:mobilestationX,
	Float:mobilestationY,
	Float:mobilestationZ,
	Float:mobilestationRad,
	mobilestationObject,//не сохранять
}
new MobileStation[MAX_MOBILESTATION][mobilestation];
stock LoadMobileStation(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT mobilestationX, mobilestationY, mobilestationZ, mobilestationRad FROM mobilestations WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>ffff",
		MobileStation[i][mobilestationX],
		MobileStation[i][mobilestationY],
		MobileStation[i][mobilestationZ],
		MobileStation[i][mobilestationRad]);
	    MobileStation[i][mobilestationValid]=1;
	   	MobileStation[i][mobilestationObject]=CreateDynamicObject(3763,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ],0.0,0.0,0.0);
	}
	else
	    MobileStation[i][mobilestationValid]=0;
	mysql_free_result();
	return 1;
}
stock MobileStationInit()
{
    for(new i=0; i<MAX_MOBILESTATION; i++)
        LoadMobileStation(i);
	return 1;
}
stock SaveMobileStation(i)
{
    if(MobileStation[i][mobilestationValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE mobilestations SET mobilestationX='%f', mobilestationY='%f', mobilestationZ='%f', mobilestationRad='%f' WHERE id=%d",
		MobileStation[i][mobilestationX],
		MobileStation[i][mobilestationY],
		MobileStation[i][mobilestationZ],
		MobileStation[i][mobilestationRad],
		i);
		DestroyDynamicObject(MobileStation[i][mobilestationObject]);
		MobileStation[i][mobilestationObject]=CreateDynamicObject(3763,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ],0.0,0.0,0.0);
		mysql_query(query);
	}
	return 1;
}
COMMAND:mobilestationcreate(playerid,params[])
{
    new Float:rad;
    if (sscanf(params, "f",rad))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /mobilestationcreate [радиус вещания]");
	if(rad < 10.0|| rad > 1500.0)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Радиус от 10 до 1500");
	for(new i=0; i<MAX_MOBILESTATION; i++)
    {
        if(!MobileStation[i][mobilestationValid])
		{
		    GetPlayerPos(playerid,	MobileStation[i][mobilestationX],
			MobileStation[i][mobilestationY],
			MobileStation[i][mobilestationZ]);
			MobileStation[i][mobilestationRad]=rad;
            new query[255];
		    format(query,sizeof(query),"INSERT INTO mobilestations SET mobilestationX='%f', mobilestationY='%f', mobilestationZ='%f', mobilestationRad='%f', id=%d",
			MobileStation[i][mobilestationX],
			MobileStation[i][mobilestationY],
			MobileStation[i][mobilestationZ]+3.0,
			MobileStation[i][mobilestationRad],
			i);
			mysql_query(query);
			LoadMobileStation(i);
			new str[128];
			format(str,sizeof(str),"Вы создали мобильную башню %d, радиус вещания %f",i,rad);
			SendClientMessage(playerid,COLOR_GRAD2,str);
		    return 1;
		}
    }
    return 1;
}

COMMAND:mobilestationshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowMobileStation(playerid,0,29);
    return 1;
}

stock ShowMobileStation(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_RADAR; i++)
    {
        if(MobileStation[i][mobilestationValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%0.1f\n",
            str,
            i,
        	MobileStation[i][mobilestationRad]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список мобильных башен [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_MOBILESTATIONLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoMobileStation(playerid,i)
{
	SetPlayerPos(playerid,MobileStation[i][mobilestationX],
	MobileStation[i][mobilestationY],
	MobileStation[i][mobilestationZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к мобильной башне %d (%0.1f)",i,MobileStation[i][mobilestationRad]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:mobilestationdelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /mobilestationdelete [id башни]");
    MobileStation[i][mobilestationValid]=0;
    DestroyDynamicObject(MobileStation[i][mobilestationObject]);
    format(str,sizeof(str),"DELETE FROM mobilestations WHERE id=%d",i);
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили мобильную башню %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:mobilestationsetpos(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i, Float:rad;
    if (sscanf(params, "if",i,rad))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /mobilestationsetpos [id башни] [радиус вещания]");
    if(rad < 10.0|| rad > 1500.0)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Радиус от 10 до 1500");
	GetPlayerPos(playerid,MobileStation[i][mobilestationX],
	MobileStation[i][mobilestationY],
	MobileStation[i][mobilestationZ]);
	SaveMobileStation(i);
	new str[255];
	format(str,sizeof(str),"Вы установили позицию башни %d и ее радиус вещания %f",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

stock GetPlayerClosestMobileStation(playerid)
{
	new id=-1, Float:dist=0.0, Float:mindist=9999.0;
	for(new i=0; i<MAX_MOBILESTATION; i++)
    {
        if(MobileStation[i][mobilestationValid])
		{
		    dist=GetPlayerDistanceFromPoint(playerid,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]);
			if(dist < MobileStation[i][mobilestationRad])
			{
			    if(dist < mindist)
			    {
				    mindist=dist;
				    id=i;
			    }
			}
		}
	}
	return id;
}
stock SignalSetString(playerid)
{
    new str[255];
	switch(Signal[playerid])
	{
	    case -1:
	        str = "~g~signal: ~y~!~b~offline";
	    case 0:
	        str = "~g~signal: ~y~!~b~lost";
	    case 1:
	        str = "~g~signal: ~y~!~b~-";
	    case 2:
	        str = "~g~signal: ~y~!~b~--";
	    case 3:
	        str = "~g~signal: ~y~!~b~---";
	    case 4:
	        str = "~g~signal: ~y~!~b~----";
	    case 5:
	    	str = "~g~signal: ~y~!~b~-----";
	}
	return str;
}
stock GetSignal(playerid)
{
	if(!PlayerInfo[playerid][pPhoneOnline])return -1;
	new i=GetPlayerClosestMobileStation(playerid);
	if(i!=-1)
	{
	    if(IsPlayerInRangeOfPoint(playerid,MobileStation[i][mobilestationRad]/5*1,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]))
            return 5;
		else if(IsPlayerInRangeOfPoint(playerid,MobileStation[i][mobilestationRad]/5*2,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]))
            return 4;
		else if(IsPlayerInRangeOfPoint(playerid,MobileStation[i][mobilestationRad]/5*3,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]))
            return 3;
		else if(IsPlayerInRangeOfPoint(playerid,MobileStation[i][mobilestationRad]/5*4,MobileStation[i][mobilestationX],MobileStation[i][mobilestationY],MobileStation[i][mobilestationZ]))
            return 2;
		else
   			return 1;
	}
	else
	    return 0;
}

COMMAND:note(playerid, params[])
{
	ShowNote(playerid,0);
	return 1;
}

stock ShowNote(playerid,bit)
{
	new query[255],Field[512],str[2048];
	new TextBit[2][128],idbit;
	new minl,maxl;
	minl=25*bit;
	maxl=minl+25;
    format(query, sizeof(query), "SELECT id, time, message FROM note WHERE name='%s' ORDER BY id DESC LIMIT %d,%d",oGetPlayerName(playerid),minl,maxl);
    mysql_query(query);
	mysql_store_result();
	if(mysql_num_rows() != 0)
	{
		if(mysql_fetch_row_format(Field))
		{
			sscanf(Field,"p<|>is[64]s[128]",
			idbit,
			TextBit[0],
			TextBit[1]);
			format(str,sizeof(str),"%s\n%s[%s]:%s",str,idbit,TextBit[0],TextBit[1]);
		}
	}
	else
	{
	    format(str,sizeof(str),"Пусто.");
	}
	ShowPlayerDialog(playerid,DIALOG_NOTE,DIALOG_STYLE_INPUT,"Блокнот(/help для дополнительной информации):",str,"Отправить","Выход");
	return 1;
}
stock AddNote(playerid,text[])
{
    new query[255];
	new time[128];
	new ye,mo,da,hour,minute,second;
	getdate(ye,mo,da);
	gettime(hour,minute,second);
	format(time, sizeof(time),"%02d-%02d %02d:%02d:%02d",mo,da,hour,minute,second);
	format(query,sizeof(query),"INSERT INTO note SET name='%s', time='%s', message=' %s'",oGetPlayerName(playerid),time,text);
    mysql_query(query);
	return 1;
}
stock DeleteNote(playerid, id)
{
    new query[255];
    format(query,sizeof(query),"DELETE FROM note WHERE id='%d' AND name='%s'",id,oGetPlayerName(playerid));
    mysql_query(query);
	return 1;
}

stock ObjectsInit()
{
CreateObject(4100,-175.19999695,-334.50000000,2.09999990,0.00000000,0.00000000,94.00000000); //object(meshfence1_lan) (1)
CreateObject(4100,-91.00000000,-394.69921875,4.09999990,0.00000000,0.00000000,129.99572754); //object(meshfence1_lan) (2)
CreateObject(4100,-104.50000000,-392.19921875,4.09999990,0.00000000,0.00000000,129.99572754); //object(meshfence1_lan) (3)
CreateObject(4100,-107.89941406,-391.59960938,4.09999990,0.00000000,0.00000000,129.99572754); //object(meshfence1_lan) (4)
CreateObject(4100,-150.39999390,-358.89999390,2.09999990,0.00000000,0.00000000,275.99206543); //object(meshfence1_lan) (5)
CreateObject(4100,-184.69921875,-324.59960938,2.09999990,0.00000000,0.00000000,93.99902344); //object(meshfence1_lan) (6)
CreateObject(4100,-165.10000610,-344.60000610,2.09999990,0.00000000,0.00000000,276.00000000); //object(meshfence1_lan) (7)
CreateObject(4100,-155.30000305,-354.10000610,2.09999990,0.00000000,0.00000000,276.00000000); //object(meshfence1_lan) (8)
CreateObject(3881,-132.89999390,-369.20001221,2.29999995,0.00000000,0.00000000,138.00000000); //object(airsecbooth_sfse) (1)
CreateObject(4100,-119.79980469,-385.89941406,2.09999990,0.00000000,0.00000000,99.99206543); //object(meshfence1_lan) (5)
CreateObject(4100,-238.60000610,-259.39999390,2.09999990,0.00000000,0.00000000,85.99902344); //object(meshfence1_lan) (6)
CreateObject(4100,-204.09960938,-302.59960938,2.09999990,0.00000000,0.00000000,93.99902344); //object(meshfence1_lan) (6)
CreateObject(4100,-213.39941406,-292.50000000,2.09999990,0.00000000,0.00000000,91.99401855); //object(meshfence1_lan) (6)
CreateObject(4100,-222.29980469,-282.09960938,2.09999990,0.00000000,0.00000000,89.99450684); //object(meshfence1_lan) (6)
CreateObject(4100,-244.59960938,-251.09960938,2.09999990,0.00000000,0.00000000,85.99548340); //object(meshfence1_lan) (6)
CreateObject(3275,2213.79980469,83.89941406,26.29999924,0.00000000,0.00000000,87.99548340); //object(cxreffence) (1)
CreateObject(16439,2087.50000000,100.19999695,29.97999954,351.00000000,0.00000000,76.00000000); //object(cn2_roadblock04) (1)
CreateObject(973,286.29998779,819.79998779,16.79999924,0.00000000,5.29998779,294.00000000); //object(sub_roadbarrier) (1)
CreateObject(979,252.69999695,891.90002441,22.70000076,0.00000000,4.00000000,286.25000000); //object(sub_roadleft) (1)
CreateObject(979,249.89999390,901.00000000,23.39999962,0.00000000,3.99902344,288.24829102); //object(sub_roadleft) (3)
CreateObject(979,263.00000000,855.40002441,19.70000076,0.00000000,3.99902344,286.24877930); //object(sub_roadleft) (4)
CreateObject(978,-15.50000000,640.50000000,9.05000019,0.00000000,2.89489746,14.99084473); //object(sub_roadright) (3)
CreateObject(1237,283.39999390,856.00000000,18.50000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(978,269.60000610,852.70001221,19.39999962,0.00000000,356.00000000,104.99627686); //object(sub_roadright) (4)
CreateObject(978,271.79998779,843.40002441,18.60000038,0.00000000,355.00000000,100.99142456); //object(sub_roadright) (6)
CreateObject(978,272.79998779,824.79998779,16.39999962,0.00000000,352.00000000,82.97729492); //object(sub_roadright) (7)
CreateObject(979,255.19921875,882.79980469,21.89999962,0.00000000,3.98803711,284.24380493); //object(sub_roadleft) (13)
CreateObject(979,257.69921875,873.69921875,21.20000076,0.00000000,3.99353027,286.24328613); //object(sub_roadleft) (14)
CreateObject(979,260.29980469,864.50000000,20.39999962,0.00000000,3.99353027,286.24328613); //object(sub_roadleft) (15)
CreateObject(979,266.89941406,837.00000000,18.00000000,0.00000000,7.00000000,276.24023438); //object(sub_roadleft) (16)
CreateObject(979,265.39941406,846.19921875,19.00000000,0.00000000,4.50000000,282.23876953); //object(sub_roadleft) (17)
CreateObject(979,265.79998779,818.79998779,15.39999962,0.00000000,9.00000000,256.23669434); //object(sub_roadleft) (18)
CreateObject(978,383.79998779,670.50000000,12.30000019,0.00000000,355.00000000,294.97595215); //object(sub_roadright) (7)
CreateObject(978,358.29998779,783.20001221,6.40000010,0.00000000,5.00000000,336.97656250); //object(sub_roadright) (7)
CreateObject(978,290.79998779,843.50000000,17.79999924,0.00000000,5.99853516,300.97595215); //object(sub_roadright) (7)
CreateObject(978,295.89999390,835.70001221,16.89999962,0.00000000,5.69641113,304.97546387); //object(sub_roadright) (7)
CreateObject(978,301.20001221,828.09997559,16.00000000,0.00000000,5.00000000,304.98046875); //object(sub_roadright) (7)
CreateObject(978,306.79998779,820.70001221,15.10000038,0.00000000,6.69616699,308.97399902); //object(sub_roadright) (7)
CreateObject(978,312.89999390,813.70001221,14.00000000,0.00000000,6.99829102,312.97253418); //object(sub_roadright) (7)
CreateObject(979,261.50000000,905.79998779,23.39999962,0.00000000,354.00000000,112.48352051); //object(sub_roadleft) (5)
CreateObject(979,269.39999390,889.00000000,21.89999962,0.00000000,355.99548340,118.48352051); //object(sub_roadleft) (5)
CreateObject(979,265.19921875,897.29980469,22.60000038,0.00000000,355.98999023,114.48303223); //object(sub_roadleft) (5)
CreateObject(979,274.20001221,880.90002441,21.20000076,0.00000000,355.98999023,122.48202515); //object(sub_roadleft) (5)
CreateObject(979,279.19921875,873.00000000,20.39999962,0.00000000,355.98449707,122.47558594); //object(sub_roadleft) (5)
CreateObject(979,284.29998779,865.09997559,19.70000076,0.00000000,355.98449707,122.48104858); //object(sub_roadleft) (5)
CreateObject(979,289.29980469,857.19921875,19.00000000,0.00000000,355.29785156,122.47558594); //object(sub_roadleft) (5)
CreateObject(979,294.29998779,849.29998779,18.20000076,0.00000000,355.00000000,122.47552490); //object(sub_roadleft) (5)
CreateObject(979,299.39999390,841.40002441,17.29999924,0.00000000,354.00000000,122.47003174); //object(sub_roadleft) (5)
CreateObject(979,329.00000000,807.40002441,10.89999962,0.00000000,350.00000000,144.46453857); //object(sub_roadleft) (5)
CreateObject(973,-38.40000153,626.59997559,11.10000038,0.00000000,355.00000000,205.99365234); //object(sub_roadbarrier) (1)
CreateObject(973,-55.09999847,618.79998779,12.44999981,0.00000000,355.99548340,201.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,-72.30000305,612.40002441,13.39999962,0.00000000,358.00000000,199.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,-63.69921875,615.50000000,13.00000000,0.00000000,357.00000000,199.98962402); //object(sub_roadbarrier) (1)
CreateObject(973,-81.09999847,609.20001221,13.80000019,0.00000000,357.00000000,199.98962402); //object(sub_roadbarrier) (1)
CreateObject(973,-81.09960938,609.19921875,13.80000019,0.00000000,356.99523926,199.98413086); //object(sub_roadbarrier) (1)
CreateObject(973,-81.09960938,609.19921875,13.80000019,0.00000000,356.99523926,199.98413086); //object(sub_roadbarrier) (1)
CreateObject(973,-63.69921875,615.50000000,13.00000000,0.00000000,356.99523926,199.98413086); //object(sub_roadbarrier) (1)
CreateObject(973,-89.80000305,606.00000000,14.31999969,0.00000000,357.00000000,199.40002441); //object(sub_roadbarrier) (1)
CreateObject(973,-89.79980469,606.00000000,14.31999969,0.00000000,356.99523926,199.39636230); //object(sub_roadbarrier) (1)
CreateObject(973,-89.79980469,606.00000000,14.31999969,0.00000000,356.99523926,199.39636230); //object(sub_roadbarrier) (1)
CreateObject(973,275.39999390,844.29998779,18.70000076,0.00000000,4.00000000,293.99877930); //object(sub_roadbarrier) (1)
CreateObject(973,290.20001221,841.29998779,17.85000038,0.00000000,356.00000000,113.99996948); //object(sub_roadbarrier) (1)
CreateObject(973,-107.69999695,600.79998779,15.10000038,0.00000000,358.00000000,193.99511719); //object(sub_roadbarrier) (1)
CreateObject(973,-98.69921875,603.19921875,14.73999977,0.00000000,357.90002441,195.20001221); //object(sub_roadbarrier) (1)
CreateObject(973,-152.69999695,591.20001221,15.69999981,0.00000000,0.00000000,189.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-134.50000000,594.40002441,15.64000034,0.00000000,359.50000000,189.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-125.59999847,596.29998779,15.52000046,0.00000000,359.00000000,193.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-143.60000610,592.79998779,15.69999981,0.00000000,359.60000610,190.49060059); //object(sub_roadbarrier) (1)
CreateObject(973,-161.69999695,589.59997559,15.64999962,0.00000000,0.50000000,189.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-206.89999390,584.09997559,15.39999962,0.00000000,0.00000000,185.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-170.89999390,588.09997559,15.63000011,0.00000000,0.00000000,187.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-188.69921875,586.00000000,15.60000038,0.00000000,0.20001221,185.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-179.69999695,587.00000000,15.60000038,0.00000000,0.00000000,185.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-197.60000610,585.09997559,15.50000000,0.00000000,1.00000000,185.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-179.69921875,587.00000000,15.60000038,0.00000000,0.00000000,185.98754883); //object(sub_roadbarrier) (1)
CreateObject(973,-216.10000610,583.09997559,15.39999962,0.00000000,0.00000000,185.99060059); //object(sub_roadbarrier) (1)
CreateObject(973,-296.79998779,576.70001221,15.89999962,0.00000000,0.00000000,181.98754883); //object(sub_roadbarrier) (1)
CreateObject(973,-225.30000305,582.09997559,15.39999962,0.00000000,0.00000000,185.99060059); //object(sub_roadbarrier) (1)
CreateObject(1237,-1.89999998,644.79998779,7.50000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,-283.79998779,544.90002441,15.30000019,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,-0.69921875,645.09960938,7.40000010,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,-283.20001221,545.29998779,15.30000019,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,-283.20001221,544.50000000,15.30000019,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(979,304.39941406,833.79980469,16.10000038,0.00000000,351.99096680,124.46411133); //object(sub_roadleft) (5)
CreateObject(979,309.89941406,826.19921875,14.89999962,0.00000000,351.99096680,126.46362305); //object(sub_roadleft) (5)
CreateObject(979,315.69921875,819.09960938,13.69999981,0.00000000,351.99096680,132.46215820); //object(sub_roadleft) (5)
CreateObject(979,322.09960938,812.89941406,12.39999962,0.00000000,351.99096680,138.46069336); //object(sub_roadleft) (5)
CreateObject(979,336.50000000,802.09997559,9.39999962,0.00000000,349.99694824,144.45922852); //object(sub_roadleft) (5)
CreateObject(979,344.20001221,796.90002441,8.10000038,0.00000000,354.00000000,148.45922852); //object(sub_roadleft) (5)
CreateObject(979,352.29998779,792.50000000,7.30000019,0.00000000,355.00000000,154.45825195); //object(sub_roadleft) (5)
CreateObject(979,360.79998779,788.79998779,6.59999990,0.00000000,356.00000000,158.45629883); //object(sub_roadleft) (5)
CreateObject(979,369.50000000,785.29998779,6.09999990,0.00000000,358.00000000,158.45581055); //object(sub_roadleft) (5)
CreateObject(979,378.29998779,782.20001221,5.90000010,0.00000000,359.00000000,162.45581055); //object(sub_roadleft) (5)
CreateObject(979,387.29998779,779.90002441,5.75000000,0.00000000,359.00000000,168.45434570); //object(sub_roadleft) (5)
CreateObject(979,396.39941406,777.79980469,5.59999990,0.00000000,358.99475098,166.45385742); //object(sub_roadleft) (5)
CreateObject(1237,402.00000000,776.20001221,5.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,401.19921875,776.00000000,5.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,401.39941406,776.79980469,5.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(978,319.50000000,807.39941406,12.60000038,0.00000000,9.99755859,318.97155762); //object(sub_roadright) (7)
CreateObject(978,326.59960938,801.69921875,11.00000000,0.00000000,9.99755859,322.97607422); //object(sub_roadright) (7)
CreateObject(978,333.89941406,796.39941406,9.50000000,0.00000000,8.99780273,324.97558594); //object(sub_roadright) (7)
CreateObject(978,341.59960938,791.39941406,8.30000019,0.00000000,5.99853516,328.97460938); //object(sub_roadright) (7)
CreateObject(978,349.79980469,787.00000000,7.30999994,0.00000000,5.99853516,334.97314453); //object(sub_roadright) (7)
CreateObject(1237,362.89999390,781.59997559,5.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,363.39941406,781.00000000,5.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,362.69921875,780.89941406,5.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,265.60000610,866.59997559,19.70000076,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,283.29998779,855.29998779,18.50000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(978,273.00000000,833.89941406,17.60000038,0.00000000,353.99597168,92.97729492); //object(sub_roadright) (7)
CreateObject(978,264.20001221,799.59997559,12.10000038,0.00000000,350.00000000,54.97424316); //object(sub_roadright) (7)
CreateObject(978,271.09960938,815.89941406,15.00000000,0.00000000,350.99670410,74.97070312); //object(sub_roadright) (7)
CreateObject(978,268.29980469,807.29980469,13.50000000,0.00000000,350.99670410,68.97216797); //object(sub_roadright) (7)
CreateObject(978,247.30000305,778.50000000,7.09999990,0.00000000,351.00000000,48.97058105); //object(sub_roadright) (7)
CreateObject(978,258.89941406,792.50000000,10.39999962,0.00000000,348.99719238,50.96557617); //object(sub_roadright) (7)
CreateObject(978,253.19921875,785.50000000,8.69999981,0.00000000,348.99719238,50.96557617); //object(sub_roadright) (7)
CreateObject(978,235.19999695,764.59997559,6.00000000,0.00000000,0.00000000,48.96606445); //object(sub_roadright) (7)
CreateObject(978,241.19921875,771.50000000,6.19999981,0.00000000,356.99523926,48.96057129); //object(sub_roadright) (7)
CreateObject(979,267.19921875,827.79980469,16.79999924,0.00000000,6.99829102,268.23120117); //object(sub_roadleft) (18)
CreateObject(979,247.00000000,788.40002441,8.39999962,0.00000000,10.00000000,228.23413086); //object(sub_roadleft) (18)
CreateObject(979,262.69921875,810.29980469,13.60000038,0.00000000,11.79931641,244.23156738); //object(sub_roadleft) (18)
CreateObject(979,258.09960938,802.50000000,11.69999981,0.00000000,11.79931641,234.23400879); //object(sub_roadleft) (18)
CreateObject(979,252.60000610,795.09997559,10.00000000,0.00000000,9.99755859,232.23400879); //object(sub_roadleft) (18)
CreateObject(979,241.10000610,781.70001221,7.00000000,0.00000000,9.00000000,228.23046875); //object(sub_roadleft) (18)
CreateObject(1237,248.39999390,905.90002441,23.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,247.69999695,905.59997559,23.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,247.80000305,906.29998779,23.10000038,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,260.00000000,910.70001221,23.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,259.39999390,910.29998779,22.89999962,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,259.60000610,911.00000000,23.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(979,222.80000305,760.90002441,6.09999990,0.00000000,358.00000000,228.22996521); //object(sub_roadleft) (18)
CreateObject(979,235.09960938,774.89941406,6.00000000,0.00000000,3.99902344,228.22448730); //object(sub_roadleft) (18)
CreateObject(979,228.89941406,767.79980469,5.80000019,0.00000000,358.99475098,228.22448730); //object(sub_roadleft) (18)
CreateObject(979,215.69999695,755.29998779,6.19999981,0.00000000,1.00000000,208.22448730); //object(sub_roadleft) (18)
CreateObject(979,207.50000000,751.69921875,6.13999987,0.00000000,0.00000000,198.21533203); //object(sub_roadleft) (18)
CreateObject(1237,265.60000610,867.29998779,19.70000076,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,231.19921875,759.69921875,5.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,231.60000610,760.59997559,5.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,231.89941406,760.00000000,5.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(973,342.09960938,730.29980469,9.50000000,0.00000000,357.99499512,115.98815918); //object(sub_roadbarrier) (1)
CreateObject(973,301.39999390,816.09997559,15.60000038,0.00000000,356.00000000,113.99462891); //object(sub_roadbarrier) (1)
CreateObject(973,297.70001221,824.50000000,16.29999924,0.00000000,355.00000000,113.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,293.89999390,832.90002441,17.12999916,0.00000000,355.00000000,113.98867798); //object(sub_roadbarrier) (1)
CreateObject(973,286.39999390,849.79998779,18.50000000,0.00000000,355.99548340,113.99963379); //object(sub_roadbarrier) (1)
CreateObject(973,271.59960938,852.69921875,19.29999924,0.00000000,3.99902344,293.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,282.70001221,827.79998779,17.50000000,0.00000000,4.00000000,293.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,279.09960938,836.00000000,18.10000038,0.00000000,3.38928223,293.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,293.59960938,803.39941406,15.19999981,0.00000000,4.98779297,293.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,289.89941406,811.69921875,16.00000000,0.00000000,4.99877930,293.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,-46.59960938,622.59960938,11.80000019,0.00000000,355.99548340,205.99365234); //object(sub_roadbarrier) (1)
CreateObject(973,-30.10000038,630.50000000,10.30000019,0.00000000,354.99572754,203.99366760); //object(sub_roadbarrier) (1)
CreateObject(973,-21.89999962,634.29998779,9.60000038,0.00000000,356.00000000,205.98864746); //object(sub_roadbarrier) (1)
CreateObject(973,-13.69999981,638.29998779,9.10000038,0.00000000,358.00000000,205.98815918); //object(sub_roadbarrier) (1)
CreateObject(973,-6.00000000,642.20001221,8.69999981,0.00000000,357.00000000,207.98266602); //object(sub_roadbarrier) (1)
CreateObject(1237,-1.20000005,644.50000000,7.40000010,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(978,267.09960938,861.79980469,20.10000038,0.00000000,356.99523926,104.99633789); //object(sub_roadright) (3)
CreateObject(978,-6.69921875,643.00000000,8.60000038,0.00000000,2.99926758,16.99584961); //object(sub_roadright) (3)
CreateObject(979,14.79980469,655.59960938,7.19999981,0.00000000,356.00000000,190.23925781); //object(sub_roadleft) (13)
CreateObject(979,31.00000000,663.19921875,6.50000000,0.00000000,357.98950195,208.23486328); //object(sub_roadleft) (13)
CreateObject(979,6.00000000,653.79998779,7.80000019,0.00000000,357.00000000,192.23925781); //object(sub_roadleft) (13)
CreateObject(979,-3.00000000,651.79998779,8.30000019,0.00000000,356.99523926,192.23876953); //object(sub_roadleft) (13)
CreateObject(979,-11.39999962,649.59997559,8.80000019,0.00000000,356.99523926,196.23876953); //object(sub_roadleft) (13)
CreateObject(979,-19.69921875,647.00000000,9.30000019,0.00000000,356.99523926,198.23730469); //object(sub_roadleft) (13)
CreateObject(1237,35.50000000,665.29998779,5.50000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,35.89941406,665.89941406,5.50000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,35.19921875,666.00000000,5.50000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(973,-188.69921875,586.00000000,15.60000038,0.00000000,0.19775391,185.98754883); //object(sub_roadbarrier) (1)
CreateObject(973,4.90000010,612.09997559,8.89999962,0.00000000,2.00000000,29.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,-79.40000153,576.70001221,14.30000019,0.00000000,3.00000000,17.99169922); //object(sub_roadbarrier) (1)
CreateObject(973,-3.19921875,607.79980469,9.39999962,0.00000000,3.49914551,25.98815918); //object(sub_roadbarrier) (1)
CreateObject(973,-11.39941406,603.79980469,10.00000000,0.00000000,3.49914551,25.98815918); //object(sub_roadbarrier) (1)
CreateObject(973,-19.79980469,599.89941406,10.60000038,0.00000000,3.49914551,23.98864746); //object(sub_roadbarrier) (1)
CreateObject(973,-27.89941406,596.29980469,11.19999981,0.00000000,3.49914551,23.98864746); //object(sub_roadbarrier) (1)
CreateObject(973,-36.39941406,592.69921875,11.80000019,0.00000000,3.49914551,21.98913574); //object(sub_roadbarrier) (1)
CreateObject(973,-141.60000610,561.20001221,15.81999969,0.00000000,0.00000000,9.98510742); //object(sub_roadbarrier) (1)
CreateObject(973,-53.50000000,586.00000000,13.00000000,0.00000000,3.10000610,19.98962402); //object(sub_roadbarrier) (1)
CreateObject(973,-62.00000000,582.89941406,13.50000000,0.00000000,2.79602051,19.98962402); //object(sub_roadbarrier) (1)
CreateObject(973,-70.79980469,579.69921875,13.89999962,0.00000000,2.39501953,19.98962402); //object(sub_roadbarrier) (1)
CreateObject(973,-44.89941406,589.29980469,12.39999962,0.00000000,3.79998779,21.98913574); //object(sub_roadbarrier) (1)
CreateObject(973,-88.19921875,574.00000000,14.69999981,0.00000000,1.99951172,15.98510742); //object(sub_roadbarrier) (1)
CreateObject(973,-97.00000000,571.50000000,15.00000000,0.00000000,1.89514160,15.98510742); //object(sub_roadbarrier) (1)
CreateObject(973,-105.79980469,569.00000000,15.30000019,0.00000000,1.89514160,15.98510742); //object(sub_roadbarrier) (1)
CreateObject(973,-114.69921875,566.59960938,15.60000038,0.00000000,1.88964844,13.98010254); //object(sub_roadbarrier) (1)
CreateObject(973,-123.79980469,564.50000000,15.80000019,0.00000000,0.50000000,11.98059082); //object(sub_roadbarrier) (1)
CreateObject(973,-132.60000610,562.79998779,15.81999969,0.00000000,0.00000000,9.98059082); //object(sub_roadbarrier) (1)
CreateObject(973,-278.20001221,544.90002441,16.00000000,0.00000000,0.00000000,1.98059082); //object(sub_roadbarrier) (1)
CreateObject(973,-150.69921875,559.59960938,15.89999962,0.00000000,0.99975586,9.98059082); //object(sub_roadbarrier) (1)
CreateObject(973,-159.60000610,558.00000000,15.97999954,0.00000000,0.00000000,9.97558594); //object(sub_roadbarrier) (1)
CreateObject(979,23.09960938,658.79980469,6.80000019,0.00000000,357.98950195,210.23437500); //object(sub_roadleft) (13)
CreateObject(973,-476.50000000,569.70001221,17.39999962,0.00000000,359.50000000,339.50000000); //object(sub_roadbarrier) (1)
CreateObject(973,-177.69921875,555.29980469,16.00000000,0.00000000,0.00000000,7.97607422); //object(sub_roadbarrier) (1)
CreateObject(973,-186.89941406,554.00000000,16.00000000,0.00000000,0.00000000,7.97607422); //object(sub_roadbarrier) (1)
CreateObject(973,-196.09960938,552.69921875,16.00000000,0.00000000,0.00000000,7.97607422); //object(sub_roadbarrier) (1)
CreateObject(973,-205.29980469,551.39941406,16.00000000,0.00000000,0.00000000,7.97607422); //object(sub_roadbarrier) (1)
CreateObject(973,-214.50000000,550.09960938,16.00000000,0.00000000,0.00000000,7.97607422); //object(sub_roadbarrier) (1)
CreateObject(973,-223.50000000,549.00000000,16.00000000,0.00000000,0.00000000,5.97656250); //object(sub_roadbarrier) (1)
CreateObject(973,-232.69921875,548.00000000,16.00000000,0.00000000,0.00000000,5.97656250); //object(sub_roadbarrier) (1)
CreateObject(973,-241.79980469,547.19921875,16.00000000,0.00000000,0.00000000,3.97705078); //object(sub_roadbarrier) (1)
CreateObject(973,-250.79980469,546.59960938,16.00000000,0.00000000,0.00000000,3.97705078); //object(sub_roadbarrier) (1)
CreateObject(973,-259.89941406,546.00000000,16.00000000,0.00000000,0.00000000,3.97705078); //object(sub_roadbarrier) (1)
CreateObject(973,-269.00000000,545.39941406,16.04999924,0.00000000,0.00000000,3.97705078); //object(sub_roadbarrier) (1)
CreateObject(973,-233.69921875,581.19921875,15.50000000,0.00000000,359.00000000,185.98754883); //object(sub_roadbarrier) (1)
CreateObject(973,-242.69921875,580.29980469,15.60000038,0.00000000,359.50000000,185.98205566); //object(sub_roadbarrier) (1)
CreateObject(973,-251.59960938,579.39941406,15.69999981,0.00000000,359.29998779,185.98205566); //object(sub_roadbarrier) (1)
CreateObject(973,-260.50000000,578.59960938,15.80000019,0.00000000,359.20001221,183.98254395); //object(sub_roadbarrier) (1)
CreateObject(973,-269.39941406,578.00000000,15.86999989,0.00000000,359.50000000,183.98254395); //object(sub_roadbarrier) (1)
CreateObject(973,-278.50000000,577.40002441,15.89999962,0.00000000,0.00000000,183.98254395); //object(sub_roadbarrier) (1)
CreateObject(973,-287.59960938,577.00000000,15.89999962,0.00000000,0.00000000,181.98303223); //object(sub_roadbarrier) (1)
CreateObject(973,-306.10000610,576.40002441,15.89999962,0.00000000,0.00000000,181.98303223); //object(sub_roadbarrier) (1)
CreateObject(973,-315.20001221,576.09997559,15.89999962,0.00000000,0.00000000,181.98303223); //object(sub_roadbarrier) (1)
CreateObject(973,-324.50000000,575.79998779,15.89999962,0.00000000,0.00000000,181.98303223); //object(sub_roadbarrier) (1)
CreateObject(973,-333.50000000,575.70001221,15.89999962,0.00000000,0.00000000,179.98303223); //object(sub_roadbarrier) (1)
CreateObject(973,-342.79998779,576.00000000,15.89999962,0.00000000,0.00000000,175.97802734); //object(sub_roadbarrier) (1)
CreateObject(978,-333.79998779,576.90002441,15.94999981,0.00000000,0.00000000,2.99584961); //object(sub_roadright) (3)
CreateObject(1237,-348.10000610,576.20001221,15.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,-348.10000610,576.79998779,15.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(979,-393.19921875,583.19921875,16.54999924,0.00000000,357.99499512,176.23168945); //object(sub_roadleft) (13)
CreateObject(979,-384.10000610,582.59997559,16.19000053,0.00000000,357.99499512,176.23168945); //object(sub_roadleft) (13)
CreateObject(979,-357.10000610,582.09997559,16.00000000,0.00000000,0.00000000,180.23170471); //object(sub_roadleft) (13)
CreateObject(979,-375.19921875,582.19921875,16.00000000,0.00000000,359.49462891,178.22570801); //object(sub_roadleft) (13)
CreateObject(979,-366.19921875,582.09960938,16.00000000,0.00000000,0.49987793,180.23071289); //object(sub_roadleft) (13)
CreateObject(979,-348.00000000,582.59997559,16.00000000,0.00000000,0.00000000,186.23071289); //object(sub_roadleft) (13)
CreateObject(978,-343.00000000,576.50000000,15.89999962,0.00000000,0.00000000,0.98876953); //object(sub_roadright) (3)
CreateObject(979,-338.79998779,583.59997559,15.98999977,0.00000000,0.00000000,186.22924805); //object(sub_roadleft) (13)
CreateObject(979,-329.70001221,584.59997559,15.89999962,0.00000000,359.00000000,186.22924805); //object(sub_roadleft) (13)
CreateObject(978,-315.79998779,578.40002441,15.69999981,0.00000000,1.00000000,6.99377441); //object(sub_roadright) (3)
CreateObject(979,-320.79980469,585.59960938,15.77000046,0.00000000,359.70001221,186.22375488); //object(sub_roadleft) (13)
CreateObject(978,-324.59960938,577.50000000,15.85999966,0.00000000,0.99975586,4.99328613); //object(sub_roadright) (3)
CreateObject(979,-311.50000000,586.59997559,15.69999981,0.00000000,358.99475098,186.22375488); //object(sub_roadleft) (13)
CreateObject(978,-306.89999390,579.50000000,15.53999996,0.00000000,0.99975586,6.99279785); //object(sub_roadright) (3)
CreateObject(978,-270.79998779,587.29998779,14.30000019,0.00000000,5.00000000,12.99279785); //object(sub_roadright) (3)
CreateObject(978,-297.89941406,581.09960938,15.39999962,0.00000000,0.99426270,12.99133301); //object(sub_roadright) (3)
CreateObject(979,-302.39941406,587.89941406,15.53999996,0.00000000,358.99475098,190.22277832); //object(sub_roadleft) (13)
CreateObject(979,-293.29980469,589.59960938,15.30000019,0.00000000,357.99499512,190.22277832); //object(sub_roadleft) (13)
CreateObject(978,-289.00000000,583.09960938,15.19999981,0.00000000,0.99426270,12.99133301); //object(sub_roadright) (3)
CreateObject(979,-284.19921875,591.19921875,15.00000000,0.00000000,357.99499512,190.22277832); //object(sub_roadleft) (13)
CreateObject(978,-279.89941406,585.19921875,14.89999962,0.00000000,2.79998779,12.99133301); //object(sub_roadright) (3)
CreateObject(979,-239.80000305,601.00000000,10.52999973,0.00000000,352.00000000,192.22229004); //object(sub_roadleft) (13)
CreateObject(979,-275.29980469,593.00000000,14.60000038,0.00000000,356.99523926,192.22229004); //object(sub_roadleft) (13)
CreateObject(978,-226.00000000,596.20001221,8.89999962,0.00000000,8.29998779,10.99133301); //object(sub_roadright) (3)
CreateObject(978,-261.79980469,589.39941406,13.50000000,0.00000000,4.99877930,12.99133301); //object(sub_roadright) (3)
CreateObject(979,-266.50000000,594.89941406,14.00000000,0.00000000,354.99572754,192.22229004); //object(sub_roadleft) (13)
CreateObject(979,-257.59960938,597.00000000,13.00000000,0.00000000,352.99621582,194.22180176); //object(sub_roadleft) (13)
CreateObject(978,-252.79980469,591.29980469,12.60000038,0.00000000,5.99853516,10.98632812); //object(sub_roadright) (3)
CreateObject(979,-248.59960938,599.09960938,11.80000019,0.00000000,351.99645996,192.22229004); //object(sub_roadleft) (13)
CreateObject(978,-244.09960938,593.00000000,11.50000000,0.00000000,7.99804688,10.98632812); //object(sub_roadright) (3)
CreateObject(979,-212.69999695,605.59997559,6.59999990,0.00000000,351.99645996,188.22235107); //object(sub_roadleft) (13)
CreateObject(978,-235.00000000,594.59960938,10.19999981,0.00000000,7.99804688,8.98681641); //object(sub_roadright) (3)
CreateObject(979,-230.89941406,602.79980469,9.25000000,0.00000000,351.99096680,190.21728516); //object(sub_roadleft) (13)
CreateObject(978,-172.10000610,604.79998779,2.72000003,0.00000000,4.00000000,8.98632812); //object(sub_roadright) (3)
CreateObject(979,-221.79980469,604.29980469,7.90000010,0.00000000,351.99096680,188.21777344); //object(sub_roadleft) (13)
CreateObject(978,-217.00000000,597.79980469,7.50000000,0.00000000,8.99780273,8.98132324); //object(sub_roadright) (3)
CreateObject(973,-411.50000000,585.89941406,17.00000000,0.00000000,358.99475098,169.97497559); //object(sub_roadbarrier) (1)
CreateObject(973,-420.60000610,587.50000000,17.18000031,0.00000000,358.99475098,169.97497559); //object(sub_roadbarrier) (1)
CreateObject(973,-429.59960938,589.39941406,17.17000008,0.00000000,0.89999390,165.96496582); //object(sub_roadbarrier) (1)
CreateObject(973,-438.70001221,591.70001221,17.10000038,0.00000000,0.00000000,165.96496582); //object(sub_roadbarrier) (1)
CreateObject(973,-456.89941406,596.09960938,16.89999962,0.00000000,0.00000000,167.96447754); //object(sub_roadbarrier) (1)
CreateObject(973,-447.79980469,594.00000000,17.00000000,0.00000000,0.99975586,165.96496582); //object(sub_roadbarrier) (1)
CreateObject(973,-465.79980469,598.29980469,17.13999939,0.00000000,356.99523926,163.95996094); //object(sub_roadbarrier) (1)
CreateObject(978,-208.09960938,599.19921875,6.09999990,0.00000000,8.59680176,8.98132324); //object(sub_roadright) (3)
CreateObject(979,-176.50000000,610.79998779,2.70000005,0.00000000,356.29998779,188.21777344); //object(sub_roadleft) (13)
CreateObject(979,-203.69921875,606.89941406,5.30000019,0.00000000,351.99096680,188.21777344); //object(sub_roadleft) (13)
CreateObject(978,-199.09960938,600.59960938,4.86999989,0.00000000,6.99829102,8.98132324); //object(sub_roadright) (3)
CreateObject(1237,-348.69921875,576.50000000,15.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(978,-33.50000000,635.90002441,9.19999981,0.00000000,357.00000000,12.99084473); //object(sub_roadright) (3)
CreateObject(979,-28.60000038,644.40002441,9.44999981,0.00000000,1.00000000,194.23731995); //object(sub_roadleft) (13)
CreateObject(978,-24.50000000,638.09960938,9.39999962,0.00000000,0.99975586,14.98535156); //object(sub_roadright) (3)
CreateObject(979,-37.40000153,642.20001221,9.10000038,0.00000000,3.00000000,194.23278809); //object(sub_roadleft) (13)
CreateObject(978,-77.00000000,623.29998779,4.30000019,0.00000000,355.00000000,16.98583984); //object(sub_roadright) (3)
CreateObject(979,-46.40000153,639.90002441,8.43999958,0.00000000,5.50000000,194.22729492); //object(sub_roadleft) (13)
CreateObject(978,-42.39941406,633.69921875,8.64999962,0.00000000,356.00000000,14.98535156); //object(sub_roadright) (3)
CreateObject(979,-55.29999924,637.50000000,7.40000010,0.00000000,7.00000000,196.22180176); //object(sub_roadleft) (13)
CreateObject(979,-64.00000000,635.00000000,6.23999977,0.00000000,7.39999390,196.22082520); //object(sub_roadleft) (13)
CreateObject(978,-51.19921875,631.19921875,7.75000000,0.00000000,352.99621582,16.98486328); //object(sub_roadright) (3)
CreateObject(978,-59.69921875,628.59960938,6.59999990,0.00000000,351.99645996,16.98486328); //object(sub_roadright) (3)
CreateObject(978,-68.19921875,626.00000000,5.34999990,0.00000000,351.99645996,16.98486328); //object(sub_roadright) (3)
CreateObject(978,-85.69921875,620.79980469,3.59999990,0.00000000,356.49536133,14.97985840); //object(sub_roadright) (3)
CreateObject(978,-94.59960938,618.59960938,3.00000000,0.00000000,356.19873047,12.98034668); //object(sub_roadright) (3)
CreateObject(978,-103.50000000,616.69921875,2.59999990,0.00000000,358.99475098,10.98083496); //object(sub_roadright) (3)
CreateObject(978,-112.69921875,614.89941406,2.40000010,0.00000000,358.00000000,10.98083496); //object(sub_roadright) (3)
CreateObject(979,-81.50000000,629.90002441,4.09999990,0.00000000,4.39999390,196.21582031); //object(sub_roadleft) (13)
CreateObject(979,-72.89941406,632.39941406,5.03999996,0.00000000,7.39929199,196.21582031); //object(sub_roadleft) (13)
CreateObject(979,-99.00000000,625.29998779,2.79999995,0.00000000,2.98999023,194.21582031); //object(sub_roadleft) (13)
CreateObject(979,-90.29980469,627.50000000,3.40000010,0.00000000,4.19677734,194.21081543); //object(sub_roadleft) (13)
CreateObject(979,-125.50000000,619.40002441,1.00000000,0.00000000,17.00000000,192.21081543); //object(sub_roadleft) (13)
CreateObject(979,-107.89941406,623.19921875,2.50000000,0.00000000,0.99975586,192.20581055); //object(sub_roadleft) (13)
CreateObject(979,-194.59960938,608.19921875,4.23000002,0.00000000,354.99572754,188.21777344); //object(sub_roadleft) (13)
CreateObject(978,-190.09960938,602.00000000,4.00000000,0.00000000,3.99902344,8.98132324); //object(sub_roadright) (3)
CreateObject(978,-181.09960938,603.39941406,3.35999990,0.00000000,3.99902344,8.98132324); //object(sub_roadright) (3)
CreateObject(978,-156.19999695,607.50000000,1.00000000,0.00000000,14.00000000,10.98132324); //object(sub_roadright) (3)
CreateObject(979,-185.50000000,609.50000000,3.40000010,0.00000000,354.79797363,188.21777344); //object(sub_roadleft) (13)
CreateObject(979,-158.50000000,613.89941406,1.10000002,0.00000000,349.00000000,190.21728516); //object(sub_roadleft) (13)
CreateObject(973,330.60000610,724.40002441,9.39999962,0.00000000,2.00000000,295.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,343.60000610,700.20001221,8.31999969,0.00000000,0.00000000,301.99365234); //object(sub_roadbarrier) (1)
CreateObject(973,334.69921875,716.00000000,9.05000019,0.00000000,1.99951172,295.99365234); //object(sub_roadbarrier) (1)
CreateObject(973,338.89941406,708.00000000,8.60000038,0.00000000,3.49914551,299.99267578); //object(sub_roadbarrier) (1)
CreateObject(973,305.19921875,807.59960938,14.94999981,0.00000000,355.98999023,113.98864746); //object(sub_roadbarrier) (1)
CreateObject(979,-116.69921875,621.29980469,2.33999991,0.00000000,0.99975586,192.20581055); //object(sub_roadleft) (13)
CreateObject(978,-121.09999847,613.09997559,1.29999995,0.00000000,348.00000000,12.98083496); //object(sub_roadright) (3)
CreateObject(973,346.29998779,722.00000000,9.10000038,0.00000000,357.00000000,117.98815918); //object(sub_roadbarrier) (1)
CreateObject(973,350.70001221,714.00000000,8.80000019,0.00000000,359.00000000,119.98764038); //object(sub_roadbarrier) (1)
CreateObject(973,355.50000000,706.00000000,8.64000034,0.00000000,359.00000000,121.98715210); //object(sub_roadbarrier) (1)
CreateObject(973,360.39999390,698.40002441,8.80000019,0.00000000,3.00000000,123.98669434); //object(sub_roadbarrier) (1)
CreateObject(973,365.70001221,690.90002441,9.50000000,0.00000000,5.79998779,125.98620605); //object(sub_roadbarrier) (1)
CreateObject(973,371.29998779,683.70001221,10.44999981,0.00000000,5.79528809,129.98565674); //object(sub_roadbarrier) (1)
CreateObject(978,-165.19999695,605.90002441,2.33999991,0.00000000,2.39999390,8.97583008); //object(sub_roadright) (3)
CreateObject(979,-167.39941406,612.29980469,2.15000010,0.00000000,357.50000000,190.21728516); //object(sub_roadleft) (13)
CreateObject(973,382.89999390,669.79998779,12.30000019,0.00000000,5.78979492,129.98474121); //object(sub_roadbarrier) (1)
CreateObject(973,377.09960938,676.69921875,11.39999962,0.00000000,5.78979492,129.98474121); //object(sub_roadbarrier) (1)
CreateObject(979,413.00000000,635.29998779,17.75000000,0.00000000,3.99902344,128.45214844); //object(sub_roadleft) (5)
CreateObject(979,407.70001221,642.59997559,16.89999962,0.00000000,7.00000000,122.45214844); //object(sub_roadleft) (5)
CreateObject(979,402.79998779,650.29998779,15.85000038,0.00000000,6.00000000,122.44812012); //object(sub_roadleft) (5)
CreateObject(979,398.10000610,658.00000000,14.80000019,0.00000000,7.00000000,120.44812012); //object(sub_roadleft) (5)
CreateObject(973,418.79998779,628.00000000,18.39999962,0.00000000,4.00000000,127.98815918); //object(sub_roadbarrier) (1)
CreateObject(973,430.10000610,613.50000000,18.89999962,0.00000000,0.00000000,127.98535156); //object(sub_roadbarrier) (1)
CreateObject(979,388.39999390,683.59997559,11.19999981,0.00000000,8.50000000,94.44311523); //object(sub_roadleft) (5)
CreateObject(979,393.50000000,666.09960938,13.60999966,0.00000000,6.99829102,118.43811035); //object(sub_roadleft) (5)
CreateObject(979,390.00000000,674.59960938,12.48999977,0.00000000,6.99829102,106.44104004); //object(sub_roadleft) (5)
CreateObject(979,388.60000610,692.70001221,9.80000019,0.00000000,8.70001221,82.43847656); //object(sub_roadleft) (5)
CreateObject(973,424.50000000,620.69921875,18.79999924,0.00000000,1.00000000,127.98529053); //object(sub_roadbarrier) (1)
CreateObject(979,390.70001221,701.50000000,8.63000011,0.00000000,6.00000000,70.43591309); //object(sub_roadleft) (5)
CreateObject(979,401.70001221,715.50000000,7.50000000,0.00000000,2.00000000,32.43334961); //object(sub_roadleft) (5)
CreateObject(979,395.00000000,709.39941406,7.90000010,0.00000000,2.99926758,52.43225098); //object(sub_roadleft) (5)
CreateObject(973,-402.39999390,584.29998779,16.79999924,0.00000000,358.99475098,169.97497559); //object(sub_roadbarrier) (1)
CreateObject(979,419.00000000,721.40002441,7.30000019,0.00000000,0.00000000,6.43164062); //object(sub_roadleft) (5)
CreateObject(979,410.00000000,719.39941406,7.32000017,0.00000000,0.00000000,18.42956543); //object(sub_roadleft) (5)
CreateObject(979,455.10000610,715.09997559,7.30000019,0.00000000,0.00000000,340.42700195); //object(sub_roadleft) (5)
CreateObject(979,428.19921875,721.59960938,7.30000019,0.00000000,0.00000000,356.42395020); //object(sub_roadleft) (5)
CreateObject(979,437.29980469,720.39941406,7.30000019,0.00000000,0.00000000,348.42590332); //object(sub_roadleft) (5)
CreateObject(979,446.19921875,718.09960938,7.30000019,0.00000000,0.00000000,342.42187500); //object(sub_roadleft) (5)
CreateObject(979,480.20001221,704.40002441,4.09999990,0.00000000,18.00000000,334.42236328); //object(sub_roadleft) (5)
CreateObject(979,463.69921875,711.69921875,6.90000010,0.00000000,4.99877930,336.41784668); //object(sub_roadleft) (5)
CreateObject(979,472.00000000,708.09960938,6.00000000,0.00000000,5.99853516,336.41784668); //object(sub_roadleft) (5)
CreateObject(978,286.09960938,851.39941406,18.75000000,0.00000000,5.99853516,300.97595215); //object(sub_roadright) (7)
CreateObject(978,388.50000000,714.09997559,6.90000010,0.00000000,358.00000000,230.97239685); //object(sub_roadright) (7)
CreateObject(978,380.89941406,679.29980469,11.27999973,0.00000000,352.00000000,280.96984863); //object(sub_roadright) (7)
CreateObject(978,380.29980469,688.19921875,9.89999962,0.00000000,350.99670410,266.96777344); //object(sub_roadright) (7)
CreateObject(978,381.39941406,697.29980469,8.50000000,0.00000000,351.99645996,258.96972656); //object(sub_roadright) (7)
CreateObject(1237,385.79998779,665.70001221,12.19999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,386.39999390,666.00000000,12.30000019,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,386.29998779,665.29998779,12.30000019,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(978,383.89941406,706.09960938,7.50000000,0.00000000,354.99572754,248.97216797); //object(sub_roadright) (7)
CreateObject(978,395.00000000,720.40002441,6.69999981,0.00000000,359.50000000,216.97105408); //object(sub_roadright) (7)
CreateObject(978,403.00000000,725.00000000,6.59999990,0.00000000,359.49462891,202.96899414); //object(sub_roadright) (7)
CreateObject(978,420.50000000,729.29998779,6.59999990,0.00000000,359.70007324,182.96691895); //object(sub_roadright) (7)
CreateObject(978,411.50000000,727.89941406,6.59999990,0.00000000,0.39550781,194.96337891); //object(sub_roadright) (7)
CreateObject(978,429.70001221,729.00000000,6.59000015,0.00000000,0.00000000,172.96630859); //object(sub_roadright) (7)
CreateObject(978,438.60000610,727.40002441,6.50000000,0.00000000,359.00000000,166.96325684); //object(sub_roadright) (7)
CreateObject(973,268.09960938,860.69921875,20.00000000,0.00000000,4.99877930,293.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,-116.69921875,598.50000000,15.36999989,0.00000000,358.99475098,193.99108887); //object(sub_roadbarrier) (1)
CreateObject(973,413.00000000,614.20001221,18.55999947,0.00000000,357.00000000,307.99011230); //object(sub_roadbarrier) (1)
CreateObject(1237,443.50000000,726.40002441,5.69999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,444.10000610,725.90002441,5.69999981,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(979,130.60000610,677.29998779,4.50000000,0.00000000,342.00000000,26.47106934); //object(sub_roadleft) (5)
CreateObject(979,180.50000000,700.00000000,6.05000019,0.00000000,0.00000000,22.46606445); //object(sub_roadleft) (5)
CreateObject(979,146.79980469,685.19921875,6.03999996,0.00000000,0.00000000,24.46105957); //object(sub_roadleft) (5)
CreateObject(979,155.29980469,688.89941406,6.03000021,0.00000000,0.00000000,22.46154785); //object(sub_roadleft) (5)
CreateObject(979,163.79980469,692.59960938,6.03999996,0.00000000,0.00000000,24.46105957); //object(sub_roadleft) (5)
CreateObject(979,172.19921875,696.39941406,6.05999994,0.00000000,0.00000000,24.46105957); //object(sub_roadleft) (5)
CreateObject(979,206.60000610,709.90002441,5.98999977,0.00000000,0.00000000,20.46154785); //object(sub_roadleft) (5)
CreateObject(979,189.19921875,703.39941406,6.00000000,0.00000000,0.49987793,20.45654297); //object(sub_roadleft) (5)
CreateObject(979,197.79980469,706.59960938,5.96999979,0.00000000,0.00000000,20.45654297); //object(sub_roadleft) (5)
CreateObject(979,215.39999390,713.00000000,6.00000000,0.00000000,359.50000000,18.45654297); //object(sub_roadleft) (5)
CreateObject(973,198.60000610,748.79998779,6.13999987,0.00000000,0.00000000,197.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,189.69999695,745.90002441,6.13000011,0.00000000,0.00000000,197.99011230); //object(sub_roadbarrier) (1)
CreateObject(973,180.89999390,742.70001221,6.11000013,0.00000000,0.00000000,201.99009705); //object(sub_roadbarrier) (1)
CreateObject(973,172.19999695,739.20001221,6.09999990,0.00000000,0.00000000,201.98913574); //object(sub_roadbarrier) (1)
CreateObject(973,163.50000000,735.70001221,6.09999990,0.00000000,0.00000000,201.98913574); //object(sub_roadbarrier) (1)
CreateObject(973,155.00000000,731.90002441,6.09999990,0.00000000,0.00000000,205.98912048); //object(sub_roadbarrier) (1)
CreateObject(973,147.00000000,728.00000000,5.09999990,0.00000000,13.00000000,205.98815918); //object(sub_roadbarrier) (1)
CreateObject(979,224.30000305,715.79998779,6.09999990,0.00000000,359.49462891,16.45153809); //object(sub_roadleft) (5)
CreateObject(979,233.19999695,718.09997559,6.30000019,0.00000000,358.00000000,12.44653320); //object(sub_roadleft) (5)
CreateObject(979,242.19999695,719.90002441,6.69999981,0.00000000,357.00000000,10.44201660); //object(sub_roadleft) (5)
CreateObject(979,269.79998779,720.70001221,8.50000000,0.00000000,356.59997559,354.43701172); //object(sub_roadleft) (5)
CreateObject(979,251.39941406,721.09960938,7.25000000,0.00000000,355.99548340,4.43298340); //object(sub_roadleft) (5)
CreateObject(979,260.59960938,721.29980469,7.90000010,0.00000000,355.99548340,358.43444824); //object(sub_roadleft) (5)
CreateObject(979,279.00000000,719.50000000,8.77000046,0.00000000,0.00000000,350.43542480); //object(sub_roadleft) (5)
CreateObject(979,345.10000610,689.09997559,8.69999981,0.00000000,358.00000000,320.43093872); //object(sub_roadleft) (5)
CreateObject(979,288.19921875,717.59960938,8.80000019,0.00000000,0.00000000,346.42639160); //object(sub_roadleft) (5)
CreateObject(979,297.29980469,715.39941406,8.80000019,0.00000000,359.69787598,346.42639160); //object(sub_roadleft) (5)
CreateObject(979,306.00000000,712.79980469,8.69999981,0.00000000,1.60000610,340.42785645); //object(sub_roadleft) (5)
CreateObject(979,314.59960938,709.39941406,8.53999996,0.00000000,0.39550781,336.42883301); //object(sub_roadleft) (5)
CreateObject(979,322.79980469,705.29980469,8.39999962,0.00000000,1.19750977,330.43029785); //object(sub_roadleft) (5)
CreateObject(979,330.59960938,700.50000000,8.36999989,0.00000000,358.99475098,326.42578125); //object(sub_roadleft) (5)
CreateObject(979,338.00000000,695.00000000,8.50000000,0.00000000,359.29687500,320.42724609); //object(sub_roadleft) (5)
CreateObject(979,371.29998779,663.59997559,12.11999989,0.00000000,353.50000000,314.42724609); //object(sub_roadleft) (5)
CreateObject(979,352.00000000,683.00000000,9.19999981,0.00000000,355.99548340,316.42272949); //object(sub_roadleft) (5)
CreateObject(979,358.59960938,676.50000000,10.05000019,0.00000000,353.49609375,314.42321777); //object(sub_roadleft) (5)
CreateObject(979,364.89941406,670.09960938,11.10000038,0.00000000,353.49609375,314.42321777); //object(sub_roadleft) (5)
CreateObject(973,423.50000000,600.20001221,16.60000038,0.00000000,30.00000000,305.98571777); //object(sub_roadbarrier) (1)
CreateObject(973,377.60000610,656.90002441,13.19999981,0.00000000,352.99621582,311.98925781); //object(sub_roadbarrier) (1)
CreateObject(973,383.79980469,650.00000000,14.32999992,0.00000000,352.99621582,311.98974609); //object(sub_roadbarrier) (1)
CreateObject(973,389.89941406,643.00000000,15.39999962,0.00000000,353.99597168,309.98474121); //object(sub_roadbarrier) (1)
CreateObject(973,395.79980469,636.00000000,16.37999916,0.00000000,353.99597168,309.98474121); //object(sub_roadbarrier) (1)
CreateObject(973,401.59960938,628.79980469,17.34000015,0.00000000,353.99597168,307.98522949); //object(sub_roadbarrier) (1)
CreateObject(973,407.29980469,621.50000000,18.06999969,0.00000000,356.99523926,307.98522949); //object(sub_roadbarrier) (1)
CreateObject(973,435.20001221,606.90002441,16.29999924,0.00000000,325.00000000,127.98532104); //object(sub_roadbarrier) (1)
CreateObject(973,418.59960938,606.79980469,18.79999924,0.00000000,0.00000000,305.98571777); //object(sub_roadbarrier) (1)
CreateObject(978,342.60000610,700.00000000,8.39999962,0.00000000,0.00000000,134.95922852); //object(sub_roadright) (7)
CreateObject(978,335.60000610,705.90002441,8.30000019,0.00000000,1.00000000,144.95605469); //object(sub_roadright) (7)
CreateObject(978,327.79998779,711.00000000,8.21000004,0.00000000,0.00000000,148.95361328); //object(sub_roadright) (7)
CreateObject(1237,346.20001221,696.29998779,7.59999990,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(978,319.70001221,715.50000000,8.26000023,0.00000000,359.39999390,152.95263672); //object(sub_roadright) (7)
CreateObject(978,311.20001221,719.09997559,8.39999962,0.00000000,359.00000000,160.95166016); //object(sub_roadright) (7)
CreateObject(978,302.29998779,721.79998779,8.60000038,0.00000000,358.50000000,164.94970703); //object(sub_roadright) (7)
CreateObject(978,293.29998779,724.20001221,8.73999977,0.00000000,0.00000000,164.94873047); //object(sub_roadright) (7)
CreateObject(978,284.29998779,726.29998779,8.76000023,0.00000000,359.50000000,168.94323730); //object(sub_roadright) (7)
CreateObject(978,275.20001221,727.90002441,8.69999981,0.00000000,1.50000000,170.94226074); //object(sub_roadright) (7)
CreateObject(978,266.10000610,729.00000000,8.30000019,0.00000000,3.29998779,174.94177246); //object(sub_roadright) (7)
CreateObject(978,257.10000610,729.29998779,7.59999990,0.00000000,5.00000000,180.94081116); //object(sub_roadright) (7)
CreateObject(978,238.69999695,727.50000000,6.32000017,0.00000000,3.00000000,190.93933105); //object(sub_roadright) (7)
CreateObject(978,247.89941406,728.79980469,6.88999987,0.00000000,3.99902344,184.93835449); //object(sub_roadright) (7)
CreateObject(978,229.89999390,725.50000000,5.90999985,0.00000000,2.00000000,194.93687439); //object(sub_roadright) (7)
CreateObject(978,221.19999695,723.00000000,5.73999977,0.00000000,0.00000000,196.93591309); //object(sub_roadright) (7)
CreateObject(978,212.50000000,720.00000000,5.76000023,0.00000000,0.00000000,200.93542480); //object(sub_roadright) (7)
CreateObject(978,203.69999695,716.79998779,5.80000019,0.00000000,0.00000000,198.93444824); //object(sub_roadright) (7)
CreateObject(978,194.89999390,713.79998779,5.80000019,0.00000000,0.00000000,198.92944336); //object(sub_roadright) (7)
CreateObject(1237,190.69999695,712.00000000,5.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,190.29980469,712.50000000,5.09999990,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,189.80000305,711.90002441,5.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(979,138.59960938,681.29980469,6.00000000,0.00000000,359.49462891,26.46606445); //object(sub_roadleft) (5)
CreateObject(979,-375.79980469,547.59960938,16.29999924,0.00000000,0.00000000,352.22717285); //object(sub_roadleft) (13)
CreateObject(979,-366.50000000,546.50000000,16.29999924,0.00000000,0.00000000,354.23168945); //object(sub_roadleft) (13)
CreateObject(979,-348.60000610,544.20001221,16.29999924,0.00000000,0.00000000,352.22717285); //object(sub_roadleft) (13)
CreateObject(979,-357.50000000,545.39941406,16.29999924,0.00000000,0.00000000,352.22717285); //object(sub_roadleft) (13)
CreateObject(979,-339.60000610,543.00000000,16.29999924,0.00000000,0.00000000,352.22717285); //object(sub_roadleft) (13)
CreateObject(979,-330.39999390,541.90002441,16.29999924,0.00000000,0.00000000,354.22717285); //object(sub_roadleft) (13)
CreateObject(979,-321.29998779,541.00000000,16.29999924,0.00000000,0.00000000,354.22668457); //object(sub_roadleft) (13)
CreateObject(979,-312.39999390,540.09997559,16.29999924,0.00000000,0.00000000,354.22668457); //object(sub_roadleft) (13)
CreateObject(979,-303.20001221,539.00000000,16.29999924,0.00000000,0.00000000,352.22668457); //object(sub_roadleft) (13)
CreateObject(979,-156.79980469,529.69921875,5.59999990,0.00000000,19.99511719,2.21923828); //object(sub_roadleft) (13)
CreateObject(979,-294.09960938,537.69921875,16.12999916,0.00000000,1.99951172,352.21618652); //object(sub_roadleft) (13)
CreateObject(979,-285.09960938,536.50000000,15.81999969,0.00000000,1.99951172,352.21618652); //object(sub_roadleft) (13)
CreateObject(979,-275.79980469,535.39941406,15.50000000,0.00000000,1.79626465,354.22119141); //object(sub_roadleft) (13)
CreateObject(979,-266.50000000,534.29980469,15.10000038,0.00000000,3.00000000,352.21618652); //object(sub_roadleft) (13)
CreateObject(979,-257.19921875,533.19921875,14.56000042,0.00000000,3.50000000,354.22119141); //object(sub_roadleft) (13)
CreateObject(979,-248.00000000,532.29980469,13.93000031,0.00000000,4.29565430,354.22119141); //object(sub_roadleft) (13)
CreateObject(979,-239.00000000,531.39941406,13.22999954,0.00000000,4.49890137,354.22119141); //object(sub_roadleft) (13)
CreateObject(979,-230.09960938,530.69921875,12.39999962,0.00000000,5.99853516,356.22070312); //object(sub_roadleft) (13)
CreateObject(979,-221.00000000,530.09960938,11.35000038,0.00000000,6.99829102,356.22070312); //object(sub_roadleft) (13)
CreateObject(979,-211.89941406,529.50000000,10.14000034,0.00000000,7.99804688,356.22070312); //object(sub_roadleft) (13)
CreateObject(979,-202.69921875,529.09960938,9.10000038,0.00000000,4.99877930,358.22021484); //object(sub_roadleft) (13)
CreateObject(979,-193.39941406,528.79980469,8.50000000,0.00000000,1.99951172,358.22021484); //object(sub_roadleft) (13)
CreateObject(979,-184.09960938,528.69921875,8.13000011,0.00000000,2.59826660,0.21972656); //object(sub_roadleft) (13)
CreateObject(979,-174.89999390,528.90002441,7.67000008,0.00000000,3.00000000,2.21875000); //object(sub_roadleft) (13)
CreateObject(979,-165.79980469,529.29980469,7.30000019,0.00000000,1.99951172,2.21923828); //object(sub_roadleft) (13)
CreateObject(978,-158.39999390,538.59997559,5.73999977,0.00000000,342.00000000,180.98876953); //object(sub_roadright) (3)
CreateObject(978,-278.19921875,544.29980469,15.89999962,0.00000000,358.99475098,174.98474121); //object(sub_roadright) (3)
CreateObject(978,-268.89941406,543.29980469,15.60000038,0.00000000,357.39624023,172.98522949); //object(sub_roadright) (3)
CreateObject(978,-259.59960938,542.29980469,15.10000038,0.00000000,356.69860840,174.98474121); //object(sub_roadright) (3)
CreateObject(978,-250.29980469,541.59960938,14.50000000,0.00000000,355.99548340,176.98425293); //object(sub_roadright) (3)
CreateObject(978,-241.00000000,541.09960938,13.77000046,0.00000000,354.99572754,176.98425293); //object(sub_roadright) (3)
CreateObject(978,-231.69921875,540.59960938,12.86999989,0.00000000,353.99597168,176.98425293); //object(sub_roadright) (3)
CreateObject(978,-222.50000000,540.09960938,11.82999992,0.00000000,352.99621582,176.98425293); //object(sub_roadright) (3)
CreateObject(978,-213.39941406,539.59960938,10.52999973,0.00000000,350.99670410,176.98425293); //object(sub_roadright) (3)
CreateObject(978,-204.19921875,539.09960938,9.39999962,0.00000000,354.99572754,176.98425293); //object(sub_roadright) (3)
CreateObject(978,-194.89941406,538.59960938,8.80000019,0.00000000,357.59948730,176.98425293); //object(sub_roadright) (3)
CreateObject(978,-185.69921875,538.29980469,8.39999962,0.00000000,357.59948730,178.98376465); //object(sub_roadright) (3)
CreateObject(978,-176.50000000,538.29980469,7.84999990,0.00000000,355.49560547,180.98876953); //object(sub_roadright) (3)
CreateObject(978,-1.79999995,605.59997559,9.30000019,0.00000000,357.00000000,220.98876953); //object(sub_roadright) (3)
CreateObject(978,-167.29980469,538.50000000,7.30000019,0.00000000,357.99499512,180.98876953); //object(sub_roadright) (3)
CreateObject(978,5.29980469,611.50000000,8.89999962,0.00000000,357.98950195,218.98498535); //object(sub_roadright) (3)
CreateObject(978,-8.60000038,599.50000000,9.77999973,0.00000000,357.00000000,222.98449707); //object(sub_roadright) (3)
CreateObject(978,-100.59999847,542.79998779,5.00000000,0.00000000,20.00000000,196.97851562); //object(sub_roadright) (3)
CreateObject(978,-15.19921875,593.09960938,10.19999981,0.00000000,357.99499512,224.98352051); //object(sub_roadright) (3)
CreateObject(978,-21.79980469,586.69921875,10.30000019,0.00000000,0.59875488,222.97851562); //object(sub_roadright) (3)
CreateObject(978,-28.69921875,580.50000000,10.00000000,0.00000000,2.99926758,220.97351074); //object(sub_roadright) (3)
CreateObject(978,-35.59960938,574.29980469,9.60000038,0.00000000,1.99951172,222.97851562); //object(sub_roadright) (3)
CreateObject(978,-42.59960938,568.39941406,9.19999981,0.00000000,2.99926758,216.97448730); //object(sub_roadright) (3)
CreateObject(978,-50.00000000,563.00000000,8.69999981,0.00000000,3.09814453,214.97497559); //object(sub_roadright) (3)
CreateObject(978,-58.00000000,558.39941406,8.19999981,0.00000000,3.09814453,204.97741699); //object(sub_roadright) (3)
CreateObject(978,-66.39941406,554.69921875,7.80000019,0.00000000,1.99951172,202.97790527); //object(sub_roadright) (3)
CreateObject(978,-75.00000000,551.39941406,7.40000010,0.00000000,3.00000000,198.97338867); //object(sub_roadright) (3)
CreateObject(978,-83.39941406,548.50000000,6.94000006,0.00000000,2.99926758,198.97338867); //object(sub_roadright) (3)
CreateObject(978,-92.09960938,545.50000000,6.61000013,0.00000000,0.99975586,198.97338867); //object(sub_roadright) (3)
CreateObject(979,-98.40000153,534.90002441,5.19999981,0.00000000,340.00000000,14.22717285); //object(sub_roadleft) (13)
CreateObject(979,36.09999847,626.09997559,7.40000010,0.00000000,3.39999390,32.22631836); //object(sub_roadleft) (13)
CreateObject(979,-89.79980469,537.39941406,6.80000019,0.00000000,0.00000000,18.22631836); //object(sub_roadleft) (13)
CreateObject(979,-81.00000000,540.29980469,6.88000011,0.00000000,358.99475098,18.22631836); //object(sub_roadleft) (13)
CreateObject(979,-72.50000000,543.09960938,7.19000006,0.00000000,356.99523926,18.22631836); //object(sub_roadleft) (13)
CreateObject(979,-63.89941406,546.09960938,7.67999983,0.00000000,356.99523926,20.22583008); //object(sub_roadleft) (13)
CreateObject(979,-55.19921875,549.50000000,8.10000038,0.00000000,357.99499512,22.22534180); //object(sub_roadleft) (13)
CreateObject(979,-47.00000000,553.69921875,8.50000000,0.00000000,356.99523926,32.22290039); //object(sub_roadleft) (13)
CreateObject(979,-39.50000000,558.79980469,9.03999996,0.00000000,355.99548340,36.22192383); //object(sub_roadleft) (13)
CreateObject(979,-32.19921875,564.39941406,9.60000038,0.00000000,357.00000000,38.22143555); //object(sub_roadleft) (13)
CreateObject(979,-25.09960938,570.39941406,10.05000019,0.00000000,357.39996338,42.22595215); //object(sub_roadleft) (13)
CreateObject(1237,9.80000019,615.09997559,7.90000010,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,9.19921875,614.59960938,7.90000010,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(979,-18.39941406,576.50000000,10.39999962,0.00000000,357.99499512,42.22595215); //object(sub_roadleft) (13)
CreateObject(979,-11.79980469,582.69921875,10.55000019,0.00000000,0.29663086,44.22546387); //object(sub_roadleft) (13)
CreateObject(979,-5.09960938,589.19921875,10.35000038,0.00000000,2.00000000,44.22546387); //object(sub_roadleft) (13)
CreateObject(979,1.59960938,595.69921875,9.89999962,0.00000000,3.39477539,44.22546387); //object(sub_roadleft) (13)
CreateObject(979,8.09960938,602.09960938,9.36999989,0.00000000,3.39477539,44.22546387); //object(sub_roadleft) (13)
CreateObject(979,14.69921875,608.50000000,8.80000019,0.00000000,3.48815918,44.22546387); //object(sub_roadleft) (13)
CreateObject(979,21.29980469,614.89941406,8.35000038,0.00000000,1.99951172,44.22546387); //object(sub_roadleft) (13)
CreateObject(979,28.39941406,620.89941406,7.94999981,0.00000000,2.99926758,36.22192383); //object(sub_roadleft) (13)
CreateObject(979,44.09999847,630.79998779,7.00000000,0.00000000,1.50000000,28.22290039); //object(sub_roadleft) (13)
CreateObject(1237,49.00000000,633.40002441,6.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,48.29980469,633.50000000,6.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,48.69921875,632.79980469,6.00000000,0.00000000,0.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(973,-474.60000610,601.00000000,17.39999962,0.00000000,0.10000610,161.96447754); //object(sub_roadbarrier) (1)
CreateObject(973,-483.50000000,603.90002441,17.34000015,0.00000000,0.60000610,161.96044922); //object(sub_roadbarrier) (1)
CreateObject(973,-492.39999390,606.79998779,17.25000000,0.00000000,0.59875488,161.96044922); //object(sub_roadbarrier) (1)
CreateObject(973,-509.79998779,613.29998779,17.05999947,0.00000000,0.59875488,156.29998779); //object(sub_roadbarrier) (1)
CreateObject(973,-501.09960938,609.79980469,17.14999962,0.00000000,0.59875488,159.95544434); //object(sub_roadbarrier) (1)
CreateObject(973,-518.29998779,617.00000000,17.04999924,0.00000000,359.70007324,156.40002441); //object(sub_roadbarrier) (1)
CreateObject(973,-526.79998779,620.70001221,17.10000038,0.00000000,359.69787598,156.39587402); //object(sub_roadbarrier) (1)
CreateObject(973,-535.29998779,624.40002441,17.12999916,0.00000000,0.00000000,156.39587402); //object(sub_roadbarrier) (1)
CreateObject(973,-543.79998779,628.09997559,17.12999916,0.00000000,0.00000000,156.39587402); //object(sub_roadbarrier) (1)
CreateObject(973,-552.20001221,631.90002441,17.12000084,0.00000000,0.00000000,155.29998779); //object(sub_roadbarrier) (1)
CreateObject(973,-560.70001221,635.79998779,17.12000084,0.00000000,0.00000000,155.29724121); //object(sub_roadbarrier) (1)
CreateObject(973,-569.20001221,639.70001221,17.12999916,0.00000000,0.00000000,155.29724121); //object(sub_roadbarrier) (1)
CreateObject(973,-577.50000000,643.50000000,17.12999916,0.00000000,0.00000000,155.59997559); //object(sub_roadbarrier) (1)
CreateObject(973,-585.90002441,647.29998779,17.12999916,0.00000000,0.00000000,155.59936523); //object(sub_roadbarrier) (1)
CreateObject(973,-594.29998779,651.09997559,17.12999916,0.00000000,0.00000000,155.59936523); //object(sub_roadbarrier) (1)
CreateObject(973,-602.70001221,654.90002441,17.12999916,0.00000000,0.00000000,155.59936523); //object(sub_roadbarrier) (1)
CreateObject(973,-611.20001221,658.70001221,17.12999916,0.00000000,0.00000000,155.90002441); //object(sub_roadbarrier) (1)
CreateObject(973,-628.20001221,666.20001221,17.12999916,0.00000000,0.00000000,156.80004883); //object(sub_roadbarrier) (1)
CreateObject(973,-619.69921875,662.50000000,17.12999916,0.00000000,0.00000000,155.89599609); //object(sub_roadbarrier) (1)
CreateObject(973,-636.79998779,669.90002441,17.12999916,0.00000000,0.00000000,156.79687500); //object(sub_roadbarrier) (1)
CreateObject(973,-645.40002441,673.59997559,17.12999916,0.00000000,0.00000000,156.79687500); //object(sub_roadbarrier) (1)
CreateObject(973,-662.29998779,681.00000000,17.12000084,0.00000000,0.20001221,156.29998779); //object(sub_roadbarrier) (1)
CreateObject(973,-653.89941406,677.29980469,17.12999916,0.00000000,0.00000000,156.29699707); //object(sub_roadbarrier) (1)
CreateObject(973,-670.70001221,684.70001221,17.09000015,0.00000000,0.20001221,156.00000000); //object(sub_roadbarrier) (1)
CreateObject(973,-679.09997559,688.40002441,17.05999947,0.00000000,0.19775391,155.99487305); //object(sub_roadbarrier) (1)
CreateObject(973,-687.50000000,692.09997559,17.03000069,0.00000000,0.19775391,155.99487305); //object(sub_roadbarrier) (1)
CreateObject(973,-695.79998779,695.79998779,17.03000069,0.00000000,0.00000000,155.70001221); //object(sub_roadbarrier) (1)
CreateObject(973,-712.79998779,703.20001221,17.42000008,0.00000000,358.50000000,156.90002441); //object(sub_roadbarrier) (1)
CreateObject(973,-704.19921875,699.50000000,17.17000008,0.00000000,358.49487305,156.29699707); //object(sub_roadbarrier) (1)
CreateObject(973,-729.79998779,710.40002441,18.04000092,0.00000000,358.00000000,156.89575195); //object(sub_roadbarrier) (1)
CreateObject(973,-721.29980469,706.79980469,17.70999908,0.00000000,357.99499512,156.89025879); //object(sub_roadbarrier) (1)
CreateObject(973,-738.20001221,714.00000000,18.35000038,0.00000000,357.99499512,156.89025879); //object(sub_roadbarrier) (1)
CreateObject(973,-168.50000000,556.59960938,16.00000000,0.00000000,0.00000000,7.97607422); //object(sub_roadbarrier) (1)
CreateObject(973,-493.89999390,576.20001221,17.25000000,0.00000000,359.50000000,339.49951172); //object(sub_roadbarrier) (1)
CreateObject(973,-485.09960938,572.89941406,17.31999969,0.00000000,359.49462891,339.49401855); //object(sub_roadbarrier) (1)
CreateObject(973,-527.79998779,590.40002441,16.95999908,0.00000000,0.00000000,333.49401855); //object(sub_roadbarrier) (1)
CreateObject(973,-502.50000000,579.39941406,17.15999985,0.00000000,359.49462891,339.49401855); //object(sub_roadbarrier) (1)
CreateObject(973,-511.09960938,582.59960938,17.06999969,0.00000000,359.49462891,339.49401855); //object(sub_roadbarrier) (1)
CreateObject(973,-519.59960938,586.29980469,16.98999977,0.00000000,359.48913574,333.48999023); //object(sub_roadbarrier) (1)
CreateObject(973,-536.00000000,594.50000000,16.95999908,0.00000000,0.00000000,333.48999023); //object(sub_roadbarrier) (1)
CreateObject(973,-544.20001221,598.59997559,16.95999908,0.00000000,0.00000000,333.48999023); //object(sub_roadbarrier) (1)
CreateObject(973,-552.40002441,602.70001221,16.95999908,0.00000000,0.00000000,333.48999023); //object(sub_roadbarrier) (1)
CreateObject(973,-560.70001221,606.70001221,16.95999908,0.00000000,0.00000000,335.00000000); //object(sub_roadbarrier) (1)
CreateObject(973,-569.00000000,610.59997559,16.95999908,0.00000000,0.00000000,335.30004883); //object(sub_roadbarrier) (1)
CreateObject(973,-577.29998779,614.40002441,16.95999908,0.00000000,0.00000000,335.29724121); //object(sub_roadbarrier) (1)
CreateObject(973,-585.59997559,618.20001221,16.95999908,0.00000000,0.00000000,335.29724121); //object(sub_roadbarrier) (1)
CreateObject(973,-593.90002441,622.00000000,16.95999908,0.00000000,0.00000000,335.29724121); //object(sub_roadbarrier) (1)
CreateObject(973,-602.20001221,625.79998779,16.95999908,0.00000000,0.00000000,335.29724121); //object(sub_roadbarrier) (1)
CreateObject(973,-610.59997559,629.59997559,16.95999908,0.00000000,0.00000000,336.30004883); //object(sub_roadbarrier) (1)
CreateObject(973,-619.00000000,633.29998779,16.95999908,0.00000000,0.00000000,336.29699707); //object(sub_roadbarrier) (1)
CreateObject(973,-627.40002441,637.00000000,16.95999908,0.00000000,0.00000000,335.90002441); //object(sub_roadbarrier) (1)
CreateObject(973,-635.79998779,640.70001221,16.95999908,0.00000000,0.00000000,336.69995117); //object(sub_roadbarrier) (1)
CreateObject(973,-644.40002441,644.40002441,16.95999908,0.00000000,0.00000000,336.69799805); //object(sub_roadbarrier) (1)
CreateObject(973,-653.00000000,648.09997559,16.95999908,0.00000000,0.00000000,336.69799805); //object(sub_roadbarrier) (1)
CreateObject(973,-661.50000000,651.79998779,16.95999908,0.00000000,0.00000000,336.40002441); //object(sub_roadbarrier) (1)
CreateObject(973,-669.79998779,655.40002441,16.95999908,0.00000000,0.00000000,336.39587402); //object(sub_roadbarrier) (1)
CreateObject(973,-678.40002441,659.20001221,16.95999908,0.00000000,0.00000000,336.00000000); //object(sub_roadbarrier) (1)
CreateObject(973,-686.90002441,663.00000000,16.95999908,0.00000000,0.00000000,335.99487305); //object(sub_roadbarrier) (1)
CreateObject(973,-695.29998779,666.70001221,16.95999908,0.00000000,0.00000000,336.30004883); //object(sub_roadbarrier) (1)
CreateObject(973,-720.59997559,677.79998779,17.47999954,0.00000000,2.29998779,336.29699707); //object(sub_roadbarrier) (1)
CreateObject(973,-703.69921875,670.39941406,16.95999908,0.00000000,0.00000000,336.29699707); //object(sub_roadbarrier) (1)
CreateObject(973,-712.19921875,674.09960938,17.12999916,0.00000000,1.99951172,336.29699707); //object(sub_roadbarrier) (1)
CreateObject(973,-729.00000000,681.50000000,17.79999924,0.00000000,1.79998779,336.00000000); //object(sub_roadbarrier) (1)
CreateObject(973,-737.50000000,685.29998779,18.10000038,0.00000000,1.79626465,335.99487305); //object(sub_roadbarrier) (1)
CreateObject(973,-745.90002441,689.00000000,18.38699913,0.00000000,1.79626465,336.30004883); //object(sub_roadbarrier) (1)
CreateObject(973,-754.29998779,692.50000000,18.27000046,0.00000000,357.00000000,338.00000000); //object(sub_roadbarrier) (1)
CreateObject(973,-763.09997559,695.50000000,18.10000038,0.00000000,1.00000000,343.99987793); //object(sub_roadbarrier) (1)
CreateObject(973,-789.09997559,704.59997559,18.60000038,0.00000000,0.00000000,335.99841309); //object(sub_roadbarrier) (1)
CreateObject(973,-772.09960938,698.09960938,18.29999924,0.00000000,1.29638672,343.99291992); //object(sub_roadbarrier) (1)
CreateObject(973,-780.59960938,701.00000000,18.50000000,0.00000000,1.29638672,337.99438477); //object(sub_roadbarrier) (1)
CreateObject(973,-805.59997559,713.20001221,18.60000038,0.00000000,0.00000000,329.99487305); //object(sub_roadbarrier) (1)
CreateObject(973,-797.50000000,708.69921875,18.60000038,0.00000000,0.00000000,331.99035645); //object(sub_roadbarrier) (1)
CreateObject(973,-813.59997559,718.00000000,18.60000038,0.00000000,0.00000000,327.99084473); //object(sub_roadbarrier) (1)
CreateObject(973,-821.29998779,723.00000000,18.69000053,0.00000000,1.00000000,325.98583984); //object(sub_roadbarrier) (1)
CreateObject(973,-836.20001221,733.79998779,19.00000000,0.00000000,0.99975586,321.98083496); //object(sub_roadbarrier) (1)
CreateObject(973,-828.89941406,728.29980469,18.85000038,0.00000000,0.99426270,323.97583008); //object(sub_roadbarrier) (1)
CreateObject(973,-850.40002441,745.70001221,19.22999954,0.00000000,0.50000000,317.97631836); //object(sub_roadbarrier) (1)
CreateObject(973,-843.39941406,739.59960938,19.12000084,0.00000000,0.98876953,319.97131348); //object(sub_roadbarrier) (1)
CreateObject(973,-856.90002441,752.20001221,19.39999962,0.00000000,2.00000000,311.97180176); //object(sub_roadbarrier) (1)
CreateObject(973,-862.79998779,759.29998779,19.73999977,0.00000000,2.00000000,307.96777344); //object(sub_roadbarrier) (1)
CreateObject(973,-868.29998779,766.90002441,20.05999947,0.00000000,1.99951172,303.96325684); //object(sub_roadbarrier) (1)
CreateObject(973,-873.20001221,774.70001221,20.29000092,0.00000000,0.50000000,299.95874023); //object(sub_roadbarrier) (1)
CreateObject(973,-877.29998779,782.70001221,20.32999992,0.00000000,0.00000000,293.95422363); //object(sub_roadbarrier) (1)
CreateObject(973,-880.79998779,791.29998779,20.29999924,0.00000000,0.00000000,289.95019531); //object(sub_roadbarrier) (1)
CreateObject(973,-892.50000000,826.59997559,19.45999908,0.00000000,358.00000000,283.94567871); //object(sub_roadbarrier) (1)
CreateObject(973,-884.00000000,800.09960938,20.25000000,0.00000000,359.59899902,289.94567871); //object(sub_roadbarrier) (1)
CreateObject(973,-887.19921875,808.89941406,20.10000038,0.00000000,358.59924316,289.94567871); //object(sub_roadbarrier) (1)
CreateObject(973,-890.09960938,817.79980469,19.79999924,0.00000000,357.79724121,285.94116211); //object(sub_roadbarrier) (1)
CreateObject(973,-894.29998779,835.79998779,19.20000076,0.00000000,358.90002441,277.94165039); //object(sub_roadbarrier) (1)
CreateObject(981,1043.90002441,-2060.39990234,13.00000000,0.00000000,0.00000000,204.00000000); //object(helix_barrier) (1)
CreateObject(981,1029.00000000,-2230.80004883,12.89999962,0.00000000,0.00000000,17.99963379); //object(helix_barrier) (2)
CreateObject(4816,989.90002441,-2219.50000000,3.50000000,6.00000000,358.00000000,304.00000000); //object(rockliff1_las) (1)
CreateObject(16116,1032.00000000,-2190.60009766,12.00000000,0.00000000,0.00000000,148.00000000); //object(des_rockgp2_04) (1)
CreateObject(16116,1040.19921875,-2110.50000000,12.00000000,0.00000000,0.00000000,33.99719238); //object(des_rockgp2_04) (2)
CreateObject(896,984.20001221,-2158.19995117,13.00000000,0.00000000,0.00000000,164.00000000); //object(searock06) (1)
CreateObject(900,1019.90002441,-2314.89990234,13.00000000,0.00000000,0.00000000,113.99996948); //object(searock04) (1)
CreateObject(901,1006.40002441,-2307.60009766,13.00000000,0.00000000,0.00000000,256.00000000); //object(searock05) (1)
CreateObject(901,1013.70001221,-2322.69995117,13.00000000,0.00000000,0.00000000,279.99792480); //object(searock05) (2)
CreateObject(906,1032.19921875,-2316.79980469,12.00000000,0.00000000,0.00000000,0.00000000); //object(p_rubblebig) (2)
CreateObject(898,986.09997559,-2171.10009766,13.00000000,0.00000000,0.00000000,258.00000000); //object(searock02) (1)
CreateObject(973,-1216.40002441,-746.90002441,61.47999954,0.00000000,351.50000000,229.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,-1222.09960938,-753.69921875,62.79999924,0.00000000,351.50000000,229.99328613); //object(sub_roadbarrier) (1)
CreateObject(973,-1210.50000000,-739.90002441,60.09999847,0.00000000,351.49658203,229.99328613); //object(sub_roadbarrier) (1)
CreateObject(973,-1205.50000000,-732.20001221,58.70000076,0.00000000,351.49658203,243.99330139); //object(sub_roadbarrier) (1)
CreateObject(973,-1201.50000000,-724.00000000,57.34000015,0.00000000,351.49108887,243.98986816); //object(sub_roadbarrier) (1)
CreateObject(973,-1193.80004883,-707.50000000,54.59999847,0.00000000,351.49108887,247.98986816); //object(sub_roadbarrier) (1)
CreateObject(973,-1197.50000000,-715.79980469,55.97000122,0.00000000,351.49108887,243.98986816); //object(sub_roadbarrier) (1)
CreateObject(973,-1190.80004883,-698.79998779,53.16999817,0.00000000,351.00000000,253.98889160); //object(sub_roadbarrier) (1)
CreateObject(973,-1188.30004883,-690.09997559,51.70000076,0.00000000,350.50000000,253.98741150); //object(sub_roadbarrier) (1)
CreateObject(973,-1185.80004883,-681.40002441,50.15499878,0.00000000,350.00000000,253.98742676); //object(sub_roadbarrier) (1)
CreateObject(973,-1180.80004883,-664.20001221,46.61999893,0.00000000,348.50000000,253.98741150); //object(sub_roadbarrier) (1)
CreateObject(973,-1183.29980469,-672.79980469,48.43999863,0.00000000,348.50000000,253.98742676); //object(sub_roadbarrier) (1)
CreateObject(973,-1178.30004883,-655.50000000,44.77999878,0.00000000,348.49731445,253.98741150); //object(sub_roadbarrier) (1)
CreateObject(973,-1175.80004883,-646.79998779,43.08000183,0.00000000,350.50000000,253.98741150); //object(sub_roadbarrier) (1)
CreateObject(973,-1173.30004883,-638.09997559,41.70000076,0.00000000,352.00000000,253.98741150); //object(sub_roadbarrier) (1)
CreateObject(973,-1170.90002441,-629.20001221,40.45000076,0.00000000,352.59997559,255.98742676); //object(sub_roadbarrier) (1)
CreateObject(973,-1168.69995117,-620.29998779,39.29999924,0.00000000,353.00000000,255.98693848); //object(sub_roadbarrier) (1)
CreateObject(973,-1166.50000000,-611.50000000,38.04999924,0.00000000,351.50000000,255.98144531); //object(sub_roadbarrier) (1)
CreateObject(973,-1161.90002441,-593.70001221,35.22999954,0.00000000,350.00000000,253.98146057); //object(sub_roadbarrier) (1)
CreateObject(973,-1164.29980469,-602.59960938,36.70000076,0.00000000,351.79870605,255.98144531); //object(sub_roadbarrier) (1)
CreateObject(973,-1159.19995117,-585.00000000,33.65999985,0.00000000,350.50000000,251.97644043); //object(sub_roadbarrier) (1)
CreateObject(973,-1155.90002441,-576.50000000,32.16999817,0.00000000,351.00000000,245.97644043); //object(sub_roadbarrier) (1)
CreateObject(973,-1144.69995117,-551.40002441,29.86000061,0.00000000,0.00000000,245.97290039); //object(sub_roadbarrier) (1)
CreateObject(973,-1152.19921875,-568.19921875,30.72999954,0.00000000,350.99670410,245.97290039); //object(sub_roadbarrier) (1)
CreateObject(973,-1148.50000000,-559.89941406,29.93000031,0.00000000,358.99475098,245.96740723); //object(sub_roadbarrier) (1)
CreateObject(973,-1140.80004883,-543.00000000,29.86000061,0.00000000,0.00000000,243.96742249); //object(sub_roadbarrier) (1)
CreateObject(973,-1136.40002441,-534.79998779,29.89999962,0.00000000,0.39999390,239.96240234); //object(sub_roadbarrier) (1)
CreateObject(973,-1121.90002441,-511.00000000,30.70999908,0.00000000,4.00000000,233.95788574); //object(sub_roadbarrier) (1)
CreateObject(973,-1131.69921875,-526.79980469,30.00000000,0.00000000,0.59875488,239.95788574); //object(sub_roadbarrier) (1)
CreateObject(973,-1127.00000000,-518.79980469,30.21999931,0.00000000,1.99951172,239.95788574); //object(sub_roadbarrier) (1)
CreateObject(973,-1111.19995117,-496.29998779,32.00000000,0.00000000,3.99902344,233.95387268); //object(sub_roadbarrier) (1)
CreateObject(973,-1116.59960938,-503.69921875,31.34000015,0.00000000,3.99902344,233.95385742); //object(sub_roadbarrier) (1)
CreateObject(973,-1105.30004883,-489.29998779,32.50000000,0.00000000,2.20001221,225.95387268); //object(sub_roadbarrier) (1)
CreateObject(973,-1092.30004883,-475.89999390,33.15999985,0.00000000,2.00000000,225.95031738); //object(sub_roadbarrier) (1)
CreateObject(973,-1098.79980469,-482.59960938,32.84000015,0.00000000,1.99951172,225.95031738); //object(sub_roadbarrier) (1)
CreateObject(973,-1070.50000000,-459.10000610,34.56000137,0.00000000,1.60000610,211.95031738); //object(sub_roadbarrier) (1)
CreateObject(973,-1085.39941406,-469.69921875,33.65000153,0.00000000,3.99902344,217.94679260); //object(sub_roadbarrier) (1)
CreateObject(973,-1078.09960938,-464.19921875,34.20000076,0.00000000,2.99926758,215.94726562); //object(sub_roadbarrier) (1)
CreateObject(973,-1054.00000000,-450.50000000,35.20000076,0.00000000,2.50000000,205.94824219); //object(sub_roadbarrier) (1)
CreateObject(973,-1062.39941406,-454.59960938,34.84999847,0.00000000,1.99951172,205.94421387); //object(sub_roadbarrier) (1)
CreateObject(973,-1045.59997559,-446.60000610,35.65000153,0.00000000,3.00000000,203.94421387); //object(sub_roadbarrier) (1)
CreateObject(973,-1037.19995117,-442.89999390,36.04999924,0.00000000,2.00000000,203.93920898); //object(sub_roadbarrier) (1)
CreateObject(973,-1020.40002441,-435.50000000,36.27999878,0.00000000,0.00000000,203.93371582); //object(sub_roadbarrier) (1)
CreateObject(973,-1028.79980469,-439.19921875,36.25000000,0.00000000,0.39999390,203.93371582); //object(sub_roadbarrier) (1)
CreateObject(973,-1012.29998779,-431.20001221,36.27999878,0.00000000,0.00000000,211.93371582); //object(sub_roadbarrier) (1)
CreateObject(973,-1004.79998779,-425.79998779,36.29000092,0.00000000,0.00000000,219.93174744); //object(sub_roadbarrier) (1)
CreateObject(973,-998.09997559,-419.29998779,36.29000092,0.00000000,0.00000000,227.92980957); //object(sub_roadbarrier) (1)
CreateObject(973,-1228.30004883,-760.50000000,63.59000015,0.00000000,358.50000000,225.99328613); //object(sub_roadbarrier) (1)
CreateObject(973,-1235.19995117,-766.50000000,63.83000183,0.00000000,358.49487305,215.98876953); //object(sub_roadbarrier) (1)
CreateObject(973,-1242.90002441,-771.50000000,64.50000000,0.00000000,353.00000000,209.98571777); //object(sub_roadbarrier) (1)
CreateObject(973,-1250.90002441,-776.09997559,65.62999725,0.00000000,352.99621582,209.98168945); //object(sub_roadbarrier) (1)
CreateObject(973,-1258.90002441,-780.70001221,66.76000214,0.00000000,352.99621582,209.98168945); //object(sub_roadbarrier) (1)
CreateObject(973,-1266.90002441,-785.29998779,67.73999786,0.00000000,355.00000000,209.98168945); //object(sub_roadbarrier) (1)
CreateObject(973,-1300.30004883,-801.00000000,71.44999695,0.00000000,353.00000000,199.97619629); //object(sub_roadbarrier) (1)
CreateObject(973,-1275.00000000,-789.79980469,68.55000305,0.00000000,354.99023438,207.97119141); //object(sub_roadbarrier) (1)
CreateObject(973,-1283.29980469,-794.00000000,69.36000061,0.00000000,354.99023438,205.97167969); //object(sub_roadbarrier) (1)
CreateObject(973,-1291.69921875,-797.69921875,70.31999969,0.00000000,352.99621582,201.97265625); //object(sub_roadbarrier) (1)
CreateObject(973,-1317.59997559,-806.09997559,73.66999817,0.00000000,352.99621582,185.97314453); //object(sub_roadbarrier) (1)
CreateObject(973,-1308.79980469,-804.09960938,72.55999756,0.00000000,352.99621582,199.97314453); //object(sub_roadbarrier) (1)
CreateObject(973,-1326.59997559,-807.00000000,74.61000061,0.00000000,355.00000000,185.97106934); //object(sub_roadbarrier) (1)
CreateObject(973,-1335.30004883,-807.90002441,75.44999695,0.00000000,354.00000000,185.96557617); //object(sub_roadbarrier) (1)
CreateObject(973,-1344.40002441,-808.70001221,76.50000000,0.00000000,353.00000000,183.96559143); //object(sub_roadbarrier) (1)
CreateObject(973,-1408.40002441,-811.00000000,81.70999908,0.00000000,0.00000000,181.96057129); //object(sub_roadbarrier) (1)
CreateObject(973,-1353.59960938,-809.19921875,77.63999939,0.00000000,352.99072266,181.95556641); //object(sub_roadbarrier) (1)
CreateObject(973,-1362.69921875,-809.50000000,78.83000183,0.00000000,351.99645996,181.95556641); //object(sub_roadbarrier) (1)
CreateObject(973,-1371.89941406,-809.79980469,80.09999847,0.00000000,352.29858398,181.95556641); //object(sub_roadbarrier) (1)
CreateObject(973,-1381.00000000,-810.09960938,81.19999695,0.00000000,353.99597168,181.95556641); //object(sub_roadbarrier) (1)
CreateObject(973,-1390.19921875,-810.39941406,81.69999695,0.00000000,359.69787598,181.95556641); //object(sub_roadbarrier) (1)
CreateObject(973,-1399.50000000,-810.69921875,81.72000122,0.00000000,0.00000000,181.95556641); //object(sub_roadbarrier) (1)
CreateObject(973,-1426.69995117,-811.59997559,79.86000061,0.00000000,9.00000000,181.95556641); //object(sub_roadbarrier) (1)
CreateObject(973,-1417.59960938,-811.29980469,81.13999939,0.00000000,7.00000000,181.95007324); //object(sub_roadbarrier) (1)
CreateObject(973,-1453.69995117,-812.50000000,74.66000366,0.00000000,14.50000000,181.95007324); //object(sub_roadbarrier) (1)
CreateObject(973,-1435.89941406,-811.89941406,78.40000153,0.00000000,8.99780273,181.95007324); //object(sub_roadbarrier) (1)
CreateObject(973,-1444.89941406,-812.19921875,76.73999786,0.00000000,11.99707031,181.95007324); //object(sub_roadbarrier) (1)
CreateObject(973,-1471.30004883,-813.09997559,69.90000153,0.00000000,16.00000000,181.95007324); //object(sub_roadbarrier) (1)
CreateObject(973,-1462.39941406,-812.79980469,72.37000275,0.00000000,14.99633789,181.95007324); //object(sub_roadbarrier) (1)
CreateObject(973,-1480.19995117,-813.40002441,67.38999939,0.00000000,15.50000000,181.95007324); //object(sub_roadbarrier) (1)
CreateObject(973,-1497.90002441,-813.70001221,62.65000153,0.00000000,14.70001221,177.95007324); //object(sub_roadbarrier) (1)
CreateObject(973,-1489.00000000,-813.69921875,65.00000000,0.00000000,14.99633789,181.95007324); //object(sub_roadbarrier) (1)
CreateObject(973,-1506.79980469,-813.09960938,60.38000107,0.00000000,13.99658203,173.94104004); //object(sub_roadbarrier) (1)
CreateObject(973,-1515.69921875,-812.00000000,58.45999908,0.00000000,9.99755859,171.93603516); //object(sub_roadbarrier) (1)
CreateObject(973,-1524.50000000,-810.59960938,56.99000168,0.00000000,8.99780273,169.93652344); //object(sub_roadbarrier) (1)
CreateObject(1237,-1529.40002441,-809.79998779,55.40000153,0.00000000,350.00000000,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,-1529.19921875,-809.19921875,55.59999847,0.00000000,349.99694824,0.00000000); //object(strtbarrier01) (1)
CreateObject(1237,-1530.09997559,-809.29998779,55.40000153,0.00000000,349.99694824,0.00000000); //object(strtbarrier01) (1)
CreateObject(3037,2071.50000000,-1831.00000000,14.69999981,0.00000000,0.00000000,0.00000000); //object(warehouse_door2b) (1)
CreateObject(3037,488.39999390,-1734.69995117,12.30000019,90.00000000,180.00000000,262.00000000); //object(warehouse_door2b) (2)
CreateObject(3037,-1935.80004883,238.69999695,35.50000000,0.00000000,0.00000000,89.98541260); //object(warehouse_door2b) (3)
CreateObject(3037,1024.19921875,-1029.39941406,33.40000153,0.00000000,0.00000000,269.98352051); //object(warehouse_door2b) (4)
CreateObject(3037,1043.00000000,-1026.00000000,33.29999924,0.00000000,0.00000000,269.98352051); //object(warehouse_door2b) (5)
CreateObject(3037,720.03906250,-462.69921875,15.00000000,90.00000000,179.99450684,89.98352051); //object(warehouse_door2b) (6)
CreateObject(3037,-1904.40002441,277.70001221,42.20000076,0.00000000,0.00000000,89.98352051); //object(warehouse_door2b) (7)
CreateObject(3037,-1903.90002441,277.70001221,44.50000000,0.00000000,0.00000000,89.98352051); //object(warehouse_door2b) (8)
CreateObject(3037,-2716.00000000,217.60000610,5.59999990,0.00000000,0.00000000,179.98352051); //object(warehouse_door2b) (9)
CreateObject(3037,2386.69995117,1043.40002441,12.00000000,0.00000000,0.00000000,269.98352051); //object(warehouse_door2b) (10)
CreateObject(3037,1968.50000000,2163.89990234,11.00000000,90.00000000,180.00000000,179.97802734); //object(warehouse_door2b) (11)
CreateObject(3037,1968.50000000,2161.00000000,11.00000000,90.00000000,180.00549316,179.96154785); //object(warehouse_door2b) (12)
CreateObject(3037,-98.50000000,1111.35998535,21.00000000,0.00000000,0.00000000,90.00000000); //object(warehouse_door2b) (13)
CreateObject(973,-1748.59997559,-594.00000000,16.29999924,0.00000000,0.00000000,359.99414062); //object(sub_roadbarrier) (1)
CreateObject(973,-1739.30004883,-594.00000000,16.29999924,0.00000000,0.00000000,359.99401855); //object(sub_roadbarrier) (1)
CreateObject(973,-1752.80004883,-598.50000000,16.29999924,0.00000000,0.00000000,93.98901367); //object(sub_roadbarrier) (1)
CreateObject(973,-1750.90002441,-643.70001221,18.94000053,0.00000000,7.00000000,89.98803711); //object(sub_roadbarrier) (1)
CreateObject(973,-1752.19921875,-607.39941406,16.37999916,0.00000000,0.99975586,93.98803711); //object(sub_roadbarrier) (1)
CreateObject(973,-1751.59960938,-616.39941406,16.70999908,0.00000000,2.99926758,93.98803711); //object(sub_roadbarrier) (1)
CreateObject(973,-1751.09960938,-625.50000000,17.27000046,0.00000000,3.99902344,91.98303223); //object(sub_roadbarrier) (1)
CreateObject(973,-1750.89941406,-634.79980469,18.00000000,0.00000000,4.99877930,89.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1730.19995117,-594.00000000,16.29999924,0.00000000,0.00000000,359.98901367); //object(sub_roadbarrier) (1)
CreateObject(973,-1711.90002441,-592.20001221,15.69999981,0.00000000,3.50000000,9.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1721.00000000,-593.50000000,16.12999916,0.00000000,1.99951172,5.98205566); //object(sub_roadbarrier) (1)
CreateObject(973,-1694.50000000,-586.40002441,14.10999966,0.00000000,6.00000000,27.98107910); //object(sub_roadbarrier) (1)
CreateObject(973,-1703.00000000,-590.00000000,15.00000000,0.00000000,4.99877930,17.97912598); //object(sub_roadbarrier) (1)
CreateObject(973,-1776.00000000,-565.90002441,16.20000076,0.00000000,0.00000000,179.98901367); //object(sub_roadbarrier) (1)
CreateObject(973,-1803.50000000,-565.89941406,16.00000000,0.00000000,0.00000000,179.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1794.39941406,-565.89941406,16.10000038,0.00000000,0.99975586,179.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1785.19921875,-565.89941406,16.19000053,0.00000000,0.00000000,179.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1748.09997559,-565.90002441,16.20000076,0.00000000,0.00000000,179.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1766.69921875,-565.89941406,16.20000076,0.00000000,0.00000000,179.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-124.50000000,-971.79998779,25.54000092,0.00000000,355.00000000,240.23352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1730.30004883,-565.90002441,16.20000076,0.00000000,0.00000000,179.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1738.79980469,-565.89941406,16.20000076,0.00000000,0.00000000,179.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1712.19995117,-564.00000000,15.30000019,0.00000000,355.00000000,191.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1721.09960938,-565.39941406,15.94999981,0.00000000,356.99523926,185.98207092); //object(sub_roadbarrier) (1)
CreateObject(973,-1703.40002441,-561.79998779,14.27000046,0.00000000,352.00000000,195.98059082); //object(sub_roadbarrier) (1)
CreateObject(973,-1809.40002441,-552.00000000,15.84000015,0.00000000,2.00000000,97.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1808.39941406,-561.29980469,16.00000000,0.00000000,0.00000000,93.98254395); //object(sub_roadbarrier) (1)
CreateObject(973,-1751.09997559,-652.59997559,20.04999924,0.00000000,6.99829102,87.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1751.69995117,-670.70001221,22.39999962,0.00000000,7.50000000,87.97851562); //object(sub_roadbarrier) (1)
CreateObject(973,-1751.39941406,-661.59960938,21.20000076,0.00000000,7.49816895,87.97851562); //object(sub_roadbarrier) (1)
CreateObject(973,-1746.30004883,-705.09997559,28.45000076,0.00000000,11.00000000,109.97854614); //object(sub_roadbarrier) (1)
CreateObject(973,-1751.69921875,-679.79980469,23.70999908,0.00000000,8.99780273,91.97753906); //object(sub_roadbarrier) (1)
CreateObject(973,-1750.79980469,-688.79980469,25.22999954,0.00000000,9.99755859,99.97558594); //object(sub_roadbarrier) (1)
CreateObject(973,-1748.80004883,-697.50000000,26.89999962,0.00000000,10.99731445,105.97363281); //object(sub_roadbarrier) (1)
CreateObject(973,-1776.30004883,-594.20001221,16.29999924,0.00000000,0.00000000,359.98901367); //object(sub_roadbarrier) (1)
CreateObject(973,-1785.59997559,-594.20001221,16.29999924,0.00000000,0.00000000,359.98901367); //object(sub_roadbarrier) (1)
CreateObject(973,-1794.80004883,-594.20001221,16.20000076,0.00000000,358.80004883,359.98901367); //object(sub_roadbarrier) (1)
CreateObject(973,-1803.80004883,-594.20001221,16.00000000,0.00000000,358.79699707,359.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1771.80004883,-598.79998779,16.34000015,0.00000000,359.00000000,269.98901367); //object(sub_roadbarrier) (1)
CreateObject(973,-1771.30004883,-617.09997559,16.79999924,0.00000000,357.00000000,271.98901367); //object(sub_roadbarrier) (1)
CreateObject(973,-1771.59960938,-608.00000000,16.50000000,0.00000000,358.99475098,271.98852539); //object(sub_roadbarrier) (1)
CreateObject(973,-1771.00000000,-626.20001221,17.35000038,0.00000000,356.00000000,271.98852539); //object(sub_roadbarrier) (1)
CreateObject(973,-1770.69995117,-635.29998779,18.04999924,0.00000000,355.00000000,271.98852539); //object(sub_roadbarrier) (1)
CreateObject(973,-1770.40002441,-644.50000000,19.00000000,0.00000000,353.00000000,271.98852539); //object(sub_roadbarrier) (1)
CreateObject(973,-1770.30004883,-652.90002441,20.02000046,0.00000000,352.99621582,269.98852539); //object(sub_roadbarrier) (1)
CreateObject(973,-1770.30004883,-662.09997559,21.21999931,0.00000000,352.00000000,269.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-1770.30004883,-671.09997559,22.50000000,0.00000000,351.99645996,269.97802734); //object(sub_roadbarrier) (1)
CreateObject(973,-1770.00000000,-680.20001221,23.72999954,0.00000000,352.40002441,273.97802734); //object(sub_roadbarrier) (1)
CreateObject(973,-1768.90002441,-689.29998779,24.97999954,0.00000000,352.00000000,279.97705078); //object(sub_roadbarrier) (1)
CreateObject(973,-1766.90002441,-698.09997559,26.32999992,0.00000000,351.00000000,285.97558594); //object(sub_roadbarrier) (1)
CreateObject(973,-1764.00000000,-706.59997559,27.73999977,0.00000000,350.99670410,291.97412109); //object(sub_roadbarrier) (1)
CreateObject(973,-1761.40002441,-711.90002441,28.68000031,0.00000000,350.99670410,297.97265625); //object(sub_roadbarrier) (1)
CreateObject(973,-1757.39941406,-565.89941406,16.20000076,0.00000000,0.00000000,179.98352051); //object(sub_roadbarrier) (1)
CreateObject(973,-111.69921875,-989.69921875,24.81999969,0.00000000,355.99548340,129.97924805); //object(sub_roadbarrier) (1)
CreateObject(973,-109.00000000,-973.59997559,24.35000038,0.00000000,5.50000000,61.97924805); //object(sub_roadbarrier) (1)
CreateObject(973,-112.90000153,-981.90002441,24.96999931,0.00000000,2.00000000,67.97692871); //object(sub_roadbarrier) (1)
CreateObject(973,-95.90000153,-949.40002441,21.57999992,0.00000000,6.00000000,63.97387695); //object(sub_roadbarrier) (1)
CreateObject(973,-104.50000000,-965.50000000,23.40999985,0.00000000,5.99853516,59.96887207); //object(sub_roadbarrier) (1)
CreateObject(973,-100.09960938,-957.59960938,22.50000000,0.00000000,5.39978027,61.97387695); //object(sub_roadbarrier) (1)
CreateObject(973,-91.90000153,-941.20001221,20.60000038,0.00000000,6.29998779,63.97338867); //object(sub_roadbarrier) (1)
CreateObject(973,-106.09960938,-996.89941406,24.20000076,0.00000000,355.98999023,125.98022461); //object(sub_roadbarrier) (1)
CreateObject(973,-143.80000305,-960.59997559,27.82999992,0.00000000,353.00000000,141.98178101); //object(sub_roadbarrier) (1)
CreateObject(973,-119.90000153,-963.79998779,24.63999939,0.00000000,354.00000000,239.97940063); //object(sub_roadbarrier) (1)
CreateObject(973,-115.59999847,-956.00000000,23.50000000,0.00000000,351.50000000,241.97433472); //object(sub_roadbarrier) (1)
CreateObject(973,-111.40000153,-948.09997559,22.29999924,0.00000000,353.29992676,241.97387695); //object(sub_roadbarrier) (1)
CreateObject(973,-107.09999847,-940.09997559,21.23600006,0.00000000,353.29833984,241.97387695); //object(sub_roadbarrier) (1)
CreateObject(973,-104.19999695,-934.70001221,20.52000046,0.00000000,353.29833984,241.97387695); //object(sub_roadbarrier) (1)
CreateObject(973,-130.00000000,-972.39941406,26.00000000,0.00000000,357.99499512,135.97778320); //object(sub_roadbarrier) (1)
CreateObject(973,-136.79980469,-966.29980469,26.71999931,0.00000000,352.99621582,139.97680664); //object(sub_roadbarrier) (1)
CreateObject(973,-150.89999390,-955.00000000,28.89999962,0.00000000,352.99621582,141.97631836); //object(sub_roadbarrier) (1)
CreateObject(973,-157.89999390,-949.50000000,30.00000000,0.00000000,352.99621582,141.97631836); //object(sub_roadbarrier) (1)
CreateObject(973,-164.80000305,-944.29998779,31.06999969,0.00000000,352.99072266,143.97631836); //object(sub_roadbarrier) (1)
CreateObject(973,-172.19999695,-938.90002441,32.20000076,0.00000000,352.98522949,143.97583008); //object(sub_roadbarrier) (1)
CreateObject(973,-179.60000610,-933.50000000,33.40000153,0.00000000,352.00000000,143.97583008); //object(sub_roadbarrier) (1)
CreateObject(973,-186.89999390,-928.40002441,34.70000076,0.00000000,351.50000000,145.97033691); //object(sub_roadbarrier) (1)
CreateObject(973,-194.39999390,-923.29998779,36.08000183,0.00000000,351.00000000,145.96984863); //object(sub_roadbarrier) (1)
CreateObject(973,-209.60000610,-913.09997559,39.00000000,0.00000000,350.99670410,145.96984863); //object(sub_roadbarrier) (1)
CreateObject(973,-202.00000000,-918.19921875,37.54000092,0.00000000,350.99670410,145.96984863); //object(sub_roadbarrier) (1)
CreateObject(973,-217.00000000,-908.09997559,40.34000015,0.00000000,352.00000000,145.96984863); //object(sub_roadbarrier) (1)
CreateObject(973,-280.89941406,-873.59960938,46.11999893,0.00000000,356.99523926,155.96740723); //object(sub_roadbarrier) (1)
CreateObject(973,-224.59960938,-903.19921875,41.61000061,0.00000000,351.99096680,147.96936035); //object(sub_roadbarrier) (1)
CreateObject(973,-232.39941406,-898.50000000,42.64300156,0.00000000,354.99572754,149.96887207); //object(sub_roadbarrier) (1)
CreateObject(973,-240.19921875,-894.00000000,43.34000015,0.00000000,355.99548340,149.96887207); //object(sub_roadbarrier) (1)
CreateObject(973,-248.19921875,-889.39941406,43.93999863,0.00000000,356.49536133,149.96887207); //object(sub_roadbarrier) (1)
CreateObject(973,-256.09960938,-885.00000000,44.50000000,0.00000000,356.49536133,151.96838379); //object(sub_roadbarrier) (1)
CreateObject(973,-264.19921875,-881.00000000,45.08000183,0.00000000,355.99548340,155.96740723); //object(sub_roadbarrier) (1)
CreateObject(973,-272.59960938,-877.29980469,45.63999939,0.00000000,356.99523926,155.96740723); //object(sub_roadbarrier) (1)
CreateObject(973,-277.20001221,-840.50000000,45.20000076,0.00000000,6.00000000,79.96740723); //object(sub_roadbarrier) (1)
CreateObject(973,-284.19921875,-867.29980469,46.47999954,0.00000000,357.99499512,79.96398926); //object(sub_roadbarrier) (1)
CreateObject(973,-281.79980469,-858.29980469,46.49000168,0.00000000,1.99951172,69.96643066); //object(sub_roadbarrier) (1)
CreateObject(973,-279.09960938,-849.50000000,46.00000000,0.00000000,3.99902344,75.96496582); //object(sub_roadbarrier) (1)
CreateObject(973,-276.39999390,-822.29998779,43.20000076,0.00000000,7.00000000,97.96398926); //object(sub_roadbarrier) (1)
CreateObject(973,-276.09960938,-831.50000000,44.25000000,0.00000000,5.99853516,85.96252441); //object(sub_roadbarrier) (1)
CreateObject(973,-281.79998779,-805.50000000,39.75000000,0.00000000,13.00000000,117.95959473); //object(sub_roadbarrier) (1)
CreateObject(973,-278.39941406,-813.59960938,41.70000076,0.00000000,11.99707031,107.95715332); //object(sub_roadbarrier) (1)
CreateObject(973,-287.00000000,-798.09997559,37.83000183,0.00000000,11.00000000,131.95468140); //object(sub_roadbarrier) (1)
CreateObject(973,-301.50000000,-788.00000000,35.33000183,0.00000000,5.00000000,155.95129395); //object(sub_roadbarrier) (1)
CreateObject(973,-293.69921875,-792.29980469,36.34999847,0.00000000,7.99804688,145.94787598); //object(sub_roadbarrier) (1)
CreateObject(973,-309.89999390,-784.40002441,34.59999847,0.00000000,4.00000000,157.95092773); //object(sub_roadbarrier) (1)
CreateObject(973,-318.39999390,-781.29998779,34.09999847,0.00000000,2.20001221,161.95043945); //object(sub_roadbarrier) (1)
CreateObject(973,-327.19921875,-778.79980469,33.50000000,0.00000000,5.00000000,165.94848633); //object(sub_roadbarrier) (1)
CreateObject(973,-336.09960938,-776.59960938,32.45000076,0.00000000,7.99804688,165.94299316); //object(sub_roadbarrier) (1)
CreateObject(973,-302.39999390,-860.09997559,46.75000000,0.00000000,359.00000000,235.96289062); //object(sub_roadbarrier) (1)
CreateObject(973,-297.60000610,-852.09997559,46.33300018,0.00000000,356.00000000,241.96289062); //object(sub_roadbarrier) (1)
CreateObject(973,-397.10000610,-822.50000000,47.29999924,0.00000000,356.00000000,169.96740723); //object(sub_roadbarrier) (1)
CreateObject(973,-351.60000610,-844.29998779,47.00000000,0.00000000,0.00000000,155.96191406); //object(sub_roadbarrier) (1)
CreateObject(973,-343.29998779,-848.00000000,47.00000000,0.00000000,0.00000000,155.96191406); //object(sub_roadbarrier) (1)
CreateObject(973,-326.29998779,-855.40002441,46.79999924,0.00000000,0.00000000,157.96191406); //object(sub_roadbarrier) (1)
CreateObject(973,-334.79980469,-851.79980469,46.90000153,0.00000000,358.99475098,155.96191406); //object(sub_roadbarrier) (1)
CreateObject(973,-309.29998779,-862.29998779,46.79999924,0.00000000,0.00000000,157.96142578); //object(sub_roadbarrier) (1)
CreateObject(973,-317.89941406,-858.79980469,46.79999924,0.00000000,0.00000000,157.96142578); //object(sub_roadbarrier) (1)
CreateObject(973,-360.09960938,-840.50000000,47.00000000,0.00000000,0.00000000,155.96191406); //object(sub_roadbarrier) (1)
CreateObject(973,-406.00000000,-821.40002441,47.86000061,0.00000000,357.00000000,175.96398926); //object(sub_roadbarrier) (1)
CreateObject(973,-415.20001221,-821.90002441,48.27999878,0.00000000,358.00000000,189.96252441); //object(sub_roadbarrier) (1)
CreateObject(973,-424.00000000,-823.79998779,48.59999847,0.00000000,357.99499512,193.95910645); //object(sub_roadbarrier) (1)
CreateObject(973,-432.60000610,-825.90002441,48.90000153,0.00000000,357.98950195,193.95812988); //object(sub_roadbarrier) (1)
CreateObject(973,-457.10000610,-836.50000000,49.90000153,0.00000000,357.00000000,205.95812988); //object(sub_roadbarrier) (1)
CreateObject(973,-441.00000000,-828.79980469,49.20000076,0.00000000,357.98950195,203.95568848); //object(sub_roadbarrier) (1)
CreateObject(973,-449.09960938,-832.59960938,49.50000000,0.00000000,357.98950195,205.95520020); //object(sub_roadbarrier) (1)
CreateObject(973,-465.29998779,-840.70001221,50.40000153,0.00000000,356.99523926,207.95520020); //object(sub_roadbarrier) (1)
CreateObject(973,-473.00000000,-845.00000000,50.83000183,0.00000000,357.29998779,209.95471191); //object(sub_roadbarrier) (1)
CreateObject(973,-480.60000610,-849.79998779,51.29999924,0.00000000,357.00000000,213.95422363); //object(sub_roadbarrier) (1)
CreateObject(973,-488.20001221,-855.09997559,51.79999924,0.00000000,356.99523926,215.95324707); //object(sub_roadbarrier) (1)
CreateObject(973,-495.50000000,-860.79998779,52.29999924,0.00000000,356.99523926,219.95275879); //object(sub_roadbarrier) (1)
CreateObject(973,-502.29998779,-866.50000000,52.77000046,0.00000000,356.99523926,219.95176697); //object(sub_roadbarrier) (1)
CreateObject(973,-516.20001221,-878.29998779,52.20999908,0.00000000,16.00000000,221.95178223); //object(sub_roadbarrier) (1)
CreateObject(973,-509.29998779,-872.40002441,53.25000000,0.00000000,356.99523926,219.95178223); //object(sub_roadbarrier) (1)
CreateObject(973,-294.10000610,-843.79998779,45.70000076,0.00000000,355.99548340,251.96289062); //object(sub_roadbarrier) (1)
CreateObject(973,-291.89999390,-835.00000000,44.72999954,0.00000000,352.00000000,259.96044922); //object(sub_roadbarrier) (1)
CreateObject(973,-291.29998779,-826.00000000,43.27000046,0.00000000,350.00000000,271.95849609); //object(sub_roadbarrier) (1)
CreateObject(973,-292.50000000,-817.29998779,41.15000153,0.00000000,343.00000000,283.95559692); //object(sub_roadbarrier) (1)
CreateObject(973,-296.29998779,-809.79998779,38.22000122,0.00000000,340.00000000,309.95266724); //object(sub_roadbarrier) (1)
CreateObject(973,-302.79998779,-804.09997559,35.61999893,0.00000000,347.00000000,327.95178223); //object(sub_roadbarrier) (1)
CreateObject(973,-310.89999390,-799.79998779,34.31000137,0.00000000,357.00000000,335.94738770); //object(sub_roadbarrier) (1)
CreateObject(973,-328.39999390,-793.70001221,33.15000153,0.00000000,355.00000000,343.94543457); //object(sub_roadbarrier) (1)
CreateObject(973,-319.59960938,-796.39941406,33.81000137,0.00000000,356.99523926,341.94396973); //object(sub_roadbarrier) (1)
CreateObject(973,-337.29998779,-791.29998779,32.18000031,0.00000000,353.00000000,345.94348145); //object(sub_roadbarrier) (1)
CreateObject(973,-345.70001221,-789.20001221,29.70000076,0.00000000,335.00000000,345.94299316); //object(sub_roadbarrier) (1)
CreateObject(973,-344.29998779,-774.59997559,29.37000084,0.00000000,32.00000000,165.94299316); //object(sub_roadbarrier) (1)
CreateObject(984,-34.70000076,-1149.80004883,4.19999981,0.00000000,0.00000000,334.00000000); //object(fenceshit2) (3)
CreateObject(973,-81.09999847,-1035.59997559,23.29999924,0.00000000,350.00000000,115.98025513); //object(sub_roadbarrier) (1)
CreateObject(973,-77.50000000,-1043.69995117,21.30999947,0.00000000,344.80004883,111.97814941); //object(sub_roadbarrier) (1)
CreateObject(973,-77.00000000,-1095.40002441,5.32999992,0.00000000,345.00000000,73.97262573); //object(sub_roadbarrier) (1)
CreateObject(973,-74.89941406,-1052.09960938,18.89999962,0.00000000,344.78942871,101.96960449); //object(sub_roadbarrier) (1)
CreateObject(973,-73.19921875,-1060.79980469,16.43000031,0.00000000,343.99841309,99.97009277); //object(sub_roadbarrier) (1)
CreateObject(973,-72.59960938,-1069.59960938,13.72999954,0.00000000,341.99890137,87.96752930); //object(sub_roadbarrier) (1)
CreateObject(973,-73.39941406,-1078.29980469,10.85999966,0.00000000,341.59790039,81.96899414); //object(sub_roadbarrier) (1)
CreateObject(973,-74.89941406,-1086.89941406,7.96000004,0.00000000,341.59790039,77.96997070); //object(sub_roadbarrier) (1)
CreateObject(973,-79.19999695,-1101.90002441,3.57999992,0.00000000,346.00000000,69.00000000); //object(sub_roadbarrier) (1)
CreateObject(973,-93.40000153,-1041.80004883,23.00000000,0.00000000,10.00000000,295.97924805); //object(sub_roadbarrier) (1)
CreateObject(973,-90.19999695,-1050.09997559,20.89999962,0.00000000,16.29998779,285.97717285); //object(sub_roadbarrier) (1)
CreateObject(973,-87.90000153,-1067.50000000,15.43999958,0.00000000,19.00000000,271.97412109); //object(sub_roadbarrier) (1)
CreateObject(973,-88.50000000,-1058.79980469,18.26000023,0.00000000,16.59484863,275.97106934); //object(sub_roadbarrier) (1)
CreateObject(973,-88.19999695,-1076.19995117,12.39999962,0.00000000,19.29998779,263.97204590); //object(sub_roadbarrier) (1)
CreateObject(973,-89.40000153,-1084.69995117,9.31999969,0.00000000,20.00000000,259.96850586); //object(sub_roadbarrier) (1)
CreateObject(973,-91.19999695,-1093.19995117,6.30000019,0.00000000,18.00000000,255.96398926); //object(sub_roadbarrier) (1)
CreateObject(973,-96.30000305,-1110.19995117,2.20000005,0.00000000,7.50000000,249.95947266); //object(sub_roadbarrier) (1)
CreateObject(973,-93.50000000,-1101.69921875,3.83999991,0.00000000,12.99682617,253.95446777); //object(sub_roadbarrier) (1)

/*
Objects converted: 855
Vehicles converted: 0
Vehicle models found: 0
----------------------
In the time this conversion took to finish the US national debt has risen by about $28,474.58!
*/


return 1;
}

//forward SetPlayerRealChat(playerid,chat);
stock CreateRealchatDraws()
{
    RealChatDraw[0] = TextDrawCreate(500.000000,6.000000," /l");
	TextDrawUseBox(RealChatDraw[0],1);
	TextDrawBoxColor(RealChatDraw[0],0x00000099);
	TextDrawTextSize(RealChatDraw[0],541.000000,-14.000000);
	TextDrawAlignment(RealChatDraw[0],0);
	TextDrawBackgroundColor(RealChatDraw[0],0x000000cc);
	TextDrawFont(RealChatDraw[0],1);
	TextDrawLetterSize(RealChatDraw[0],0.399999,1.200000);
	TextDrawColor(RealChatDraw[0],COLOR_FADE1);
	TextDrawSetOutline(RealChatDraw[0],1);
	TextDrawSetProportional(RealChatDraw[0],1);
	TextDrawSetShadow(RealChatDraw[0],2);

    RealChatDraw[1] = TextDrawCreate(500.000000,6.000000," /a");
	TextDrawUseBox(RealChatDraw[1],1);
	TextDrawBoxColor(RealChatDraw[1],0x00000099);
	TextDrawTextSize(RealChatDraw[1],541.000000,-14.000000);
	TextDrawAlignment(RealChatDraw[1],0);
	TextDrawBackgroundColor(RealChatDraw[1],0x000000cc);
	TextDrawFont(RealChatDraw[1],1);
	TextDrawLetterSize(RealChatDraw[1],0.399999,1.200000);
	TextDrawColor(RealChatDraw[1],ADMIN_MESSAGE);
	TextDrawSetOutline(RealChatDraw[1],1);
	TextDrawSetProportional(RealChatDraw[1],1);
	TextDrawSetShadow(RealChatDraw[1],2);

    RealChatDraw[2] = TextDrawCreate(500.000000,6.000000," /b");
	TextDrawUseBox(RealChatDraw[2],1);
	TextDrawBoxColor(RealChatDraw[2],0x00000099);
	TextDrawTextSize(RealChatDraw[2],541.000000,-14.000000);
	TextDrawAlignment(RealChatDraw[2],0);
	TextDrawBackgroundColor(RealChatDraw[2],0x000000cc);
	TextDrawFont(RealChatDraw[2],1);
	TextDrawLetterSize(RealChatDraw[2],0.399999,1.200000);
	TextDrawColor(RealChatDraw[2],COLOR_FADE2);
	TextDrawSetOutline(RealChatDraw[2],1);
	TextDrawSetProportional(RealChatDraw[2],1);
	TextDrawSetShadow(RealChatDraw[2],2);

    RealChatDraw[3] = TextDrawCreate(500.000000,6.000000," /r");
	TextDrawUseBox(RealChatDraw[3],1);
	TextDrawBoxColor(RealChatDraw[3],0x00000099);
	TextDrawTextSize(RealChatDraw[3],541.000000,-14.000000);
	TextDrawAlignment(RealChatDraw[3],0);
	TextDrawBackgroundColor(RealChatDraw[3],0x000000cc);
	TextDrawFont(RealChatDraw[3],1);
	TextDrawLetterSize(RealChatDraw[3],0.399999,1.200000);
	TextDrawColor(RealChatDraw[3],RADIO_MESSAGE);
	TextDrawSetOutline(RealChatDraw[3],1);
	TextDrawSetProportional(RealChatDraw[3],1);
	TextDrawSetShadow(RealChatDraw[3],2);

    RealChatDraw[4] = TextDrawCreate(500.000000,6.000000," /s");
	TextDrawUseBox(RealChatDraw[4],1);
	TextDrawBoxColor(RealChatDraw[4],0x00000099);
	TextDrawTextSize(RealChatDraw[4],541.000000,-14.000000);
	TextDrawAlignment(RealChatDraw[4],0);
	TextDrawBackgroundColor(RealChatDraw[4],0x000000cc);
	TextDrawFont(RealChatDraw[4],1);
	TextDrawLetterSize(RealChatDraw[4],0.399999,1.200000);
	TextDrawColor(RealChatDraw[4],COLOR_WHITE);
	TextDrawSetOutline(RealChatDraw[4],1);
	TextDrawSetProportional(RealChatDraw[4],1);
	TextDrawSetShadow(RealChatDraw[4],2);

    RealChatDraw[5] = TextDrawCreate(500.000000,6.000000," /c");
	TextDrawUseBox(RealChatDraw[5],1);
	TextDrawBoxColor(RealChatDraw[5],0x00000099);
	TextDrawTextSize(RealChatDraw[5],541.000000,-14.000000);
	TextDrawAlignment(RealChatDraw[5],0);
	TextDrawBackgroundColor(RealChatDraw[5],0x000000cc);
	TextDrawFont(RealChatDraw[5],1);
	TextDrawLetterSize(RealChatDraw[5],0.399999,1.200000);
	TextDrawColor(RealChatDraw[5],COLOR_FADE3);
	TextDrawSetOutline(RealChatDraw[5],1);
	TextDrawSetProportional(RealChatDraw[5],1);
	TextDrawSetShadow(RealChatDraw[5],2);

    RealChatDraw[6] = TextDrawCreate(500.000000,6.000000," /o");
	TextDrawUseBox(RealChatDraw[6],1);
	TextDrawBoxColor(RealChatDraw[6],0x00000099);
	TextDrawTextSize(RealChatDraw[6],541.000000,-14.000000);
	TextDrawAlignment(RealChatDraw[6],0);
	TextDrawBackgroundColor(RealChatDraw[6],0x000000cc);
	TextDrawFont(RealChatDraw[6],1);
	TextDrawLetterSize(RealChatDraw[6],0.399999,1.200000);
	TextDrawColor(RealChatDraw[6],OOC_MESSAGE);
	TextDrawSetOutline(RealChatDraw[6],1);
	TextDrawSetProportional(RealChatDraw[6],1);
	TextDrawSetShadow(RealChatDraw[6],2);

	RealChatDraw[7] = TextDrawCreate(500.000000,6.000000," /hs");
	TextDrawUseBox(RealChatDraw[7],1);
	TextDrawBoxColor(RealChatDraw[7],0x00000099);
	TextDrawTextSize(RealChatDraw[7],541.000000,-14.000000);
	TextDrawAlignment(RealChatDraw[7],0);
	TextDrawBackgroundColor(RealChatDraw[7],0x000000cc);
	TextDrawFont(RealChatDraw[7],1);
	TextDrawLetterSize(RealChatDraw[7],0.399999,1.200000);
	TextDrawColor(RealChatDraw[7],0xEEDD82FF);
	TextDrawSetOutline(RealChatDraw[7],1);
	TextDrawSetProportional(RealChatDraw[7],1);
	TextDrawSetShadow(RealChatDraw[7],2);
	return 1;
}
COMMAND:realchat(playerid,params[])
	return cmd_rc(playerid,params);
COMMAND:rc(playerid,params[])
{
	new string[255];
	if(isnull(params))
	{
		if(RealChat[playerid] == 0)
        {
            new srcA[4];
			new srcB[4];
			new srcR[4];
			new srcS[4];
			new srcC[4];
			new srcO[4];
			new srcHS[4];
			RealChat[playerid] = 1;
			if(RealChatInfo[playerid][rcA] == 1) srcA = "+";
			else srcA = "-";
			if(RealChatInfo[playerid][rcB] == 1) srcB = "+";
			else srcB = "-";
			if(RealChatInfo[playerid][rcR] == 1) srcR = "+";
			else srcR = "-";
			if(RealChatInfo[playerid][rcS] == 1) srcS = "+";
			else srcS = "-";
            if(RealChatInfo[playerid][rcC] == 1) srcC = "+";
            else srcC = "-";
            if(RealChatInfo[playerid][rcO] == 1) srcO = "+";
            else srcO = "-";
            if(RealChatInfo[playerid][rcHS] == 1) srcHS = "+";
            else srcHS = "-";
            RealChatInfo[playerid][rcL] = 1;
			SendClientMessage(playerid, COLOR_GREEN, " Realchat активирован.");
			SendClientMessage(playerid, COLOR_YELLOW, " Возможные опции:");
			format(string,sizeof(string),"/a[%s] /b[%s] /r[%s] /s[%s] /c[%s] /o[%s] /hs[%s]",
			srcA,
			srcB,
			srcR,
			srcS,
			srcC,
			srcO,
			srcHS);
			SendClientMessage(playerid, COLOR_YELLOW2,string);
			SetPlayerRealChat(playerid,RealChatType[playerid]);
			SendClientMessage(playerid, COLOR_YELLOW," ИСПОЛЬЗОВАНИЕ: /realchat [название чата](к примеру /b)");
			SendClientMessage(playerid, COLOR_YELLOW2," Для переключения чатов используйте 4 и 6 на NUM клавиатуре.");

		}
		else if(RealChat[playerid] == 1)
		{
		    RealChat[playerid] = 0;
		    SendClientMessage(playerid, COLOR_GREEN, " Realchat дизактивирован.");
	    	TextDrawHideForPlayer(playerid,RealChatDraw[RealChatType[playerid]]);
		    return 1;
		}
	}
	else if(strcmp(params,"/a",true) == 0)
	{
		if(RealChatInfo[playerid][rcA] == 0)
		{
			RealChatInfo[playerid][rcA] = 1;
			SendClientMessage(playerid, COLOR_GREEN, " /a добавлено.");
		}
		else
		{
        	RealChatInfo[playerid][rcA] = 0;
        	SendClientMessage(playerid, COLOR_RED, " /a убрано.");
		}
	}
	else if(strcmp(params,"/b",true) == 0)
	{
	    if(RealChatInfo[playerid][rcB] == 0)
		{
			RealChatInfo[playerid][rcB] = 1;
			SendClientMessage(playerid, COLOR_GREEN, " /b добавлено.");
		}
		else
		{
        	RealChatInfo[playerid][rcB] = 0;
        	SendClientMessage(playerid, COLOR_RED, " /b убрано.");
		}
	}
	else if(strcmp(params,"/r",true) == 0)
	{
	    if(RealChatInfo[playerid][rcR] == 0)
		{
			RealChatInfo[playerid][rcR] = 1;
			SendClientMessage(playerid, COLOR_GREEN, " /r добавлено.");
		}
		else
		{
        	RealChatInfo[playerid][rcR] = 0;
        	SendClientMessage(playerid, COLOR_RED, " /r убрано.");
		}
	}
    else if(strcmp(params,"/s",true) == 0)
	{
        if(RealChatInfo[playerid][rcS] == 0)
		{
			RealChatInfo[playerid][rcS] = 1;
			SendClientMessage(playerid, COLOR_GREEN, " /s добавлено.");
		}
		else
		{
        	RealChatInfo[playerid][rcS] = 0;
        	SendClientMessage(playerid, COLOR_RED, " /s убрано.");
		}
	}
	else if(strcmp(params,"/c",true) == 0)
	{
        if(RealChatInfo[playerid][rcC] == 0)
		{
			RealChatInfo[playerid][rcC] = 1;
			SendClientMessage(playerid, COLOR_GREEN, " /c добавлено.");
		}
		else
		{
        	RealChatInfo[playerid][rcC] = 0;
        	SendClientMessage(playerid, COLOR_RED, " /c  убрано.");
		}
	}
	else if(strcmp(params,"/o",true) == 0)
	{
        if(RealChatInfo[playerid][rcO] == 0)
		{
			RealChatInfo[playerid][rcO] = 1;
			SendClientMessage(playerid, COLOR_GREEN, " /o добавлено.");
		}
		else
		{
        	RealChatInfo[playerid][rcO] = 0;
        	SendClientMessage(playerid, COLOR_RED, " /o убрано.");
		}
	}
	else if(strcmp(params,"/hs",true) == 0)
	{
        if(RealChatInfo[playerid][rcHS] == 0)
		{
			RealChatInfo[playerid][rcHS] = 1;
			SendClientMessage(playerid, COLOR_GREEN, " /hs добавлено.");
		}
		else
		{
        	RealChatInfo[playerid][rcHS] = 0;
        	SendClientMessage(playerid, COLOR_RED, " /hs убрано.");
		}
	}
	return 1;
}

stock SetPlayerRealChat(playerid,chat)
{
	TextDrawHideForPlayer(playerid,RealChatDraw[RealChatType[playerid]]);
	RealChatType[playerid] = chat;
 	TextDrawShowForPlayer(playerid, RealChatDraw[chat]);
	return 1;
}

stock LoadHotel(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT hotelPrice, hotelEnX, hotelEnY, hotelEnZ, hotelInt, hotelName FROM holels WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>dfffds[64]",
		HotelInfo[i][hotelPrice],
		HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ],
		HotelInfo[i][hotelInt],
		HotelInfo[i][hotelName]);
	    HotelInfo[i][hotelValid]=1;
	    HotelLabel[i]=CreateDynamic3DTextLabel(HotelInfo[i][hotelName], COLOR_GREEN, HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ], 15.0);
		HotelPickup[i]=CreateDynamicPickup(19135,2,HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ]);
		HotelIcon[i]=CreateDynamicMapIcon(HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ],32, -1,-1,-1, -1, 250.0);
 	}
	else
	    HotelInfo[i][hotelValid]=0;
	mysql_free_result();
	return 1;
}
stock HotelInit()
{
    for(new i=0; i<MAX_HOTEL; i++)
        LoadHotel(i);
	return 1;
}
stock SaveHotel(i)
{
    if(HotelInfo[i][hotelValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE holels SET hotelPrice=%d, hotelEnX='%f', hotelEnY='%f', hotelEnZ='%f', hotelInt=%d, hotelName='%s' WHERE id=%d",
		HotelInfo[i][hotelPrice],
		HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ],
		HotelInfo[i][hotelInt],
		HotelInfo[i][hotelName],
		i);
		mysql_query(query);
		DestroyDynamic3DTextLabel(HotelLabel[i]);
		HotelLabel[i]=CreateDynamic3DTextLabel(HotelInfo[i][hotelName], COLOR_GREEN, HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ], 15.0);
		DestroyDynamicPickup(HotelPickup[i]);
		HotelPickup[i]=CreateDynamicPickup(19135,2,HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ]);
		DestroyDynamicMapIcon(HotelIcon[i]);
		HotelIcon[i]=CreateDynamicMapIcon(HotelInfo[i][hotelEnX],
		HotelInfo[i][hotelEnY],
		HotelInfo[i][hotelEnZ],32, -1,-1,-1, -1, 250.0);
	}
	return 1;
}
stock CreateHotel(playerid,price,interior,name[])
{
    for(new i=0; i<MAX_HOTEL; i++)
    {
        if(!HotelInfo[i][hotelValid])
		{
		    new query[255];
		    GetPlayerPos(playerid,HotelInfo[i][hotelEnX],HotelInfo[i][hotelEnY],HotelInfo[i][hotelEnZ]);
	    	format(query,sizeof(query),"INSERT INTO holels SET id=%d, hotelPrice=%d, hotelEnX='%f', hotelEnY='%f', hotelEnZ='%f', hotelInt=%d, hotelName=' %s'",
			i,
			price,
            HotelInfo[i][hotelEnX],
			HotelInfo[i][hotelEnY],
			HotelInfo[i][hotelEnZ],
			interior,
			name);
			mysql_query(query);
			LoadHotel(i);
			return i;
		}
    }
	return 1;
}
enum hotelineriorinfo
{
	Float:hiX,
	Float:hiY,
	Float:hiZ,
	hiInt,
};
new HotelInteriorInfo[][hotelineriorinfo]=
{
	{2233.8000488281,-1115.0,1050.9000244141,5}
};
COMMAND:hotelcreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new interior,price,name[64];
    if (sscanf(params, "iis[64]",interior,price,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /holelcreate [id интерьера] [цена за отдых] [название отеля]");
	if(interior>=sizeof(HotelInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер отеля.");
	new i= CreateHotel(playerid,price,interior,name);
	new str[255];
	format(str,sizeof(str),"Вы создали отель %d, цена за отдых %d, номер интерьера %d, навазние %s",i,price,interior,name);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:hotelshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowHotel(playerid,0,29);
    return 1;
}

stock ShowHotel(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_HOTEL; i++)
    {
        if(HotelInfo[i][hotelValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%s\n",
            str,
            i,
        	HotelInfo[i][hotelName]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список отелей [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_HOTELLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoHotel(playerid,i)
{
	SetPlayerPos(playerid,HotelInfo[i][hotelEnX],
	HotelInfo[i][hotelEnY],
	HotelInfo[i][hotelEnZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к отелю %d (%s)",i,HotelInfo[i][hotelName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:hoteldelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /hoteldelete [id отеля]");
    HotelInfo[i][hotelValid]=0;
    DestroyDynamic3DTextLabel(HotelLabel[i]);
	DestroyDynamicPickup(HotelPickup[i]);
	DestroyDynamicMapIcon(HotelIcon[i]);
    format(str,sizeof(str),"DELETE FROM hotels WHERE id=%d",i);
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили отель %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:hotelsetname(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
	new i,name[64];
    if (sscanf(params, "is[64]",i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /hotelsetname [id отеля] [название отеля]");
    format(HotelInfo[i][hotelName],64,"%s",name);
    SaveHotel(i);
	new str[255];
	format(str,sizeof(str),"Вы установили отелю %d, навазние %s",i,HotelInfo[i][hotelName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:hotelsetprice(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,price;
    if (sscanf(params, "ii",i,price))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /hotelsetprice [id отеля] [цена за отдых]");
    HotelInfo[i][hotelPrice]=price;
    SaveHotel(i);
    new str[255];
	format(str,sizeof(str),"Вы установили отелю %d, цена за отдых %d",i,HotelInfo[i][hotelPrice]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:hotelsetinterior(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,interior;
    if (sscanf(params, "ii",i,interior))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /hotelsetinterior [id отеля] [интерьер]");
    if(interior>=sizeof(HotelInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер отеля.");
    HotelInfo[i][hotelInt]=interior;
    SaveHotel(i);
    new str[255];
	format(str,sizeof(str),"Вы установили отелю %d, интерьер %d",i,HotelInfo[i][hotelInt]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}

enum foodinfo
{
	foodValid,
	foodName[64],
	Float:foodEnX,
	Float:foodEnY,
	Float:foodEnZ,
	foodInt,
};
new FoodInfo[MAX_FOOD][foodinfo];
new Text3D:FoodLabel[MAX_FOOD];
new FoodPickup[MAX_FOOD];
new FoodIcon[MAX_FOOD];

stock LoadFood(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT foodName, foodEnX, foodEnY, foodEnZ, foodInt FROM foods WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>s[64]fffd",
		FoodInfo[i][foodName],
		FoodInfo[i][foodEnX],
		FoodInfo[i][foodEnY],
		FoodInfo[i][foodEnZ],
		FoodInfo[i][foodInt]);
	    FoodInfo[i][foodValid]=1;
	    FoodLabel[i]=CreateDynamic3DTextLabel(FoodInfo[i][foodName], COLOR_GREEN, FoodInfo[i][foodEnX],
		FoodInfo[i][foodEnY],
		FoodInfo[i][foodEnZ], 15.0);
		FoodPickup[i]=CreateDynamicPickup(19135,2,FoodInfo[i][foodEnX],
		FoodInfo[i][foodEnY],
		FoodInfo[i][foodEnZ]);
		FoodIcon[i]=CreateDynamicMapIcon(FoodInfo[i][foodEnX],
		FoodInfo[i][foodEnY],
		FoodInfo[i][foodEnZ],50, -1,-1,-1, -1, 250.0);
 	}
 	else
 	    FoodInfo[i][foodValid]=0;
	mysql_free_result();
	return 1;
}
stock FoodInit()
{
    for(new i=0; i<MAX_FOOD; i++)
        LoadFood(i);
	return 1;
}
stock SaveFood(i)
{
    if(FoodInfo[i][foodValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE foods SET foodName='%s', foodEnX='%f', foodEnY='%f', foodEnZ='%f', foodInt=%d WHERE id=%d",
	    FoodInfo[i][foodName],
		FoodInfo[i][foodEnX],
		FoodInfo[i][foodEnY],
		FoodInfo[i][foodEnZ],
		FoodInfo[i][foodInt],
		i);
		mysql_query(query);
		DestroyDynamic3DTextLabel(FoodLabel[i]);
		FoodLabel[i]=CreateDynamic3DTextLabel(HotelInfo[i][hotelName], COLOR_GREEN, FoodInfo[i][foodEnX],
		FoodInfo[i][foodEnY],
		FoodInfo[i][foodEnZ], 15.0);
		DestroyDynamicPickup(FoodPickup[i]);
		FoodPickup[i]=CreateDynamicPickup(19135,2,FoodInfo[i][foodEnX],
		FoodInfo[i][foodEnY],
		FoodInfo[i][foodEnZ]);
		DestroyDynamicMapIcon(FoodIcon[i]);
		FoodIcon[i]=CreateDynamicMapIcon(FoodInfo[i][foodEnX],
		FoodInfo[i][foodEnY],
		FoodInfo[i][foodEnZ],50, -1,-1,-1, -1, 250.0);
	}
	return 1;
}
stock CreateFood(playerid,interior,name[])
{
    for(new i=0; i<MAX_FOOD; i++)
    {
        if(!FoodInfo[i][foodValid])
		{
		    new query[255];
		    GetPlayerPos(playerid,FoodInfo[i][foodEnX],FoodInfo[i][foodEnY],FoodInfo[i][foodEnZ]);
	    	format(query,sizeof(query),"INSERT INTO foods SET id=%d, foodName=' %s', foodEnX='%f', foodEnY='%f', foodEnZ='%f', foodInt=%d",
			i,
			name,
			FoodInfo[i][foodEnX],
			FoodInfo[i][foodEnY],
			FoodInfo[i][foodEnZ],
			interior);
			mysql_query(query);
			LoadFood(i);
			return i;
		}
    }
	return 1;
}
enum foodineriorinfo
{
	Float:fiX,
	Float:fiY,
	Float:fiZ,
	fiInt,
};
new FoodInteriorInfo[][foodineriorinfo]=
{
	{363.10000610352,-75.0,1001.5,10},//Burger Shot
	{372.39999389648,-133.30000305176,1001.5,5},//Well Stacked Pizza
	{364.89999389648,-11.5,1001.9000244141,9},//cluckin'bell
	{377.10000610352,-193.0,1000.5999755859,17}//Rusty Brown's Donuts
};
COMMAND:foodcreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new interior,name[64];
    if (sscanf(params, "is[64]",interior,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /foodcreate [id интерьера] [название забегаловки]");
	if(interior>=sizeof(FoodInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер забегаловки.");
	new i= CreateFood(playerid,interior,name);
	new str[255];
	format(str,sizeof(str),"Вы создали забегаловку %d, номер интерьера %d, название %s",i,interior,name);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:foodshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowFood(playerid,0,29);
    return 1;
}

stock ShowFood(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_FOOD; i++)
    {
        if(FoodInfo[i][foodValid])
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
	format(strm,sizeof(strm),"Список забегаловок [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_FOODLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoFood(playerid,i)
{
	SetPlayerPos(playerid,FoodInfo[i][foodEnX],FoodInfo[i][foodEnY],FoodInfo[i][foodEnZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к забегаловке %d (%s)",i,FoodInfo[i][foodName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:fooddelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /fooddelete [id забегаловки]");
    FoodInfo[i][foodValid]=0;
    DestroyDynamic3DTextLabel(FoodLabel[i]);
	DestroyDynamicPickup(FoodPickup[i]);
	DestroyDynamicMapIcon(FoodIcon[i]);
    format(str,sizeof(str),"DELETE FROM foods WHERE id=%d",i);
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили забегаловку %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:foodsetname(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,name[64];
    if (sscanf(params, "is[64]",i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /foodsetname [id забегаловки] [название забегаловки]");
    format(FoodInfo[i][foodName],64," %s",name);
	SaveFood(i);
    new str[255];
	format(str,sizeof(str),"Вы изменили название забегаловки %d, на %s",i,FoodInfo[i][foodName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:foodsetint(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,interior;
    if (sscanf(params, "ii",i,interior))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /foodsetint [id забегаловки] [интерьер]");
    if(interior>=sizeof(FoodInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер забегаловки.");
    FoodInfo[i][foodInt]=interior;
	SaveFood(i);
    new str[255];
	format(str,sizeof(str),"Вы изменили интерьер забегаловки %d, на %d",i,FoodInfo[i][foodInt]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}

COMMAND:hotel(playerid,params[])
{
    if(PlayerInfo[playerid][pLocal]!=1)
        return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в отеле.");
    StartShowLbt(playerid,0,0);
    InHotel[playerid]=GetPlayerVirtualWorld(playerid);
    TogglePlayerControllable(playerid,0);
    new str[255];
    format(str,sizeof(str),"Вы отдыхаете, остаток усталости %0.1f",PlayerInfo[playerid][pFatigue]);
	ShowPlayerDialog(playerid,DIALOG_HOTEL,DIALOG_STYLE_MSGBOX,"Отель",str,"Встать","");
	return 1;
}
enum eat
{
	eatName[64],
	eatPrice,
	Float:eatHunger
}
new Eat[sizeof(FoodInteriorInfo)][5][eat]=
{
{{"Биг Кинг",4,25.0},{"Бургер",2,10.0},{"Чизбургер",3,17.0},{"Кока Кола",2,7.0},{"Капучино",6,18.0}},
{{"Итальянаская пицца",6,50.0},{"Пицца 4 Сыра",5,40.0},{"Пицца пипперони",5,40.0},{"Клюквенный морс",2,7.0},{"Кофе-американо",7,21.0}},
{{"Острые крылошки",5,30.0},{"Бургер с курицей",4,25.0},{"Куринный суп",4,30.0},{"Спранк",2,7.0},{"Кофе",6,20.0}},
{{"Пончики с сахарной пудрой",3,20.0},{"Пончики с шоколадным сиропом",3,23.0},{"Пирожоное терамису",2,12.0},{"Сок",2,7.0},{"Макочино",12,30.0}}
//Салат,Картофель фри,Дессерт,пиво
};
COMMAND:food(playerid,params[])
{
    if(PlayerInfo[playerid][pLocal]!=2)
        return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в забегаловке.");
	new str[255];
	new world=GetPlayerVirtualWorld(playerid);
	new i = FoodInfo[world][foodInt];
	format(str,sizeof(str),"%s [%d$]\n%s [%d$]\n%s [%d$]\n%s [%d$]\n%s [%d$]",
	Eat[i][0][eatName],
	Eat[i][0][eatPrice],
	Eat[i][1][eatName],
	Eat[i][1][eatPrice],
	Eat[i][2][eatName],
	Eat[i][2][eatPrice],
	Eat[i][3][eatName],
	Eat[i][3][eatPrice],
	Eat[i][4][eatName],
	Eat[i][4][eatPrice]);
    ShowPlayerDialog(playerid,DIALOG_FOOD,DIALOG_STYLE_LIST,FoodInfo[world][foodName],str,"Выбрать","Отмена");
	return 1;
}
stock PlayerEat(playerid,listitem)
{
    new world=GetPlayerVirtualWorld(playerid);
	new i = FoodInfo[world][foodInt];
	if(listitem==4)
	{
	    if(PlayerCoffee[playerid] > 2)
	        return SendClientMessage(playerid,COLOR_GRAD2,"Нельзя больше пить кофе, вас вырвет.");
	    PlayerCoffee[playerid]++;
	    PlayerInfo[playerid][pFatigue]-=Eat[i][4][eatHunger];
	    if(PlayerInfo[playerid][pFatigue]<0.0)
            PlayerInfo[playerid][pFatigue]=0.0;
	}
	else
	{
		PlayerInfo[playerid][pHunger]-=Eat[i][listitem][eatHunger];//голод
		if(PlayerInfo[playerid][pHunger]<0.0)
            PlayerInfo[playerid][pHunger]=0.0;
	}
	new str[255];
	format(str,sizeof(str),"Вы употребили %s",Eat[i][listitem][eatName]);
	ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,FoodInfo[world][foodName],str,"Ок","");
	oGivePlayerMoney(playerid, -Eat[i][listitem][eatPrice]);
	return 1;
}
COMMAND:call(playerid,params[])
{
    if(!PlayerInfo[playerid][pPhoneOnline])
        return SendClientMessage(playerid,COLOR_WHITE,"[Черный экран телефона]{FFFF00} - Ваш телефон выключен.");
    if(!Signal[playerid])
		return SendClientMessage(playerid,COLOR_WHITE,"[Короткие прерывистые гудки]{FFFF00} - Нет сети.");
	new number;
	if(sscanf(params,"i",number))
	    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /call [номер абонента]");
	foreach(Player,i)
	{
		if(PlayerInfo[i][pPhoneOnline])
		{
			if(PlayerInfo[i][pPhone]==number)
			{
				if(Signal[i]>0)
				{
				    if(CallerID[i]==INVALID_PLAYER_ID)
				    {
				        CallerID[playerid]=i;
			         	CallerID[i]=playerid;
			         	PlayerInCall[playerid]=1;
				        new str[255];
						format(str,sizeof(str),"Вызываем абонента %d",number);
						SendClientMessage(playerid,COLOR_WHITE,str);
				        SendClientMessage(playerid,COLOR_WHITE,"[Длинные гудки]{FFFF00} - Ждите ответа.");
				        format(str,sizeof(str),"[Звонит телефон]{FFFF00} - Вас вызывает абонент %d {33AA33}[(/p)ickup] {AA3333}[(/h)angup]",PlayerInfo[playerid][pPhone]);
						SendClientMessage(i,COLOR_WHITE,str);
                        return 1;
				    }
				    else
				    	return SendClientMessage(playerid,COLOR_WHITE,"[Короткие гудки]{FFFF00} - Занято.");
				}
			}
		}
	}
	SendClientMessage(playerid,COLOR_WHITE,"[Ответ от сети]{FFFF00} - Аппарат абонента выключен или находится вне зоны действия сети.");
	return 1;
}
COMMAND:p(playerid,params[])
{
	if(!PlayerInfo[playerid][pPhoneOnline])
        return SendClientMessage(playerid,COLOR_WHITE,"[Черный экран телефона]{FFFF00} - Ваш телефон выключен.");
    if(!Signal[playerid])
		return SendClientMessage(playerid,COLOR_WHITE,"[Короткие прерывистые гудки]{FFFF00} - Нет сети.");
	if(PlayerInCall[playerid])
	    return SendClientMessage(playerid,COLOR_WHITE,"[Телефон у головы]{FFFF00} - Вы уже разговариваете.");
    new str[255];
	if(CallerID[playerid]==INVALID_PLAYER_ID)
	{
		new time[128];
		new ye,mo,da,hour,minute,second;
		getdate(ye,mo,da);
		gettime(hour,minute,second);
		format(time, sizeof(time),"%02d-%02d %02d:%02d:%02d",mo,da,hour,minute,second);
		format(str,sizeof(str),"[Телефон в руке]{FFFF00} - Время на экране %s",time);
	    return SendClientMessage(playerid,COLOR_WHITE,str);
	}
	PlayerInCall[playerid]=1;
	format(str,sizeof(str),"[Звонок]{FFFF00} - Абонент %d поднял трубку",PlayerInfo[playerid][pPhone]);
	SendClientMessage(CallerID[playerid],COLOR_WHITE,str);

	SendClientMessage(playerid,COLOR_WHITE,"[Звонок]{FFFF00} - Вы подняли трубку");
	return 1;
}
COMMAND:h(playerid,params[])
{
    if(!PlayerInfo[playerid][pPhoneOnline])
        return SendClientMessage(playerid,COLOR_WHITE,"[Черный экран телефона]{FFFF00} - Ваш телефон выключен.");
    if(!Signal[playerid])
		return SendClientMessage(playerid,COLOR_WHITE,"[Короткие прерывистые гудки]{FFFF00} - Нет сети.");
	if(CallerID[playerid]==INVALID_PLAYER_ID)
        return SendClientMessage(playerid,COLOR_WHITE,"[Телефон в кармане]{FFFF00} - Вы не ведете разговор.");
    new str[255];
	if(PlayerInCall[playerid])
	{
	    format(str,sizeof(str),"[Звонок]{FFFF00} - Абонент %d положил трубку",PlayerInfo[playerid][pPhone]);
		SendClientMessage(playerid,COLOR_WHITE,"[Звонок]{FFFF00} - Вы положили трубку");
	}
	else
	{
	    format(str,sizeof(str),"[Звонок]{FFFF00} - Абонент %d отклонил звонок",PlayerInfo[playerid][pPhone]);
		SendClientMessage(playerid,COLOR_WHITE,"[Звонок]{FFFF00} - Вы отклонили звонок");
	}
	SendClientMessage(CallerID[playerid],COLOR_WHITE,str);
	PlayerInCall[CallerID[playerid]]=0;
	CallerID[CallerID[playerid]]=INVALID_PLAYER_ID;
	CallerID[playerid]=INVALID_PLAYER_ID;
	PlayerInCall[playerid]=0;
	return 1;
}
COMMAND:sms(playerid,params[])
{
    if(!PlayerInfo[playerid][pPhoneOnline])
        return SendClientMessage(playerid,COLOR_WHITE,"[Черный экран телефона]{FFFF00} - Ваш телефон выключен.");
    if(!Signal[playerid])
        return SendClientMessage(playerid,COLOR_WHITE,"[Неудачныя отправка]{FFFF00} - Нет сети.");
    new number, text[128];
    if(sscanf(params,"is[128]",number,text))
	    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /sms [номер абонента] [текст]");
    foreach(Player,i)
	{
		if(PlayerInfo[i][pPhoneOnline])
		{
			if(PlayerInfo[i][pPhone]==number)
			{
				if(Signal[i]>0)
				{
					new str[255];
					format(str,sizeof(str),"[Сообщение от %d] {FFFF00}%s",PlayerInfo[playerid][pPhone],text);
					SendClientMessage(i,COLOR_WHITE,str);
					format(str,sizeof(str),"[Сообщение для %d] {FFFF00}%s",number,text);
					SendClientMessage(playerid,COLOR_WHITE,str);
					return 1;
				}
			}
		}
	}
	SendClientMessage(playerid,COLOR_WHITE,"[Неудачныя отправка]{FFFF00} - Доставка не удалась.");
	return 1;
}
COMMAND:togphone(playerid,params[])
{
	if(PlayerInCall[playerid])
	    return SendClientMessage(playerid,COLOR_WHITE,"[Неудобные движения]{FFFF00} - Нельзя выключить телефон во время разговора.");
    switch(PlayerInfo[playerid][pPhoneOnline])
    {
		case 0:
		{
		    SendClientMessage(playerid,COLOR_WHITE,"[Заставка включения на экране телефна]{FFFF00} - телефон включен.");
		    PlayerInfo[playerid][pPhoneOnline]=1;
		}
		case 1:
		{
		    SendClientMessage(playerid,COLOR_WHITE,"[Заставка выключения на экране телефна]{FFFF00} - телефон выключен.");
		    PlayerInfo[playerid][pPhoneOnline]=0;
		}
    }
	return 1;
}
stock CallDeath(playerid)
{
    if(CallerID[playerid]!=INVALID_PLAYER_ID)
    {
        new str[255];
	    format(str,sizeof(str),"[Звонок]{FFFF00} - Абонент %d находится вне зоны действия сети",PlayerInfo[playerid][pPhone]);
	    SendClientMessage(CallerID[playerid],COLOR_WHITE,str);
		SendClientMessage(playerid,COLOR_WHITE,"[Звонок]{FFFF00} - Сигнал потерян.");
        CallerID[CallerID[playerid]]=INVALID_PLAYER_ID;
        PlayerInCall[CallerID[playerid]]=0;
        PlayerInCall[playerid]=0;
        CallerID[playerid]=INVALID_PLAYER_ID;
    }
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
COMMAND:check(playerid,params[])
{
	if(!PlayerInfo[playerid][pAdmin])return 1;
	new giveplayerid;
	if(sscanf(params,"u",giveplayerid))
	    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /check [id/имя игрока]");
	ShowStats(giveplayerid,playerid);
	return 1;
}
COMMAND:kick(playerid,params[])
{
	new hour,minuite,second;
	gettime(hour,minuite,second);
	new giveplayerid,result[128],sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME],string[255];
	if(sscanf(params, "us[64]", giveplayerid,result))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /kick [id_игрока/ЧастьИмени] [причина]");
	if(IsPlayerNPC(giveplayerid))return 1;
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(IsPlayerConnected(giveplayerid))
		{
		    if(giveplayerid != INVALID_PLAYER_ID)
		    {
			    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				new kickstring[64];
				new year, month,day;
				getdate(year, month, day);
				format(string, sizeof(string), "AdmCmd: %s был кикнут администратором %s, причина: %s", giveplayer, sendername, (result));
				SendClientMessageToAll(COLOR_LIGHTRED, string);
				print(string);
				format(kickstring, sizeof(kickstring), "** Вас кикнул: %s **", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Причина: %s **",(result));
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Время: %02d:%02d:%02d **",hour,minuite,second);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Дата: %d/%d/%d **",day,month,year);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				Kick(giveplayerid);
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d - нет такого игрока.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	}
	return 1;
}
COMMAND:ban(playerid,params[])
{
	new hour,minuite,second;
	gettime(hour,minuite,second);
	new giveplayerid,result[128],sendername[MAX_PLAYER_NAME],giveplayer[MAX_PLAYER_NAME],string[255];
	if(sscanf(params, "us[64]", giveplayerid,result))
		return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /ban [id_игрока/ЧастьИмени] [причина]");
	if(IsPlayerNPC(giveplayerid))return 1;
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(IsPlayerConnected(giveplayerid))
		{
		    if(giveplayerid != INVALID_PLAYER_ID)
		    {
			    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				GetPlayerName(playerid, sendername, sizeof(sendername));
				new kickstring[64];
				new year, month,day;
				getdate(year, month, day);
				format(string, sizeof(string), "AdmCmd: %s был забанен администратором %s, причина: %s", giveplayer, sendername, (result));
				SendClientMessageToAll(COLOR_LIGHTRED, string);
				print(string);
				format(kickstring, sizeof(kickstring), "** Вас забанил: %s **", sendername);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Причина: %s **",(result));
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Время: %02d:%02d:%02d **",hour,minuite,second);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				format(kickstring, sizeof(kickstring), "** Дата: %d/%d/%d **",day,month,year);
				SendClientMessage(giveplayerid, COLOR_LIGHTRED, kickstring);
				PlayerInfo[giveplayerid][pBan]=1;
				Kick(giveplayerid);
				return 1;
			}
		}
		else
		{
			format(string, sizeof(string), "   %d - нет такого игрока.", giveplayerid);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
	}
	return 1;
}
stock LbtCreate(playerid)
{
	lbt[playerid] = TextDrawCreate(-1.000000,2.000000,"---");
	TextDrawUseBox(lbt[playerid],1);
	TextDrawBoxColor(lbt[playerid],0x000000ff);
	TextDrawColor(lbt[playerid],0x000000ff);
	TextDrawTextSize(lbt[playerid],640.000000,480.000000);
	TextDrawAlignment(lbt[playerid],0);
	TextDrawBackgroundColor(lbt[playerid],0x000000ff);
	TextDrawFont(lbt[playerid],3);
	TextDrawLetterSize(lbt[playerid],1.000000,480.0);
	TextDrawSetOutline(lbt[playerid],1);
	TextDrawSetProportional(lbt[playerid],1);
	TextDrawSetShadow(lbt[playerid],1);
	return 1;
}
stock LbtDestroy(playerid)
{
    TextDrawHideForPlayer(playerid, lbt[playerid]);
    TextDrawDestroy(lbt[playerid]);
    return 1;
}

stock StartShowLbt(playerid,bit,back)
{
	switch(bit)
	{
	    case 0://затемнение
			SetTimerEx("LbtSetTransperensy", 50, 0, "dddd", playerid,0,bit,back);
		case 1://осветление
		    SetTimerEx("LbtSetTransperensy", 50, 0, "dddd", playerid,15,bit,back);
	}
}
forward LbtSetTransperensy(playerid,col,bit,back);
public LbtSetTransperensy(playerid,col,bit,back)
{
    TextDrawHideForPlayer(playerid, lbt[playerid]);
	switch(col)
	{
	    case 0:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000000);
		    TextDrawColor(lbt[playerid],0x00000000);
			TextDrawBackgroundColor(lbt[playerid],0x00000000);
		}
		case 1:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000011);
		    TextDrawColor(lbt[playerid],0x00000011);
			TextDrawBackgroundColor(lbt[playerid],0x00000011);
		}
		case 2:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000022);
		    TextDrawColor(lbt[playerid],0x00000022);
			TextDrawBackgroundColor(lbt[playerid],0x00000022);
		}
		case 3:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000033);
		    TextDrawColor(lbt[playerid],0x00000033);
			TextDrawBackgroundColor(lbt[playerid],0x00000033);
		}
		case 4:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000044);
		    TextDrawColor(lbt[playerid],0x00000044);
			TextDrawBackgroundColor(lbt[playerid],0x00000044);
		}
		case 5:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000055);
		    TextDrawColor(lbt[playerid],0x00000055);
			TextDrawBackgroundColor(lbt[playerid],0x00000055);
		}
		case 6:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000066);
		    TextDrawColor(lbt[playerid],0x00000066);
			TextDrawBackgroundColor(lbt[playerid],0x00000066);
		}
		case 7:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000077);
		    TextDrawColor(lbt[playerid],0x00000077);
			TextDrawBackgroundColor(lbt[playerid],0x00000077);
		}
		case 8:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000088);
		    TextDrawColor(lbt[playerid],0x00000088);
			TextDrawBackgroundColor(lbt[playerid],0x00000088);
		}
		case 9:
		{
		    TextDrawBoxColor(lbt[playerid],0x00000099);
		    TextDrawColor(lbt[playerid],0x00000099);
			TextDrawBackgroundColor(lbt[playerid],0x00000099);
		}
		case 10:
		{
		    TextDrawBoxColor(lbt[playerid],0x000000aa);
		    TextDrawColor(lbt[playerid],0x000000aa);
			TextDrawBackgroundColor(lbt[playerid],0x000000aa);
		}
		case 11:
		{
		    TextDrawBoxColor(lbt[playerid],0x000000bb);
		    TextDrawColor(lbt[playerid],0x000000bb);
			TextDrawBackgroundColor(lbt[playerid],0x000000bb);
		}
		case 12:
		{
		    TextDrawBoxColor(lbt[playerid],0x000000cc);
		    TextDrawColor(lbt[playerid],0x000000cc);
			TextDrawBackgroundColor(lbt[playerid],0x000000cc);
		}
		case 13:
		{
		    TextDrawBoxColor(lbt[playerid],0x000000dd);
		    TextDrawColor(lbt[playerid],0x000000dd);
			TextDrawBackgroundColor(lbt[playerid],0x000000dd);
		}
		case 14:
		{
		    TextDrawBoxColor(lbt[playerid],0x000000ee);
		    TextDrawColor(lbt[playerid],0x000000ee);
			TextDrawBackgroundColor(lbt[playerid],0x000000ee);
		}
	    case 15:
		{
		    TextDrawBoxColor(lbt[playerid],0x000000ff);
		    TextDrawColor(lbt[playerid],0x000000ff);
			TextDrawBackgroundColor(lbt[playerid],0x000000ff);
		}
	}
	switch(bit)
	{
		case 0://затемнение
		{
		    col++;
			if(col!=16)
			    SetTimerEx("LbtSetTransperensy", 50, 0, "dddd", playerid,col,bit,back);
			else
			{
				if(back)
				{
				    SetTimerEx("LbtSetTransperensy", 300, 0, "dddd", playerid,15,1,back);
				}
			}
			TextDrawShowForPlayer(playerid, lbt[playerid]);
		}
		case 1://осветление
		{
			col--;
			if(col==0)
			{
			    TextDrawHideForPlayer(playerid, lbt[playerid]);
			    return 1;
			}
			else
			    SetTimerEx("LbtSetTransperensy", 50, 0, "dddd", playerid,col,bit,back);
		    TextDrawShowForPlayer(playerid, lbt[playerid]);
		}
	}
	return 1;
}
COMMAND:setstat(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin]<1)return 1;
	new giveplayerid,type,i,str[255];
	if(sscanf(params,"uii",giveplayerid,type,i))
	{
	    SendClientMessage(playerid, COLOR_GRAD2, "0 деньги 1 очки 2 телефон 3 пол 4 модель машины 5 цвет1 6 цвет2 7 пробег 8 туториал 9 тракстоп 10 голод 11 усталость 12 скин");
	    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗОВАНИЕ: /setstat [id_игрока/ЧастьИмени] [ключ] [значение]");
	}
	switch(type)
	{
	    case 0:
	    {
	        str="Деньги";
			PlayerInfo[giveplayerid][pMoney]=i;
		}
		case 1:
		{
		    str="Очки";
			PlayerInfo[giveplayerid][pPoints]=i;
		}
		case 2:
		{
		    str="Телефон";
			PlayerInfo[giveplayerid][pPhone]=i;
		}
		case 3:
		{
		    str="Пол";
			PlayerInfo[giveplayerid][pSex]=i;
		}
		case 4:
		{
		    str="Модель машины";
			PlayerInfo[giveplayerid][pCarModel]=i;
		}
		case 5:
		{
		    str="Цвет 1";
			PlayerInfo[giveplayerid][pCarColor1]=i;
		}
		case 6:
		{
		    str="Цвет 2";
			PlayerInfo[giveplayerid][pCarColor2]=i;
		}
		case 7:
		{
		    str="Пробег";
			PlayerInfo[giveplayerid][pCarMileage]=i*10000;
		}
		case 8:
		{
		    str="Туториал";
			PlayerInfo[giveplayerid][pTutorial]=i;
		}
		case 9:
		{
		    str="Тракстоп";
			PlayerInfo[giveplayerid][pTruckStop]=i;
		}
		case 10:
		{
		    str="Голод";
			PlayerInfo[giveplayerid][pHunger]=i;
		}
		case 11:
		{
		    str="Усталость";
			PlayerInfo[giveplayerid][pFatigue]=i;
		}
		case 12:
		{
		    str="Скин";
			PlayerInfo[giveplayerid][pModel]=i;
			SetPlayerSkin(playerid,PlayerInfo[playerid][pModel]);
		}
	}
	format(str,sizeof(str),"Вы изменили параметр [%s] на [%d]",str,i);
	SendClientMessage(playerid, COLOR_GRAD2,str);
	return 1;
}

enum specinfo
{
	InSpec,
	SpecID,
	Float:specx,
	Float:specy,
	Float:specz,
}
new SpecInfo[MAX_PLAYERS][specinfo];

stock Spec(playerid,targetid,bit)
{
	switch(bit)
	{
	    case 0://стартспек
	    {
	        SpecInfo[playerid][InSpec]=1;
	        GetPlayerPos(playerid,SpecInfo[playerid][specx],SpecInfo[playerid][specy],SpecInfo[playerid][specz]);
	        TogglePlayerSpectating(playerid,1);
	        Spec(playerid,targetid,1);
	        TextDrawShowForPlayer(playerid,ChangeText);
	    }
		case 1://плеерспек
		{
		    SpecInfo[playerid][SpecID]=targetid;
		    SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(targetid));
			SetPlayerInterior(playerid,GetPlayerInterior(targetid));
		    if(IsPlayerInAnyVehicle(targetid))
		    {
		        new vehid=GetPlayerVehicleID(targetid);
		        PlayerSpectateVehicle(playerid,vehid);
		    }
		    else
		    {
		    	PlayerSpectatePlayer(playerid,targetid);
		    }
			new string[128];
		    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~y~%s(ID:%d)",oGetPlayerName(targetid),targetid);
   			GameTextForPlayer(playerid, string, 4000, 3);
	    }
	    case 2://вечиклспек
	    {
	        SpecInfo[playerid][InSpec]=1;
	        TogglePlayerSpectating(playerid,1);
	        PlayerSpectateVehicle(playerid,targetid);
	        new model=GetVehicleModel(targetid);
	        new string[255];
	        format(string,sizeof(string),"~n~~n~~n~~n~~n~~n~~n~~y~%s(%d)ID:%d",CarName[model-400],model,targetid);
            GameTextForPlayer(playerid, string, 4000, 3);
		}
	    case 3://спекофф
	    {
	        SpecInfo[playerid][InSpec]=0;
	    	TogglePlayerSpectating(playerid,0);
	    	TextDrawHideForPlayer(playerid,ChangeText);
	    }
	    case 4://спекапдейт
		{
 			foreach (Player, i)
			{
				if(SpecInfo[i][InSpec])
				{
				    if(SpecInfo[i][SpecID]==playerid)
				    {
			   		    Spec(i,playerid,1);
					}
				}
			}
		}
		case 5://переключение вперед
		{
		    for(new i=SpecInfo[playerid][SpecID]; i<MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(IsPlayerNPC(i))
						continue;
				    if(GetPlayerState(i) == PLAYER_STATE_SPECTATING)
						continue;
					if(GetPlayerState(i) != 1 && GetPlayerState(i) != 2 && GetPlayerState(i) != 3)
						continue;
				    if(i>SpecInfo[playerid][SpecID]&&SpecInfo[playerid][SpecID]!=playerid)
				    {
				        Spec(playerid,i,1);
						return 1;
				    }
			    }
			}
		    SpecInfo[playerid][SpecID]=0;
		    //Spec(playerid,0,5);
		}
		case 6://переключение назад
		{
		    for(new i=SpecInfo[playerid][SpecID]; i>-1; i--)
			{
				if(IsPlayerConnected(i))
				{
					if(IsPlayerNPC(i))
						continue;
                    if(GetPlayerState(i) == PLAYER_STATE_SPECTATING)
						continue;
					if(GetPlayerState(i) != 1 && GetPlayerState(i) != 2 && GetPlayerState(i) != 3)
						continue;
				    if(i<SpecInfo[playerid][SpecID]&&SpecInfo[playerid][SpecID]!=playerid)
				    {
				        Spec(playerid,i,1);
						return 1;
				    }
			    }
			}
		    SpecInfo[playerid][SpecID]=MAX_PLAYERS;
		    //Spec(playerid,0,6);
		}
		case 7://выход спекаемого
		{
			foreach (Player, i)
			{
				if(SpecInfo[i][InSpec])
				{
				    if(SpecInfo[i][SpecID]==playerid)
				    {
						Spec(i,0,5);
					}
				}
			}
		}
		case 8:
		{
			ShowAllPlayersInRange(playerid,20.0);
		}
    }
    return 1;
}

stock SpecOnPlayerKeyStateChange(playerid, newkeys)
{
	if(SpecInfo[playerid][InSpec])
	{
	    switch(newkeys)
		{
		    case KEY_ANALOG_RIGHT:
			{
				Spec(playerid,0,5);
			}
			case KEY_ANALOG_LEFT:
			{
			    Spec(playerid,0,6);
			}
			case KEY_YES:
			{
				Spec(playerid,0,8);
			}
		}
	}
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	Spec(playerid,0,4);
	return 1;
}

stock ShowAllPlayersInRange(playerid,Float:range)
{
	new Float:dis2;
	new str[128];
	format(str,sizeof(str),"Игроки в радиусе %f от вас",range);
	SendClientMessage(playerid,COLOR_YELLOW,str);
	new Float:pos[3];
	GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	foreach (Player, x)
	{
		if(x != playerid)
		{
		    if(GetPlayerState(x)!=PLAYER_STATE_SPECTATING)
		    {
				dis2 = GetPlayerDistanceFromPoint(x,pos[0],pos[1],pos[2]);
				if(dis2 <= range)
				{
					format(str,sizeof(str),"%f - %s [%d]",dis2,oGetPlayerName(x),x);
					SendClientMessage(playerid,COLOR_GREY,str);
				}
			}
		}
	}
	return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
	    SetPlayerStartEngine(playerid,vehicleid);
	    if(PlayerInfo[playerid][pDeliveryID]==-1)
	    {
			if(PlayerInfo[playerid][pCarID]==vehicleid)
			{
				if(IsATruck(vehicleid))
				    SendClientMessage(playerid,COLOR_YELLOW,"Подцепите прицеп, для возможности получить заказ.");
				else
				    SendClientMessage(playerid,COLOR_YELLOW,"Используйте /delivery для получения заказа.");
			}
		}
	}
	Spec(playerid,0,4);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    Spec(playerid,0,4);
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    Spec(playerid,0,4);
    return 1;
}

COMMAND:spec(playerid,params[])
{
	new specid;
	if(sscanf(params, "u", specid))
		return SendClientMessage(playerid, COLOR_RED, " ИСПОЛЬЗУЙТЕ: /spec [id_игрока/ЧастьИмени]");
	if(specid == playerid)
		return SendClientMessage(playerid, COLOR_RED, " Нельзя наблюдать за самим собой!");

	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(IsPlayerConnected(specid))
		{
			if(GetPlayerState(specid) == PLAYER_STATE_SPECTATING)
				return SendClientMessage(playerid, COLOR_RED, " Этот игрок наблюдает за кем то!");
			if(GetPlayerState(specid) != 1 && GetPlayerState(specid) != 2 && GetPlayerState(specid) != 3)
				return SendClientMessage(playerid, COLOR_RED, " Игрок не вступил в игру!");
			Spec(playerid,specid,0);
		}
	}
	else
		SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	return 1;
}
COMMAND:specveh(playerid,params[])
{
    new specid;
	if(sscanf(params, "i", specid))
		return SendClientMessage(playerid, COLOR_RED, " ИСПОЛЬЗУЙТЕ: /specveh [id_авто]");
	if (PlayerInfo[playerid][pAdmin] >= 1)
	{
		Spec(playerid,specid,2);
	}
	return 1;
}
COMMAND:specoff(playerid,params[])
{
    new specid,string[128];
	if(sscanf(params, "u", specid))
	{
    	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
    	return Spec(playerid,0,3);
	}
	if(PlayerInfo[playerid][pAdmin] >= 1337)
	{
		Spec(specid,0,3);
		format(string, sizeof(string), " Вы выкинули [%d]%s из режима наблюдения!",specid, oGetPlayerName(specid));
		SendClientMessage(playerid, COLOR_GRAD2, string);
	}
	return 1;
}

stock LoadRadar(i)
{
	new query[255],Field[255];
	format(query,sizeof(query),"SELECT radarObjX, radarObjY, radarObjZ, radarObjRot, radarZoneX, radarZoneY, radarZoneZ, radarZoneRad, radarMaxSpeed FROM radars WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>fffffffff",
        RadarInfo[i][radarObjX],
        RadarInfo[i][radarObjY],
        RadarInfo[i][radarObjZ],
        RadarInfo[i][radarObjRot],
		RadarInfo[i][radarZoneX],
		RadarInfo[i][radarZoneY],
		RadarInfo[i][radarZoneZ],
		RadarInfo[i][radarZoneRad],
		RadarInfo[i][radarMaxSpeed]);
		RadarInfo[i][radarValid]=1;
		RadarInfo[i][radarObjID]=CreateDynamicObject(18880, RadarInfo[i][radarObjX],RadarInfo[i][radarObjY],RadarInfo[i][radarObjZ]-1.0,0.0,0.0,RadarInfo[i][radarObjRot]-180.0);

	}
	else
	    RadarInfo[i][radarValid]=0;
	mysql_free_result();
	return 1;
}
stock RadarInit()
{
    for(new i=0; i<MAX_RADAR; i++)
        LoadRadar(i);
    return 1;
}
stock SaveRadar(i)
{
	if(RadarInfo[i][radarValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE radars SET radarObjX='%f', radarObjY='%f', radarObjZ='%f', radarObjRot='%f', radarZoneX='%f', radarZoneY='%f', radarZoneZ='%f', radarZoneRad='%f', radarMaxSpeed='%f' WHERE id=%d",
        RadarInfo[i][radarObjX],
        RadarInfo[i][radarObjY],
        RadarInfo[i][radarObjZ],
        RadarInfo[i][radarObjRot],
		RadarInfo[i][radarZoneX],
		RadarInfo[i][radarZoneY],
		RadarInfo[i][radarZoneZ],
		RadarInfo[i][radarZoneRad],
		RadarInfo[i][radarMaxSpeed],
		i);
		mysql_query(query);
		DestroyDynamicObject(RadarInfo[i][radarObjID]);
		RadarInfo[i][radarObjID]=CreateDynamicObject(18880, RadarInfo[i][radarObjX],RadarInfo[i][radarObjY],RadarInfo[i][radarObjZ]-1.0,0.0,0.0,RadarInfo[i][radarObjRot]-180.0);
	}
	return 1;
}
stock CreateRadar(playerid,Float:speed)
{
	for(new i=0; i<MAX_RADAR; i++)
	{
		if(!RadarInfo[i][radarValid])
		{
		    GetPlayerPos(playerid,RadarInfo[i][radarObjX],RadarInfo[i][radarObjY],RadarInfo[i][radarObjZ]);
		    GetPlayerFacingAngle(playerid,RadarInfo[i][radarObjRot]);
		    new query[255];
		    format(query,sizeof(query),"INSERT INTO radars SET radarObjX='%f', radarObjY='%f', radarObjZ='%f', radarObjRot='%f', radarMaxSpeed='%f', id=%d",
            RadarInfo[i][radarObjX],
	        RadarInfo[i][radarObjY],
	        RadarInfo[i][radarObjZ],
	        RadarInfo[i][radarObjRot],
	        speed,
	        i);
	        mysql_query(query);
	        LoadRadar(i);
			return i;
		}
	}
	return 1;
}
COMMAND:radarcreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new Float:speed;
    if(sscanf(params, "f",speed))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /radarcreate [максимальная скорость]");
    new i=CreateRadar(playerid,speed);
    new str[128];
    format(str,sizeof(str),"Вы создали радар %d, максимальная скорость %0.1f",i,RadarInfo[i][radarMaxSpeed]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:radarshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowRadar(playerid,0,29);
    return 1;
}

stock ShowRadar(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_RADAR; i++)
    {
        if(RadarInfo[i][radarValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%0.1f\n",
            str,
            i,
        	RadarInfo[i][radarMaxSpeed]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список радаров [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_RADARLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoRadar(playerid,i)
{
	SetPlayerPos(playerid,RadarInfo[i][radarObjX],
    RadarInfo[i][radarObjY],
    RadarInfo[i][radarObjZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к радару %d (%0.1f)",i,RadarInfo[i][radarMaxSpeed]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:radardelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /radardelete [id радара]");
    RadarInfo[i][radarValid]=0;
    DestroyDynamicObject(RadarInfo[i][radarObjID]);
    format(str,sizeof(str),"DELETE FROM radars WHERE id=%d",i);
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили радар %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:radarzone(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,Float:rad;
    if(sscanf(params, "if",i,rad))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /radarzone [id радара] [радиус действия зоны]");
    RadarInfo[i][radarZoneRad]=rad;
	GetPlayerPos(playerid,RadarInfo[i][radarZoneX],RadarInfo[i][radarZoneY],RadarInfo[i][radarZoneZ]);
    SaveRadar(i);
    new str[128];
    format(str,sizeof(str),"Вы установили зону для радара %d, радиус %f",i,RadarInfo[i][radarZoneRad]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
stock OnPlayerRadar(playerid)
{
	new Float:razn;
	if(PlayerTicket[playerid])
	{
	    PlayerRadarDetect[playerid]=0;
	    return 1;
	}
	for(new i=0; i<MAX_RADAR; i++)
	{
		if(RadarInfo[i][radarValid])
		{
		    if(IsPlayerInRangeOfPoint(playerid,RadarInfo[i][radarZoneRad],RadarInfo[i][radarZoneX],RadarInfo[i][radarZoneY],RadarInfo[i][radarZoneZ]))
		    {
		        PlayerRadarDetect[playerid]=3;
		        razn=PlayerInfo[playerid][pSpeed]-RadarInfo[i][radarMaxSpeed];
				if(razn > 60.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,3000);
				else if(razn > 50.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,2500);
				else if(razn > 40.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,2000);
				else if(razn > 30.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,1500);
				else if(razn > 20.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,700);
				else if(razn > 10.0)GivePlayerSpeedTicket(playerid,RadarInfo[i][radarMaxSpeed],razn,300);
		        return 1;
		    }
		    else if(PlayerInfo[playerid][pCarRadarDetector])
		    {
				if(IsPlayerInRangeOfPoint(playerid,RadarInfo[i][radarZoneRad]*5,RadarInfo[i][radarZoneX],RadarInfo[i][radarZoneY],RadarInfo[i][radarZoneZ]))
				{
				    PlayerRadarDetect[playerid]=2;
				    PlayerPlaySound(playerid, 5201, 0.0, 0.0, 0.0);
				    return 1;
				}
				else if(IsPlayerInRangeOfPoint(playerid,RadarInfo[i][radarZoneRad]*10,RadarInfo[i][radarZoneX],RadarInfo[i][radarZoneY],RadarInfo[i][radarZoneZ]))
				{
				   	PlayerRadarDetect[playerid]=1;
				   	PlayerPlaySound(playerid, 5201, 0.0, 0.0, 0.0);
				   	return 1;
				}
			}
		}
	}
	PlayerRadarDetect[playerid]=0;
	return 1;
}

stock GivePlayerSpeedTicket(playerid,Float:maxspeed,Float:razn,money)
{
	new str[255];
	PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);
	format(str,sizeof(str),"[Автоматическое извещение]{FFFF00} Вы попали на автоматический дорожный радар, с вашего счета списано %d $",money);
	SendClientMessage(playerid, COLOR_WHITE, str);
	format(str,sizeof(str),"[Автоматическое извещение]{FFFF00} Максимальная скорость на данном участке - %0.1f mph, превышение %0.1f mph",maxspeed,razn);
	SendClientMessage(playerid, COLOR_WHITE, str);
	oGivePlayerMoney(playerid,-money);
	PlayerTicket[playerid]=60;
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

COMMAND:fixveh(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1)
	    return SendClientMessage(playerid, COLOR_GRAD1, "   У Вас недостаточно прав для того, чтобы использовать эту команду!");
	if(IsPlayerInAnyVehicle(playerid))
	{
	    SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
	    RepairVehicle(GetPlayerVehicleID(playerid));
	    SendClientMessage(playerid, COLOR_GREY, "   Машина починена!");
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

#define Loop(%1,%2) for(new %1;%1<=%2;%1++)

stock GetClosestCarInRadiusNearPlayer(playerid, Float:radius,bit=0)
{
    new cid;
	if(bit==1)cid=GetPlayerVehicleID(playerid);
	new Float:x, Float:y, Float:z, Float:vx, Float:vy, Float:vz, id = -1, Float:dist;
	GetPlayerPos(playerid, x, y, z);
	dist = radius+1;
	switch(bit)
	{
		case 0:
		{
			Loop(idx,2000)
			{
			    GetVehiclePos(idx, vx, vy, vz);
			    if(IsPlayerInRangeOfPoint(playerid, radius, vx, vy, vz))
			    {
			        new Float:distance = GetDistanceBetweenPoints(x,y,z,vx,vy,vz);
					if(dist > distance)
					{
						id = idx;
						dist = distance;
					}
			    }
			}
		}
		case 1:
		{
		    Loop(idx,2000)
			{
			    if(idx!=cid)
			    {
				    GetVehiclePos(idx, vx, vy, vz);
				    if(IsPlayerInRangeOfPoint(playerid, radius, vx, vy, vz))
				    {
				        new Float:distance = GetDistanceBetweenPoints(x,y,z,vx,vy,vz);
						if(dist > distance)
						{
							id = idx;
							dist = distance;
						}
				    }
			    }
			}
		}
	}
	return id;
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

enum magazineinfo
{
	magazineValid,
	magazineName[64],
	Float:magazineX,
	Float:magazineY,
	Float:magazineZ,
	magazineInt,
}
new MagazineInfo[MAX_MAGAZINE][magazineinfo];
new Text3D:MagazineLabel[MAX_MAGAZINE];
new MagazinePickup[MAX_MAGAZINE];
new MagazineIcon[MAX_MAGAZINE];
stock LoadMagazine(i)
{
	new query[255],Field[255];
	format(query,sizeof(query),"SELECT magazineName, magazineX, magazineY, magazineZ, magazineInt FROM magazines WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>s[64]fffi",
		MagazineInfo[i][magazineName],
		MagazineInfo[i][magazineX],
		MagazineInfo[i][magazineY],
		MagazineInfo[i][magazineZ],
		MagazineInfo[i][magazineInt]);
	    MagazineInfo[i][magazineValid]=1;
		MagazineLabel[i]=CreateDynamic3DTextLabel(MagazineInfo[i][magazineName], COLOR_GREEN, MagazineInfo[i][magazineX],MagazineInfo[i][magazineY],MagazineInfo[i][magazineZ], 15.0);
		MagazinePickup[i]=CreateDynamicPickup(19135,2,MagazineInfo[i][magazineX],MagazineInfo[i][magazineY],MagazineInfo[i][magazineZ]);
        MagazineIcon[i]=CreateDynamicMapIcon(MagazineInfo[i][magazineX],MagazineInfo[i][magazineY],MagazineInfo[i][magazineZ],38, -1,-1,-1, -1, 250.0);
	}
	else
	    MagazineInfo[i][magazineValid]=0;
	mysql_free_result();
	return 1;
}
stock MagazineInit()
{
    for(new i=0; i<MAX_MAGAZINE; i++)
        LoadMagazine(i);
	return 1;
}
stock SaveMagazine(i)
{
    if(MagazineInfo[i][magazineValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE magazines SET magazineName='%s', magazineX='%f', magazineY='%f', magazineZ='%f', magazineInt=%d WHERE id=%d",
		MagazineInfo[i][magazineName],
		MagazineInfo[i][magazineX],
		MagazineInfo[i][magazineY],
		MagazineInfo[i][magazineZ],
		MagazineInfo[i][magazineInt],
		i);
		mysql_query(query);
		DestroyDynamic3DTextLabel(MagazineLabel[i]);
		MagazineLabel[i]=CreateDynamic3DTextLabel(MagazineInfo[i][magazineName], COLOR_GREEN, MagazineInfo[i][magazineX],MagazineInfo[i][magazineY],MagazineInfo[i][magazineZ], 15.0);
		DestroyDynamicPickup(MagazinePickup[i]);
		MagazinePickup[i]=CreateDynamicPickup(19135,2,MagazineInfo[i][magazineX],MagazineInfo[i][magazineY],MagazineInfo[i][magazineZ]);
		DestroyDynamicMapIcon(MagazineIcon[i]);
        MagazineIcon[i]=CreateDynamicMapIcon(MagazineInfo[i][magazineX],MagazineInfo[i][magazineY],MagazineInfo[i][magazineZ],38, -1,-1,-1, -1, 250.0);
	}
	return 1;
}

stock CreateMagazine(playerid,interior,name[])
{
    for(new i=0; i<MAX_MAGAZINE; i++)
    {
        if(!MagazineInfo[i][magazineValid])
		{
		    new query[255];
		    GetPlayerPos(playerid,MagazineInfo[i][magazineX],
			MagazineInfo[i][magazineY],
			MagazineInfo[i][magazineZ]);
	    	format(query,sizeof(query),"INSERT INTO magazines SET id=%d, magazineName='%s', magazineX='%f', magazineY='%f', magazineZ='%f', magazineInt=%d",
			i,
			name,
			MagazineInfo[i][magazineX],
			MagazineInfo[i][magazineY],
			MagazineInfo[i][magazineZ],
			interior);
			mysql_query(query);
			LoadMagazine(i);
			return i;
		}
    }
	return 1;
}
enum magazineineriorinfo
{
	Float:miX,
	Float:miY,
	Float:miZ,
	miInt,
};
new MagazineInteriorInfo[][magazineineriorinfo]=
{
	{-25.884499,-185.868988,1003.549988,17}
};
COMMAND:magazinecreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new interior,name[64];
    if (sscanf(params, "is[64]",interior,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /magazinecreate [id интерьера] [название магазина]");
	if(interior>=sizeof(MagazineInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер магазина.");
	new i= CreateMagazine(playerid,interior,name);
	new str[255];
	format(str,sizeof(str),"Вы создали магазин %d, номер интерьера %d, название %s",i,interior,name);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:magazineshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowMagazine(playerid,0,29);
    return 1;
}

stock ShowMagazine(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_MAGAZINE; i++)
    {
        if(MagazineInfo[i][magazineValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%s\n",
            str,
            i,
        	MagazineInfo[i][magazineName]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список магазинов [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_MAGAZINELIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoMagazine(playerid,i)
{
	SetPlayerPos(playerid,MagazineInfo[i][magazineX],
	MagazineInfo[i][magazineY],
	MagazineInfo[i][magazineZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к магазину %d (%s)",i,MagazineInfo[i][magazineName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:magazinedelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /magazinedelete [id магазина]");
    MagazineInfo[i][magazineValid]=0;
    DestroyDynamic3DTextLabel(MagazineLabel[i]);
	DestroyDynamicPickup(MagazinePickup[i]);
	DestroyDynamicMapIcon(MagazineIcon[i]);
    format(str,sizeof(str),"DELETE FROM magazines WHERE id=%d",i);
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили магазин %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:magazinesetname(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,name[64];
    if (sscanf(params, "is[64]",i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /magazinesetname [id магазина] [название магазина]");
    format(MagazineInfo[i][magazineName],64,"%s",name);
	SaveMagazine(i);
    new str[255];
	format(str,sizeof(str),"Вы изменили название магазина %d, на %s",i,MagazineInfo[i][magazineName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:magazinesetint(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,interior;
    if (sscanf(params, "is[64]",i,interior))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /magazinesetint [id магазина] [интерьер]");
    if(interior>=sizeof(MagazineInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер магазина.");
    MagazineInfo[i][magazineInt]=interior;
	SaveMagazine(i);
    new str[255];
	format(str,sizeof(str),"Вы изменили название магазина %d, на %s",i,MagazineInfo[i][magazineInt]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}


COMMAND:buy(playerid,params[])
{
    if(PlayerInfo[playerid][pLocal]!=3)
        return SendClientMessage(playerid, COLOR_GRAD2, "Вы не в магазине.");
	new str[512],strm[6][64];
	new world=GetPlayerVirtualWorld(playerid);
	//new i = MagazineInfo[world][magazineInt];
	if(PlayerInfo[playerid][pCarRadarDetector])
		strm[0]="Уже есть";
	else
		strm[0]="Еще нет";
	if(PlayerInfo[playerid][pCarFuelTank])
		strm[1]="Уже есть";
	else
		strm[1]="Еще нет";
	if(PlayerInfo[playerid][pCarRadio])
		strm[2]="Уже есть";
	else
		strm[2]="Еще нет";
	if(PlayerInfo[playerid][pCarAdditive])
	    strm[3]="Уже есть";
	else
		strm[3]="Еще нет";
	if(PlayerInfo[playerid][pCarNeck])
	    strm[4]="Уже есть";
	else
		strm[4]="Еще нет";
	if(PlayerInfo[playerid][pCarDamper])
		strm[5]="Уже есть";
	else
	    strm[5]="Еще нет";
	format(str,sizeof(str),
	"[%s]Радар детектор[10000$]\n[%s]Дополнительный бензобак[20000$]\n[%s]Стационарная рация(больший радиус покрытия)[7000$]\n[%s]Присадка в двигатель [12000$]\n[%s]Спортивная горловина бензобака [15000$]\n[%s]Автоматический регулятор тяги [30000$]",
	strm[0],
	strm[1],
	strm[2],
	strm[3],
	strm[4],
	strm[5]);
    ShowPlayerDialog(playerid,DIALOG_BUY,DIALOG_STYLE_LIST,MagazineInfo[world][magazineName],str,"Выбрать","Отмена");
	return 1;
}

stock PlayerInMagazine(playerid,listitem)
{
	switch(listitem)
	{
	    case 0://радар
		{
		    if(oGetPlayerMoney(playerid)<10000)
		        return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Покупка","У вас недостаточно денег","Ок","");
		    oGivePlayerMoney(playerid,-10000);
		    PlayerInfo[playerid][pCarRadarDetector]=1;
		    Me(playerid, "купил радар-детектор",20.0);
		}
		case 1://дополнительный бензобак
		{
		    if(oGetPlayerMoney(playerid)<20000)
		        return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Покупка","У вас недостаточно денег","Ок","");
		    oGivePlayerMoney(playerid,-20000);
		    PlayerInfo[playerid][pCarFuelTank]=1;
		    Me(playerid, "купил дополнительный бензобак для своего грузовика",20.0);
		}
		case 2://рация
		{
		    if(oGetPlayerMoney(playerid)<7000)
		        return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Покупка","У вас недостаточно денег","Ок","");
		    oGivePlayerMoney(playerid,-7000);
		    PlayerInfo[playerid][pCarRadio]=1;
		    Me(playerid, "купил стационарную рацию для своего грузовика",20.0);
		}
		case 3://присадка
		{
		    if(oGetPlayerMoney(playerid)<12000)
		        return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Покупка","У вас недостаточно денег","Ок","");
		    oGivePlayerMoney(playerid,-12000);
		    PlayerInfo[playerid][pCarAdditive]=1;
		    Me(playerid, "купил присадку в двигатель для своего грузовика",20.0);
		}
		case 4://горловина бензобака
		{
		    if(oGetPlayerMoney(playerid)<15000)
		        return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Покупка","У вас недостаточно денег","Ок","");
		    oGivePlayerMoney(playerid,-15000);
		    PlayerInfo[playerid][pCarNeck]=1;
		    Me(playerid, "купил спортивную горловину бензобака для своего грузовика",20.0);
		}
		case 5:
		{
		    if(!PlayerInfo[playerid][pCarRadarDetector])
		        return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Покупка","Сначала купите радар детектор","Ок","");
			if(oGetPlayerMoney(playerid)<30000)
			    return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Покупка","У вас недостаточно денег","Ок","");
			oGivePlayerMoney(playerid,-30000);
			PlayerInfo[playerid][pCarDamper]=1;
			Me(playerid, "купил автоматический регулятор тяги для своего грузовика",20.0);
		}
	}
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
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы в долгах, и еще не можете приобрести никакой грузовик.");
	if(PlayerInfo[playerid][pPoints] < 50)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Магазин открывается после 50 очков доставки.");
    if(PlayerInfo[playerid][pDeliveryID]!=-1)
        return SendClientMessage(playerid, COLOR_GRAD2, "Нельзя купить новый грузовик во время доставки.");
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
					"{FFFFFF}Посредством кнопок {FFFF00}[NUM 4] {FFFFFF}и{FFFF00}[NUM 6]{FFFFFF} выберите грузовик\n\
					Закрепите результат с помощью кнопки {FFFF00}[Y]\n\
					{FFFFFF}Что бы выйти используйте кнопку {FFFF00}[N]\n\
					{FFFFFF}За ваш старый грузовик после покупки нового вы получили компинсацию(относительно его износа) - $");
					new pricestr[24];
					format(pricestr,24,"%d",price);
     			    strcat(str,pricestr);

     			    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Покупка нового грузовика",str,"Ок","");
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
			SendClientMessage(playerid, COLOR_GRAD2, "Вы слишком далеко от ближайшего магазина грузовиков.");
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
    			return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Выбор грузовика","У вас недостаточно очков, что бы преобрести данный грузовик","Ок","");
            }
			if(oGetPlayerMoney(playerid)<CarInfo[TruckChange[playerid]][carPrice])
			{
			    ExitShowPlayerTruck(playerid);
				return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Выбор грузовика","У вас недостаточно денег, что бы купить данный грузовик","Ок","");
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
			format(str,sizeof(str),"Вы купили грузовик %s\nЦена %d $\nЗа ваш старый грузовик вы выручили %d $",
			CarName[PlayerInfo[playerid][pCarModel]-400],
			CarInfo[TruckChange[playerid]][carPrice],
			price);
			ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Покупка грузовика",str,"Ок","");
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
	SetHelpDraw(playerid,"~b~trucker.valakas.ru ~r~/help");
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
        format(str,sizeof(str),"~b~trucker.valakas.ru ~r~/help             ~y~Mashina:~w~%s ~r~Budet dostupna posle %d ochkov dostavki",
        CarName[CarInfo[b][carModel]-400],
        CarInfo[b][carPoints]);
    }
    else
    {
	    format(str,sizeof(str),"~b~trucker.valakas.ru ~r~/help             ~y~Mashina:~w~%s ~y~Cena:~w~%d$ ~y~Vmestimost'(kg):~w~%d",
		CarName[CarInfo[b][carModel]-400],
		CarInfo[b][carPrice],
		CarInfo[b][carCapacity]);
	}
    SetHelpDraw(playerid,str);
	return 1;
}
//new PlayerConvoyCreater[MAX_PLAYERS];
//new PlayerConvoyID[MAX_PLAYERS] = { INVALID_PLAYER_ID, ... };
COMMAND:convoy(playerid,params[])
{
    if(PlayerInfo[playerid][pPoints] < 100)
	    return SendClientMessage(playerid, COLOR_GRAD2, "У вас недостаточно очков что бы создать, или присоеденится к конвою.");
	new str[255];
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
		return 1;
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
		return 1;
	}
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	foreach(Player,i)
	{
	    if(PlayerConvoyCreater[i])
	    {
		    if(IsPlayerInRangeOfPoint(i,150.0,x,y,z))
		    {
		        format(str,sizeof(str),"%s присоеденился к вашему конвою",
		        	GetPlayerNameEx(playerid));
		        foreach(Player,a)
				{
				    if(PlayerConvoyID[a]==i)
		        		SendClientMessage(a,COLOR_WHITE,str);
		        }
		        format(str,sizeof(str),"Вы присоеденились к конвою %s",
		        	GetPlayerNameEx(i));
		        SendClientMessage(playerid,COLOR_WHITE,str);
		        PlayerConvoyID[playerid]=i;
		        return 1;
		    }
	    }
	}
	PlayerConvoyCreater[playerid]=1;
	PlayerConvoyID[playerid]=playerid;
	format(str,sizeof(str),"Дальнобойщик %s создал конвой, ИСПОЛЬЗУЙТЕ: {FFFF00}/convoy {FFFFFF} что бы присоеденится.",
		GetPlayerNameEx(playerid));
	foreach(Player,a)
	{
	    if(!PlayerConvoyCreater[a] && PlayerConvoyID[a]==INVALID_PLAYER_ID)
	    {
	        SendClientMessage(a,COLOR_WHITE,str);
	    }
	}
	SendClientMessage(playerid,COLOR_WHITE,"Вы создали конвой, всем дальнобойщиком вне конвоев об этом сообщено");
	return 1;
}

stock CheckCountConvoy(playerid)
{
	new num;
	if(PlayerConvoyID[playerid]==INVALID_PLAYER_ID)return 0;
	foreach(Player,a)
	{
	    if(PlayerConvoyID[a]==PlayerConvoyID[playerid]&&a!=playerid)
			num++;
    }
	return num;
}

stock CheckConvoy(playerid)
{
    if(PlayerConvoyCreater[playerid])
		return 1;
    new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
    foreach(Player,a)
	{
	    if(PlayerConvoyID[a]==PlayerConvoyID[playerid])
	    {
	        if(IsPlayerInRangeOfPoint(playerid,150.0,x,y,z))
	        	return 1;
	    }
	}
	new str[255];
    format(str,sizeof(str),"%s потерял конвой",
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
	SendClientMessage(playerid,COLOR_WHITE,"Вы потеряли конвой");
    PlayerConvoyID[playerid]=INVALID_PLAYER_ID;
	return 1;
}

enum roadworkinfo
{
	roadworkValid,
	roadworkName[255],
	roadworkFileID,
	roadworkCreate,//не сохранять
	roadworkTime,//не сохранять
	Float:roadworkX,
	Float:roadworkY,
	Float:roadworkZ,
};
new RoadworkInfo[MAX_ROADWORKS][roadworkinfo];
new RoadworkObject[MAX_ROADWORKS][MAX_ROADWORK_OBJECT];
new RoadworkVehicle[MAX_ROADWORKS][MAX_ROADWORK_OBJECT];
stock LoadRoadwork(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT roadworkName, roadworkFileID FROM roadworks WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>s[255]i",
		RoadworkInfo[i][roadworkName],
        RoadworkInfo[i][roadworkFileID]);
		RoadworkInfo[i][roadworkValid]=1;
	}
	else
	    RoadworkInfo[i][roadworkValid]=0;
	mysql_free_result();
	return 1;
}
stock RoadworkInit()
{
    for(new i=0; i<MAX_ROADWORKS; i++)
        LoadRoadwork(i);
        
    LoadRandomRoadWorks();
    return 1;
}
stock SaveRoadwork(i)
{
	if(RoadworkInfo[i][roadworkValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE roadworks SET roadworkName='%s', roadworkFileID=%d WHERE id=%d",
		RoadworkInfo[i][roadworkName],
        RoadworkInfo[i][roadworkFileID],
		i);
		mysql_query(query);
	}
	return 1;
}
stock RoadworkCreate(id,name[])
{
    for(new i=0; i<MAX_ROADWORKS; i++)
    {
        if(!RoadworkInfo[i][roadworkValid])
		{
		    new query[255];
		    format(query,sizeof(query),"INSERT INTO roadworks SET roadworkName='%s', roadworkFileID=%d, id=%d",
		    name,
		    id,i);
		    mysql_query(query);
		    LoadRoadwork(i);
		    return i;
		}
    }
	return 1;
}
COMMAND:roadworkcreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new id,name[64];
    if(sscanf(params, "is[64]",id,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /roadworkcreate [ид файла] [название]");
    new i=RoadworkCreate(id,name);
    new str[255];
    format(str,sizeof(str),"Вы создали дорожные работы %d, id файла %d, название %s",i,id,RoadworkInfo[i][roadworkName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:roadworksetname(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,name[64];
    if(sscanf(params, "is[64]",i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /roadworksetname [id дорожных работ] [название]");
	format(RoadworkInfo[i][roadworkName],64,"%s",name);
	SaveRoadwork(i);
	new str[255];
    format(str,sizeof(str),"Вы установили дорожным работам %d, название %s",i,RoadworkInfo[i][roadworkName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:roadworkfile(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,id;
    if(sscanf(params, "ii",i,id))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /roadworkfile [id дорожных работ] [ид файла]");
    RoadworkInfo[i][roadworkFileID]=id;
    SaveRoadwork(i);
    if(RoadworkInfo[i][roadworkCreate])
    {
	    DeleteRoadObjects(i);
	    LoadRoadObjects(i);
    }
    new str[255];
    format(str,sizeof(str),"Вы установили дорожным работам %d, файл %d",i,RoadworkInfo[i][roadworkFileID]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:roadworkdelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i;
    if(sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /roadworkdelete [id дорожных работ]");
	new query[255];
	if(RoadworkInfo[i][roadworkCreate])
		DeleteRoadObjects(i);
	format(query,sizeof(query),"DELETE FROM roadworks WHERE id=%d",i);
	mysql_query(query);
	format(query,sizeof(query),"вы удалили дорожные работы %d",i);
	return 1;
}
COMMAND:roadworkshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowRoadwork(playerid,0,29);
    return 1;
}

stock ShowRoadwork(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_ROADWORKS; i++)
    {
        if(RoadworkInfo[i][roadworkValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%s\n",
            str,
            i,
        	RoadworkInfo[i][roadworkName]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список дорожных работ [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_ROADWORKLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}
stock GotoRoadwork(playerid,i)
{
	SetPlayerPos(playerid,RoadworkInfo[i][roadworkX],RoadworkInfo[i][roadworkY],RoadworkInfo[i][roadworkZ]);
	return 1;
}
new LoadedRoadWorks;
new RoadworkIcon[MAX_ROADWORKS];
forward LoadRoadObjects(i);
public LoadRoadObjects(i)
{
	new	string[255], File:file;
	format(string,sizeof(string),"Внимание! :{AA3333} %s",RoadworkInfo[i][roadworkName]);
	SendClientMessageToAll(COLOR_WHITE,string);
	new filestr[128];
	format(filestr,sizeof(filestr),"map/%d.txt",
	RoadworkInfo[i][roadworkFileID]);
	new o;
	new oid,Float:x,Float:y,Float:z,Float:rx,Float:ry,Float:rz;
	new col1,col2,time;
	file = fopen(filestr,io_read);
	new string1[255];
	new bit;
	new setpos;
	if(file)
	{
		while(fread(file,string))
		{
		    sscanf(string,"p<|>is[255]",bit,string1);
			switch(bit)
		    {
		        case 0://объект
		        {
				    sscanf(string1,"p<,>iffffff",
				    oid,
				    x,
				    y,
				    z,
				    rx,
				    ry,
				    rz);
				    if(!setpos)
		            {
						foreach(Player,p)
						{
						    if(IsPlayerInRangeOfPoint(p,60.0,x,y,z))
						    {
						        fclose(file);
						        return 1;
						    }
						}
		                RoadworkInfo[i][roadworkX]=x;
						RoadworkInfo[i][roadworkY]=y;
						RoadworkInfo[i][roadworkZ]=z;
						RoadworkIcon[i]=CreateDynamicMapIcon(RoadworkInfo[i][roadworkX],RoadworkInfo[i][roadworkY],RoadworkInfo[i][roadworkZ],11, -1,-1,-1, -1, 250.0);
						setpos=1;
				    }
				    RoadworkObject[i][o]=CreateDynamicObject(
				    oid,
				    x,
				    y,
				    z,
				    rx,
				    ry,
				    rz);
				}
				case 1:
				{
                    sscanf(string1,"p<,>iffffiii",
                    oid,
				    x,
				    y,
				    z,
				    rx,
				    col1,
				    col2,
				    time);
                    RoadworkVehicle[i][o]=CreateVehicle(
                    oid,
				    x,
				    y,
				    z,
				    rx,
				    col1,
				    col2,
				    time);
				    new engine,lights,alarm,doors,bonnet,boot,objective;
					GetVehicleParamsEx(RoadworkVehicle[i][o],engine,lights,alarm,doors,bonnet,boot,objective);
					SetVehicleParamsEx(RoadworkVehicle[i][o],VEHICLE_PARAMS_ON,VEHICLE_PARAMS_ON,VEHICLE_PARAMS_ON,VEHICLE_PARAMS_ON,bonnet,boot,objective);

				}
			}
			o++;
		}
		fclose(file);
	}
 	LoadedRoadWorks++;
	RoadworkInfo[i][roadworkCreate]=1;
	return 1;
}

stock DeleteRoadObjects(a)
{
	for(new i=0; i<MAX_ROADWORK_OBJECT; i++)
    {
        if(RoadworkObject[a][i]!=0)
        {
		    DestroyDynamicObject(RoadworkObject[a][i]);
		    RoadworkObject[a][i]=0;
	    }
	    if(RoadworkVehicle[a][i]!=0)
	    {
		    DestroyVehicle(RoadworkVehicle[a][i]);
		    RoadworkVehicle[a][i]=0;
	    }
	}
	LoadedRoadWorks--;
	DestroyDynamicMapIcon(RoadworkIcon[a]);
	RoadworkInfo[a][roadworkCreate]=0;
	RoadworkInfo[a][roadworkTime]=0;
	return 1;
}

stock LoadRandomRoadWorks()
{
	point:
	new bit;
	if(LoadedRoadWorks < MAX_LOADEDROADWORKS)
	{
		new a[MAX_ROADWORKS],b;
	    for(new i=0; i<MAX_ROADWORKS; i++)
	    {
	        if(RoadworkInfo[i][roadworkValid])
			{
			    if(!RoadworkInfo[i][roadworkCreate])
			    {
			        a[b]=i;
			        b++;
			    }
			}
		}
		if(!b)
			return 1;
		new d=a[random(b)];
		//LoadRoadObjects(d);
		new e=random(6);
		switch(e)
		{
			case 0:
        		RoadworkInfo[d][roadworkTime]=15;
            case 1:
        		RoadworkInfo[d][roadworkTime]=30;
            case 2:
        		RoadworkInfo[d][roadworkTime]=45;
            case 3:
        		RoadworkInfo[d][roadworkTime]=60;
            case 4:
        		RoadworkInfo[d][roadworkTime]=75;
            default:
        		RoadworkInfo[d][roadworkTime]=90;
        }
        bit++;
        if(bit > 1000)return 1;
        LoadRoadObjects(d);
		goto point;
	}
	return 1;
}
stock TimeRoadWorks()
{
    for(new i=0; i<MAX_ROADWORKS; i++)
    {
        if(RoadworkInfo[i][roadworkValid])
		{
			if(RoadworkInfo[i][roadworkCreate])
			{
			    RoadworkInfo[i][roadworkTime]--;
			    if(RoadworkInfo[i][roadworkTime]==0)
			    {
			        DeleteRoadObjects(i);
			        LoadRandomRoadWorks();
			        return 1;
			    }
		    }
		}
	}
	return 1;
}

enum officeinfo
{
	officeValid,
	officeName[64],
	officeOwned,
	officeOwner[MAX_PLAYER_NAME],
	officeCompany,
	Float:officeX,
	Float:officeY,
	Float:officeZ,
	officeInt,
	officeLocked,
	officePrice,
};
new OfficeInfo[MAX_OFFICE][officeinfo];
new Text3D:OfficeLabel[MAX_OFFICE];
new OfficePickup[MAX_OFFICE];
stock LoadOffice(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT officeName, officeOwned, officeOwner, officeCompany, officeX, officeY, officeZ, officeInt, officeLocked, officePrice FROM office WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>s[64]is[24]ifffii",
		OfficeInfo[i][officeName],
		OfficeInfo[i][officeOwned],
		OfficeInfo[i][officeOwner],
		OfficeInfo[i][officeCompany],
		OfficeInfo[i][officeX],
		OfficeInfo[i][officeY],
		OfficeInfo[i][officeZ],
		OfficeInfo[i][officeInt],
		OfficeInfo[i][officeLocked],
		OfficeInfo[i][officePrice]);
		OfficeInfo[i][officeValid]=1;
		OfficeLabel[i]=CreateDynamic3DTextLabel(OfficeInfo[i][officeName], COLOR_GREEN, OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ], 15.0);
		OfficePickup[i]=CreateDynamicPickup(19135,2,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]);
	}
	else
	    OfficeInfo[i][officeValid]=0;
	mysql_free_result();
	return 1;
}
stock OfficeInit()
{
    for(new i=0; i<MAX_OFFICE; i++)
        LoadOffice(i);
    return 1;
}
stock SaveOffice(i)
{
	if(OfficeInfo[i][officeValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE office SET officeName='%s', officeOwned=%d, officeOwner='%s', officeCompany=%d, officeX='%f', officeY='%f', officeZ='%f', officeInt=%d, officeLocked=%d, officePrice=%d WHERE id=%d",
		OfficeInfo[i][officeName],
		OfficeInfo[i][officeOwned],
		OfficeInfo[i][officeOwner],
		OfficeInfo[i][officeCompany],
		OfficeInfo[i][officeX],
		OfficeInfo[i][officeY],
		OfficeInfo[i][officeZ],
		OfficeInfo[i][officeInt],
		OfficeInfo[i][officeLocked],
		OfficeInfo[i][officePrice],
		i);
		mysql_query(query);
		DestroyDynamic3DTextLabel(OfficeLabel[i]);
		DestroyDynamicPickup(OfficePickup[i]);
		OfficeLabel[i]=CreateDynamic3DTextLabel(OfficeInfo[i][officeName], COLOR_GREEN, OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ], 15.0);
		OfficePickup[i]=CreateDynamicPickup(19135,2,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]);

	}
	return 1;
}

stock CreateOffice(playerid,interior,name[],price)
{
    for(new i=0; i<MAX_OFFICE; i++)
    {
        if(!OfficeInfo[i][officeValid])
		{
		    new query[255];
		    GetPlayerPos(playerid,OfficeInfo[i][officeX],
			OfficeInfo[i][officeY],
			OfficeInfo[i][officeZ]);
	    	format(query,sizeof(query),"INSERT INTO office SET id=%d, officeName='%s', officeX='%f', officeY='%f', officeZ='%f', officeInt=%d, officePrice=%d",
			i,
			name,
			OfficeInfo[i][officeX],
			OfficeInfo[i][officeY],
			OfficeInfo[i][officeZ],
			interior,
			price);
			mysql_query(query);
			LoadOffice(i);
			return i;
		}
    }
	return 1;
}
enum officeineriorinfo
{
	Float:oiX,
	Float:oiY,
	Float:oiZ,
	oiInt,
};
new OfficeInteriorInfo[][officeineriorinfo]=
{
	{0.0,0.0,0.0,0}
};
COMMAND:officecreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new interior,price,name[64];
    if (sscanf(params, "iis[64]",interior,price,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /officecreate [id интерьера] [цена] [название офиса]");
	if(interior>=sizeof(OfficeInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер офиса.");
	new i= CreateOffice(playerid,interior,name,price);
	new str[255];
	format(str,sizeof(str),"Вы создали офис %d, номер интерьера %d, название %s",i,interior,name);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:officeshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowOffice(playerid,0,29);
    return 1;
}

stock ShowOffice(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_OFFICE; i++)
    {
        if(OfficeInfo[i][officeValid])
        {
            if(i>endid)break;
            format(str,sizeof(str),"%s%d|%s\n",
            str,
            i,
        	OfficeInfo[i][officeName]);
		    bit=i;
        }
    }
    format(str,sizeof(str),"%s%d|next",str,bit);
	new strm[255];
	format(strm,sizeof(strm),"Список офисов [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_OFFICELIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoOffice(playerid,i)
{
	SetPlayerPos(playerid,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к офису %d (%s)",i,OfficeInfo[i][officeName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:officedelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /officedelete [id офиса]");
    OfficeInfo[i][officeValid]=0;
    DestroyDynamic3DTextLabel(OfficeLabel[i]);
	DestroyDynamicPickup(OfficePickup[i]);
    format(str,sizeof(str),"DELETE FROM office WHERE id=%d",i);
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили офис %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:officesetname(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,name[64];
    if (sscanf(params, "is[64]",i,name))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /officesetname [id офиса] [название офиса]");
    format(OfficeInfo[i][officeName],64," %s",name);
	SaveOffice(i);
    new str[255];
	format(str,sizeof(str),"Вы изменили название офиса %d, на %s",i,OfficeInfo[i][officeName]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
COMMAND:officesetint(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,interior;
    if (sscanf(params, "ii",i,interior))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /officesetint [id офиса] [интерьер]");
    if(interior>=sizeof(OfficeInteriorInfo))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Не существующий интерьер офиса.");
    OfficeInfo[i][officeInt]=interior;
	SaveFood(i);
    new str[255];
	format(str,sizeof(str),"Вы изменили название офиса %d, на %s",i,OfficeInfo[i][officeInt]);
	SendClientMessage(playerid, COLOR_GRAD2, str);
    return 1;
}
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
		    for(new i=0; i<MAX_HOTEL; i++)
	    	{
		        if(HotelInfo[i][hotelValid])
				{
				    if(IsPlayerInRangeOfPoint(playerid,2.0,HotelInfo[i][hotelEnX],HotelInfo[i][hotelEnY],HotelInfo[i][hotelEnZ]))
					{
					    PlayerInfo[playerid][pLocal]=1;
					    SetPlayerPos(playerid,HotelInteriorInfo[HotelInfo[i][hotelInt]][hiX],
					    HotelInteriorInfo[HotelInfo[i][hotelInt]][hiY],
					    HotelInteriorInfo[HotelInfo[i][hotelInt]][hiZ]);
					    SetPlayerInterior(playerid,HotelInteriorInfo[HotelInfo[i][hotelInt]][hiInt]);
					    SetPlayerVirtualWorld(playerid,i);
					    SendClientMessage(playerid,COLOR_WHITE," ИСПОЛЬЗУЙТЕ: {FFFF00}/hotel - {FFFFFF}чтобы отдохнуть.");
					    return 1;
					}
				}
		    }
		    for(new i=0; i<MAX_FOOD; i++)
		    {
		        if(FoodInfo[i][foodValid])
				{
				    if(IsPlayerInRangeOfPoint(playerid,2.0,FoodInfo[i][foodEnX],FoodInfo[i][foodEnY],FoodInfo[i][foodEnZ]))
					{
					    PlayerInfo[playerid][pLocal]=2;
					    SetPlayerPos(playerid,FoodInteriorInfo[FoodInfo[i][foodInt]][fiX],
					    FoodInteriorInfo[FoodInfo[i][foodInt]][fiY],
					    FoodInteriorInfo[FoodInfo[i][foodInt]][fiZ]);
					    SetPlayerInterior(playerid,FoodInteriorInfo[FoodInfo[i][foodInt]][fiInt]);
					    SetPlayerVirtualWorld(playerid,i);
					    SendClientMessage(playerid,COLOR_WHITE," ИСПОЛЬЗУЙТЕ: {FFFF00}/food - {FFFFFF}чтобы купить что-либо поесть.");
					    return 1;
					}
				}
			}
			for(new i=0; i<MAX_MAGAZINE; i++)
	    	{
		        if(MagazineInfo[i][magazineValid])
				{
				    if(IsPlayerInRangeOfPoint(playerid,2.0,MagazineInfo[i][magazineX],MagazineInfo[i][magazineY],MagazineInfo[i][magazineZ]))
					{
					    PlayerInfo[playerid][pLocal]=3;
					    SetPlayerPos(playerid,MagazineInteriorInfo[MagazineInfo[i][magazineInt]][miX],
					    MagazineInteriorInfo[MagazineInfo[i][magazineInt]][miY],
					    MagazineInteriorInfo[MagazineInfo[i][magazineInt]][miZ]);
					    SetPlayerInterior(playerid,MagazineInteriorInfo[MagazineInfo[i][magazineInt]][miInt]);
					    SetPlayerVirtualWorld(playerid,i);
					    SendClientMessage(playerid,COLOR_WHITE," ИСПОЛЬЗУЙТЕ: {FFFF00}/buy - {FFFFFF}чтобы купить что-либо.");
					    return 1;
					}
				}
			}
			for(new i=0; i<MAX_OFFICE; i++)
	    	{
		        if(OfficeInfo[i][officeValid])
				{
				    if(IsPlayerInRangeOfPoint(playerid,2.0,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]))
					{
					    PlayerInfo[playerid][pLocal]=4;
					    SetPlayerPos(playerid,OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiX],
					    OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiY],
					    OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiZ]);
					    SetPlayerInterior(playerid,OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiInt]);
					    SetPlayerVirtualWorld(playerid,i);
					    return 1;
					}
				}
			}
	    }
	    case 1://в отеле
		{
			new i=GetPlayerVirtualWorld(playerid);
		    if(IsPlayerInRangeOfPoint(playerid,2.0,HotelInteriorInfo[HotelInfo[i][hotelInt]][hiX],
		    HotelInteriorInfo[HotelInfo[i][hotelInt]][hiY],
		    HotelInteriorInfo[HotelInfo[i][hotelInt]][hiZ]))
			{
			    PlayerInfo[playerid][pLocal]=-1;
			    SetPlayerPos(playerid,HotelInfo[i][hotelEnX],HotelInfo[i][hotelEnY],HotelInfo[i][hotelEnZ]);
			    SetPlayerInterior(playerid,0);
			    SetPlayerVirtualWorld(playerid,0);
			    return 1;
			}
		}
		case 2://в забегаловке
		{
		    new i=GetPlayerVirtualWorld(playerid);
		    if(IsPlayerInRangeOfPoint(playerid,2.0,FoodInteriorInfo[FoodInfo[i][foodInt]][fiX],
		    FoodInteriorInfo[FoodInfo[i][foodInt]][fiY],
		    FoodInteriorInfo[FoodInfo[i][foodInt]][fiZ]))
			{
			    PlayerInfo[playerid][pLocal]=-1;
			    SetPlayerPos(playerid,FoodInfo[i][foodEnX],FoodInfo[i][foodEnY],FoodInfo[i][foodEnZ]);
			    SetPlayerInterior(playerid,0);
			    SetPlayerVirtualWorld(playerid,0);
			    return 1;
			}
		}
		case 3://в магазине
		{
		    new i=GetPlayerVirtualWorld(playerid);
		    if(IsPlayerInRangeOfPoint(playerid,2.0,MagazineInteriorInfo[MagazineInfo[i][magazineInt]][miX],
		    MagazineInteriorInfo[MagazineInfo[i][magazineInt]][miY],
		    MagazineInteriorInfo[MagazineInfo[i][magazineInt]][miZ]))
			{
			    PlayerInfo[playerid][pLocal]=-1;
			    SetPlayerPos(playerid,MagazineInfo[i][magazineX],MagazineInfo[i][magazineY],MagazineInfo[i][magazineZ]);
			    SetPlayerInterior(playerid,0);
			    SetPlayerVirtualWorld(playerid,0);
			    return 1;
			}
		}
		case 4://в офисе
		{
		    new i=GetPlayerVirtualWorld(playerid);
		    if(IsPlayerInRangeOfPoint(playerid,2.0,OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiX],
		    OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiY],
		    OfficeInteriorInfo[OfficeInfo[i][officeInt]][oiZ]))
			{
			    PlayerInfo[playerid][pLocal]=-1;
			    SetPlayerPos(playerid,OfficeInfo[i][officeX],OfficeInfo[i][officeY],OfficeInfo[i][officeZ]);
			    SetPlayerInterior(playerid,0);
			    SetPlayerVirtualWorld(playerid,0);
			    return 1;
			}
		}
	}
	return 1;
}


enum companyinfo
{
	companyValid,
	companyOwner[MAX_PLAYER_NAME],
	companyName[64],
	companyOfficeID,
	companyBank,
};
new CompanyInfo[MAX_COMPANY][companyinfo];
stock LoadCompany(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT companyOwner, companyName, companyOfficeID, companyBank FROM company WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>s[24]s[64]i",
		CompanyInfo[i][companyOwner],
		CompanyInfo[i][companyName],
		CompanyInfo[i][companyOfficeID],
		CompanyInfo[i][companyBank]);
		CompanyInfo[i][companyValid]=1;
	}
	else
	    CompanyInfo[i][companyValid]=0;
	mysql_free_result();
	return 1;
}
stock CompanyInit()
{
    for(new i=0; i<MAX_COMPANY; i++)
        LoadCompany(i);
    return 1;
}
stock SaveCompany(i)
{
	if(CompanyInfo[i][companyValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE company SET companyOwner='%s', companyName='%s', companyOfficeID=%d, companyBank=%d WHERE id=%d",
		CompanyInfo[i][companyOwner],
		CompanyInfo[i][companyName],
		CompanyInfo[i][companyOfficeID],
		CompanyInfo[i][companyBank],
		i);
		mysql_query(query);
	}
	return 1;
}

stock CreateCompany(playerid,name[])
{
    for(new i=0; i<MAX_COMPANY; i++)
    {
        if(!CompanyInfo[i][companyValid])
		{
		    new query[255];
	    	format(query,sizeof(query),"INSERT INTO company SET companyOwner='%s', companyName='%s', companyOfficeID=%d, id=%d",
			oGetPlayerName(playerid),
			name,
			-1,
			i);
			mysql_query(query);
			LoadCompany(i);
			return i;
		}
    }
	return 1;
}
COMMAND:opencompany(playerid,params[])
{
	if(PlayerInfo[playerid][pPoints] < 1000)
	    return SendClientMessage(playerid, COLOR_GRAD2, "У вас недостаточно очков доставки что бы открыть компанию (требуется 1000 и выше).");
	new name[64];
	if(sscanf(params,"s[64]",name))
	    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /opencompany [название компании] (открытие компании стоит 1000000 $)");
	if(oGetPlayerMoney(playerid) < 1000000)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Открытие компании стоит 1000000 $");
	new i=CreateCompany(playerid,name);
	oGivePlayerMoney(playerid,-1000000);
	PlayerInfo[playerid][pCompany]=i;
	new str[255];
	format(str,sizeof(str),"Вы открыли компанию %s (%d)",
	CompanyInfo[i][companyName],
	i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
COMMAND:closecompany(playerid,params[])
{
    if(PlayerInfo[playerid][pCompany]==-1)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не состоите не в какой компании.");
	if(strcmp(CompanyInfo[PlayerInfo[playerid][pCompany]][companyOwner],oGetPlayerName(playerid), true ) == 0 )
	{
	    new str[255];
	    format(str,sizeof(str),"UPDATE players SET pCompany='-1', pCompanyTime=0 WHERE online=0 AND pCompany=%d",
	    PlayerInfo[playerid][pCompany]);
	    mysql_query(str);
	    foreach(Player,i)
		{
		    if(PlayerInfo[i][pCompany]==PlayerInfo[playerid][pCompany])
			{
			    PlayerInfo[playerid][pCompany]=0;
			    PlayerInfo[playerid][pCompanyTime]=0;
			    SendClientMessage(i,COLOR_WHITE,"Ваша компания закрылась, все дальнобойщики уволены");
			}
		}
		return 1;
	}
	else
	    SendClientMessage(playerid, COLOR_GRAD2, "Вы не являетесь главой никакой компании.");
	return 1;
}
COMMAND:invite(playerid,params[])
{
	if(PlayerInfo[playerid][pCompany]==-1)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не состоите не в какой компании.");
	if(strcmp(CompanyInfo[PlayerInfo[playerid][pCompany]][companyOwner],oGetPlayerName(playerid), true ) == 0 )
	{
		if(CheckCompanyMembersNum(PlayerInfo[playerid][pCompany]) == CheckCompanyMaxMembers(playerid))
            return SendClientMessage(playerid, COLOR_GRAD2, "В вашей компании на данный момент максимальное количество сотрудников.");
		new giveplayerid;
		if(sscanf(params,"u",giveplayerid))
		    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /invite [ID игрока/часть имени]");
		if(PlayerInfo[giveplayerid][pCompany]!=-1)
		    return SendClientMessage(playerid, COLOR_GRAD2, "Игрок уже нанят какой-то компанией.");
        InviteOffer[playerid]=giveplayerid;
        InviteOffer[giveplayerid]=playerid;
        new str[512];
        format(str,sizeof(str),"{FFFFFF}%s пригласил вас работать в компанию %s.\nПримерное время заключаемого контраката %d часов.\nПриемущества работы в компании:\nЗа каждую доставку вы получаете 10 процентный бонус к доставке.\nЗа каждую вашу доставку, компания получает дополнительные 5 процентов от вашей прибыли.",
		GetPlayerNameEx(playerid),
		CompanyInfo[PlayerInfo[playerid][pCompany]][companyName],
		PlayerInfo[playerid][pPoints]/60);
		ShowPlayerDialog(giveplayerid,DIALOG_INVITE,DIALOG_STYLE_MSGBOX,"Предложение работы",str,"{33AA33}[Принять]", "{AA3333}[Отклонить]");
		format(str,sizeof(str),"Вы предложили работу %s",GetPlayerNameEx(giveplayerid));
		SendClientMessage(playerid,COLOR_WHITE,str);
		//устал
	}
	else
	    SendClientMessage(playerid, COLOR_GRAD2, "Вы не являетесь главой никакой компании.");
	return 1;
}

stock CheckCompanyMembersNum(i)
{
	new num;
	new str[255];
	format(str,sizeof(str),"SELECT id FROM players WHERE pCompany=%d",i);
    mysql_query(str);
    mysql_store_result();
	num=mysql_num_rows();
	mysql_free_result();
	return num;
}
stock CheckCompanyMaxMembers(playerid)
{
	new num=PlayerInfo[playerid][pPoints]/500;
	return num;
}

stock AcceptInvite(playerid)
{
	new giveplayerid=InviteOffer[playerid];
    PlayerInfo[playerid][pCompanyTime]=PlayerInfo[giveplayerid][pPoints];
    PlayerInfo[playerid][pCompany]=PlayerInfo[giveplayerid][pCompany];
	new str[255];
	format(str,sizeof(str),"%s принял ваше предложение работы, время контракта %d часов",
		GetPlayerNameEx(playerid),
		PlayerInfo[playerid][pCompanyTime]/60
	);
    ShowPlayerDialog(giveplayerid,0,DIALOG_STYLE_MSGBOX,"Предложение работы",str,"Ок","");
    format(str,sizeof(str),"Вы приняли предложение, теперь вы работаете на компанию %s\nВремя контракта %d часов",
	    CompanyInfo[PlayerInfo[playerid][pCompany]][companyName],
		PlayerInfo[playerid][pCompanyTime]/60
	);
	ShowPlayerDialog(giveplayerid,0,DIALOG_STYLE_MSGBOX,"Предложение работы",str,"Ок","");
	InviteOffer[playerid]=INVALID_PLAYER_ID;
    InviteOffer[giveplayerid]=INVALID_PLAYER_ID;
	return 1;
}
stock CancelInvite(playerid)
{
    new giveplayerid=InviteOffer[playerid];
	new str[255];
    format(str,sizeof(str),"%s отклонил ваше предложение работы",
		GetPlayerNameEx(playerid)
	);
    ShowPlayerDialog(giveplayerid,0,DIALOG_STYLE_MSGBOX,"Предложение работы",str,"Ок","");
    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Предложение работы","Вы отклонили предложение работы","Ок","");
    InviteOffer[playerid]=INVALID_PLAYER_ID;
    InviteOffer[giveplayerid]=INVALID_PLAYER_ID;
	return 1;
}

stock UpdateCompanys()
{
	foreach(Player,i)
	{
	    if(PlayerInfo[i][pCompanyTime]>0)
	        PlayerInfo[i][pCompanyTime]--;
	}
	mysql_query("UPDATE players SET 'pCompanyTime'-- WHERE pCompanyTime>0 AND online=0");
	mysql_query("UPDATE players SET pCompany='-1' WHERE pCompanyTime=0 AND online=0 AND pCompany!='-1'");
	return 1;
}
COMMAND:companywithdraw(playerid,params[])
{
    if(!IsPlayerInAtm(playerid))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не у банкомата");
    if(PlayerInfo[playerid][pCompany]==-1)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не состоите не в какой компании.");
	if(strcmp(CompanyInfo[PlayerInfo[playerid][pCompany]][companyOwner],oGetPlayerName(playerid), true ) == 0 )
	{
	    new money, str[255];
		if(sscanf(params,"i",money))
		{
		    format(str,sizeof(str)," ИСПОЛЬЗУЙТЕ: /companywithdraw [сумма] (всего на счету %d $)",money);
		    return SendClientMessage(playerid, COLOR_GRAD2, str);
		}
		if(money < 1 || money > CompanyInfo[PlayerInfo[playerid][pCompany]][companyBank])
		    return SendClientMessage(playerid, COLOR_GRAD2, "Нет столько денег.");
		CompanyInfo[PlayerInfo[playerid][pCompany]][companyBank]-=money;
		oGivePlayerMoney(playerid,money);
		format(str,sizeof(str),"Вы сняли со счета компании %d $",money);
		SendClientMessage(playerid,COLOR_WHITE,str);
		SaveCompany(PlayerInfo[playerid][pCompany]);
		return 1;
	}
	else
	    SendClientMessage(playerid, COLOR_GRAD2, "Вы не являетесь главой никакой компании.");
	return 1;
}
COMMAND:companybank(playerid,params[])
{
    if(!IsPlayerInAtm(playerid))
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не у банкомата");
    if(PlayerInfo[playerid][pCompany]==-1)
	    return SendClientMessage(playerid, COLOR_GRAD2, "Вы не состоите не в какой компании.");
	if(strcmp(CompanyInfo[PlayerInfo[playerid][pCompany]][companyOwner],oGetPlayerName(playerid), true ) == 0 )
	{
	    new money, str[255];
		if(sscanf(params,"i",money))
		    return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /companybank [сумма]");
		if(money < 1 || money > oGetPlayerMoney(playerid))
		    return SendClientMessage(playerid, COLOR_GRAD2, "Нет столько денег.");
		CompanyInfo[PlayerInfo[playerid][pCompany]][companyBank]+=money;
		oGivePlayerMoney(playerid,-money);
		format(str,sizeof(str),"Вы сняли со счета компании %d $",money);
		SendClientMessage(playerid,COLOR_WHITE,str);
		SaveCompany(PlayerInfo[playerid][pCompany]);
		return 1;
	}
	else
	    SendClientMessage(playerid, COLOR_GRAD2, "Вы не являетесь главой никакой компании.");
	return 1;
}
#define MAX_ATM 32
enum atminfo
{
	atmValid,
	Float:atmX,
	Float:atmY,
	Float:atmZ,
	Float:atmRot,
	atmObject,//не сохранять
	atmIcon//не сохранять
};
new AtmInfo[MAX_ATM][atminfo];

stock LoadAtm(i)
{
    new query[255],Field[255];
	format(query,sizeof(query),"SELECT atmX, atmY, atmZ, atmRot FROM atm WHERE id=%d",i);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field))
	{
		sscanf(Field,"p<|>ffff",
		AtmInfo[i][atmX],
		AtmInfo[i][atmY],
		AtmInfo[i][atmZ],
		AtmInfo[i][atmRot]);
		AtmInfo[i][atmValid]=1;
		AtmInfo[i][atmObject] = CreateDynamicObject(2942,AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ],0.0,0.0,AtmInfo[i][atmRot]);
		AtmInfo[i][atmIcon] = CreateDynamicMapIcon(AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ], 52, -1,-1,-1, -1, 250.0);
	}
	else
	    AtmInfo[i][atmValid]=0;
	mysql_free_result();
	return 1;
}
stock AtmInit()
{
    for(new i=0; i<MAX_ATM; i++)
        LoadAtm(i);
    return 1;
}
stock SaveAtm(i)
{
	if(AtmInfo[i][atmValid])
	{
	    new query[255];
	    format(query,sizeof(query),"UPDATE atm SET atmX='%f', atmY='%f', atmZ='%f', atmRot='%f' WHERE id=%d",
		AtmInfo[i][atmX],
		AtmInfo[i][atmY],
		AtmInfo[i][atmZ],
		AtmInfo[i][atmRot],
		i);
		mysql_query(query);
		DestroyDynamicObject(AtmInfo[i][atmObject]);
		DestroyDynamicMapIcon(AtmInfo[i][atmIcon]);
		AtmInfo[i][atmObject] = CreateDynamicObject(2942,AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ],0.0,0.0,AtmInfo[i][atmRot]);
		AtmInfo[i][atmIcon] = CreateDynamicMapIcon(AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ], 52, -1,-1,-1, -1, 250.0);
	}
	return 1;
}

stock CreateAtm(playerid)
{
    for(new i=0; i<MAX_ATM; i++)
    {
        if(!AtmInfo[i][atmValid])
		{
		    new query[255];
		    new Float:pos[4];
		    GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
		    GetPlayerFacingAngle(playerid,pos[3]);
	    	format(query,sizeof(query),"INSERT INTO atm SET atmX='%f', atmY='%f', atmZ='%f', atmRot='%f', id=%d",
			pos[0],
			pos[1],
			pos[2]-0.5,
			pos[3],
			i);
			mysql_query(query);
			LoadAtm(i);
			return i;
		}
    }
	return 1;
}
COMMAND:atmcreate(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
	new i= CreateAtm(playerid);
	new str[255];
	format(str,sizeof(str),"Вы создали банкомат %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:atmshow(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    ShowAtm(playerid,0,29);
    return 1;
}

stock ShowAtm(playerid,startid,endid)
{
	new str[2048],bit;
	for(new i=startid; i<MAX_ATM; i++)
    {
        if(AtmInfo[i][atmValid])
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
	format(strm,sizeof(strm),"Список забегаловок [%d - %d]",startid,endid);
    ShowPlayerDialog(playerid,DIALOG_ATMLIST,DIALOG_STYLE_LIST,strm,str,"Выбор","Выход");
	return 1;
}

stock GotoAtm(playerid,i)
{
	SetPlayerPos(playerid,AtmInfo[i][atmX],
	AtmInfo[i][atmY],
	AtmInfo[i][atmZ]);
	new str[255];
	format(str,sizeof(str),"Вы телепортированны к банкомату %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}

COMMAND:atmdelete(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]<1)return 1;
    new i,str[255];
    if (sscanf(params, "i",i))
    	return SendClientMessage(playerid, COLOR_GRAD2, " ИСПОЛЬЗУЙТЕ: /atmdelete [id банкомата]");
   	AtmInfo[i][atmValid]=0;
    DestroyDynamicObject(AtmInfo[i][atmObject]);
	DestroyDynamicMapIcon(AtmInfo[i][atmIcon]);
    format(str,sizeof(str),"DELETE FROM atm WHERE id=%d",i);
    mysql_query(str);
	format(str,sizeof(str),"Вы удалили банкомат %d",i);
	SendClientMessage(playerid, COLOR_GRAD2, str);
	return 1;
}
stock IsPlayerInAtm(playerid)
{
    for(new i=0; i<MAX_ATM; i++)
    {
        if(AtmInfo[i][atmValid])
        {
	        if(IsPlayerInRangeOfPoint(playerid,3.0,AtmInfo[i][atmX],AtmInfo[i][atmY],AtmInfo[i][atmZ]))
		    	return 1;
        }
    }
    return 0;
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

COMMAND:animlist(playerid,params[])
{
    SendClientMessage(playerid,0xAFAFAFAA," Доступные анимации:");
    SendClientMessage(playerid,0xAFAFAFAA," /handsup /bomb /getarrested /lookout /robman /crossarms /slapass /lay /hide /vomit");
    SendClientMessage(playerid,0xAFAFAFAA," /eata /wave /taichi /deal /crack /groundsit /chat /dance /piss /animcar");
    SendClientMessage(playerid,0xAFAFAFAA," /akick /laugh /spray /medic /bat /lifejump /exhaust /leftslap /box");
    SendClientMessage(playerid,0xAFAFAFAA," /chant /cop /fstance /knifeped /shoutloop /wtchrace /kiss /smoke /lean /seat");
    SendClientMessage(playerid,0xAFAFAFAA," /gangs /gsigns /ncrack /cry /rap /bar");
	return 1;
}

//=======================================
COMMAND:handsup(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
    return 1;
}
COMMAND:getarrested(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		LoopingAnim(playerid,"ped", "ARRESTgun", 4.0, 0, 1, 1, 1, -1); // Gun Arrest
	return 1;
}
COMMAND:bomb(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0); // Place Bomb
	return 1;
}
COMMAND:lookout(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0); // Rob Lookout
	return 1;
}
COMMAND:crossarms(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		LoopingAnim(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1); // Arms crossed
	return 1;
}
COMMAND:groundsit(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0); // Sit
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:gro(playerid,params[])
	return cmd_groundsit(playerid,params);
COMMAND:lay(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0); // Lay down
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:robman(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0); // Rob
		PlayerAnim[playerid]=1;
    }
	return 1;
}
COMMAND:hide(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0); // Taking Cover
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:vomit(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0); // Vomit BAH!
	return 1;
}
COMMAND:eata(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0); // Eat Burger
	return 1;
}
COMMAND:wave(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		LoopingAnim(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0); // Wave
	return 1;
}
COMMAND:slapass(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0); // Ass Slapping
	return 1;
}
COMMAND:deal(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0); // Deal Drugs
	return 1;
}
COMMAND:crack(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0); // Dieing of Crack
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:chat(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		 OnePlayAnim(playerid,"PED","IDLE_CHAT",4.0,0,0,0,0,0);
	return 1;
}
COMMAND:taichi(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"PARK","Tai_Chi_Loop",4.0,1,0,0,0,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
//=========================New Animations=========================
COMMAND:akick(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid,"POLICE","Door_Kick",4.0,0,0,0,0,0);
	return 1;
}
COMMAND:laugh(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0); // Laugh
	return 1;
}
COMMAND:spray(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid,"SPRAYCAN","spraycan_full",4.0,0,0,0,0,0);
	return 1;
}
COMMAND:medic(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid,"MEDIC","CPR",4.0,0,0,0,0,0);
	return 1;
}
COMMAND:bat(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		if(isnull(params))
			return SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /bat [1-2]");
		new animationplayed = strval(params);
		switch(animationplayed)
		{
			case 1:
				LoopingAnim(playerid,"CRACK","Bbalbat_Idle_01",4.1,0,1,1,1,1);
			case 2:
				LoopingAnim(playerid,"CRACK","Bbalbat_Idle_02",4.1,0,1,1,1,1);
			default: SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /bat [1-2]");
		}
	}
	return 1;
}
COMMAND:cry(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"GRAVEYARD","mrnF_loop",4.1,0,1,1,1,1);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:gsigns(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		if(isnull(params))
			return SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /gsigns [1-10]");
		new animationplayed = strval(params);
		switch(animationplayed)
		{
			case 1:
				LoopingAnim(playerid,"GHANDS","gsign1",4.1,0,1,1,1,1);
			case 2:
				LoopingAnim(playerid,"GHANDS","gsign1LH",4.1,0,1,1,1,1);
			case 3:
				LoopingAnim(playerid,"GHANDS","gsign2",4.1,0,1,1,1,1);
			case 4:
				LoopingAnim(playerid,"GHANDS","gsign2LH",4.1,0,1,1,1,1);
			case 5:
				LoopingAnim(playerid,"GHANDS","gsign3",4.1,0,1,1,1,1);
			case 6:
				LoopingAnim(playerid,"GHANDS","gsign3LH",4.1,0,1,1,1,1);
			case 7:
				LoopingAnim(playerid,"GHANDS","gsign4",4.1,0,1,1,1,1);
			case 8:
				LoopingAnim(playerid,"GHANDS","gsign4LH",4.1,0,1,1,1,1);
			case 9:
				LoopingAnim(playerid,"GHANDS","gsign5",4.1,0,1,1,1,1);
			case 10:
				LoopingAnim(playerid,"GHANDS","gsign5LH",4.1,0,1,1,1,1);
			default: return SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /gsigns [1-10]");
		}
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:ncrack(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		if(isnull(params))
			return SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /ncrack [1-7]");
		new animationplayed = strval(params);
		switch(animationplayed)
		{
			case 1:
				LoopingAnim(playerid,"CRACK","crckdeth1",4.1,0,1,1,1,1);
			case 2:
				LoopingAnim(playerid,"CRACK","crckdeth2",4.1,0,1,1,1,1);
			case 3:
				LoopingAnim(playerid,"CRACK","crckdeth3",4.1,0,1,1,1,1);
			case 4:
				LoopingAnim(playerid,"CRACK","crckdeth4",4.1,0,1,1,1,1);
			case 5:
				LoopingAnim(playerid,"CRACK","crckidle1",4.1,0,1,1,1,1);
			case 6:
				LoopingAnim(playerid,"CRACK","crckidle2",4.1,0,1,1,1,1);
			case 7:
				LoopingAnim(playerid,"CRACK","crckidle3",4.1,0,1,1,1,1);
			default:
			    return SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /ncrack [1-7]");
		}
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:gangs(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		if(isnull(params))
			return SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /gangs [1-9]");
		new animationplayed = strval(params );
		switch(animationplayed)
		{
			case 1:
				LoopingAnim(playerid,"GANGS","drnkbr_prtl",4.1,0,1,1,1,1);
			case 2:
				LoopingAnim(playerid,"GANGS","drnkbr_prtl_F",4.1,0,1,1,1,1);
			case 3:
				LoopingAnim(playerid,"GANGS","DRUGS_BUY",4.1,0,1,1,1,1);
			case 4:
				LoopingAnim(playerid,"GANGS","hndshkaa",4.1,0,1,1,1,1);
			case 5:
				LoopingAnim(playerid,"GANGS","hndshkba",4.1,0,1,1,1,1);
			case 6:
				LoopingAnim(playerid,"GANGS","hndshkca",4.1,0,1,1,1,1);
			case 7:
				LoopingAnim(playerid,"GANGS","hndshkcb",4.1,0,1,1,1,1);
			case 8:
				LoopingAnim(playerid,"GANGS","hndshkda",4.1,0,1,1,1,1);
			case 9:
				LoopingAnim(playerid,"GANGS","prtial_gngtlkD",4.1,0,1,1,1,1);
			default: return SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /gangs [1-9]");
		}
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:bar(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		if(isnull(params))
			return SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /bar [1-3]");
		new animationplayed = strval(params);
		switch(animationplayed)
		{
			case 1:
				LoopingAnim(playerid,"BAR","Barserve_bottle",4.1,0,1,1,1,1);
			case 2:
				LoopingAnim(playerid,"BAR","dnk_stndM_loop",4.1,0,1,1,1,1);
			case 3:
				LoopingAnim(playerid,"BAR","BARman_idle",4.1,0,1,1,1,1);
			default:
			    return SendClientMessage(playerid,COLOR_GRAD2,"ИСПОЛЬЗОВАНИЕ: /bar [1-3]");
		}
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:rap(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		ApplyAnimation(playerid,"RAPPING","RAP_A_Loop",4.1,1,1,1,1,1);
	return 1;
}
COMMAND:lifejump(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"PED","EV_dive",4.0,0,1,1,1,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:exhaust(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"PED","IDLE_tired",3.0,1,0,0,0,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:leftslap(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid,"PED","BIKE_elbowL",4.0,0,0,0,0,0);
	return 1;
}
COMMAND:box(playerid,params[])
{
    if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"GYMNASIUM","GYMshadowbox",4.0,1,1,1,1,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:chant(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"RIOT","RIOT_CHANT",4.0,1,1,1,1,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:cop(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		OnePlayAnim(playerid,"SWORD","sword_block",50.0,0,1,1,1,1);
	return 1;
}
COMMAND:fstance(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"FIGHT_D","FightD_IDLE",4.0,1,1,1,1,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:knifeped(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		LoopingAnim(playerid,"KNIFE","KILL_Knife_Ped_Die",4.1,0,1,1,1,1);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:shoutloop(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"ON_LOOKERS","shout_02",4.1,0,1,1,1,1);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:wtchrace(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"OTB","wtchrace_in",4.1,0,1,1,1,1);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:kiss(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid, "KISSING", "Playa_Kiss_02", 3.0, 1, 1, 1, 1, 0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:piss(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"PAULNMAC","Piss_in",4.1,0,1,1,1,1);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:animcar(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"CAR","Fixn_Car_Loop",4.1,0,1,1,1,1);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:lean(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		LoopingAnim(playerid,"MISC","Plyrlean_loop",4.0,0,1,1,1,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:seat(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"PED","SEAT_down",4.1,0,0,0,1,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:smoke(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
        SetPlayerSpecialAction(playerid, 21);
		Me(playerid,"достал сигарету и закурил", 5.0);
	}
	return 1;
}
COMMAND:asmoke(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
        if (!strlen(params))
			return SendClientMessage(playerid,0xFF0000FF," Используйте: /asmoke [1-4]");
    	switch (strval(params))
    	{
        	case 1:
				LoopingAnim(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0); // male
        	case 2:
				LoopingAnim(playerid,"SMOKING", "F_smklean_loop", 4.0, 1, 0, 0, 0, 0); //female
        	case 3:
		 		LoopingAnim(playerid,"SMOKING","M_smkstnd_loop", 4.0, 1, 0, 0, 0, 0); // standing-fucked
        	case 4:
				LoopingAnim(playerid,"SMOKING","M_smk_out", 4.0, 1, 0, 0, 0, 0); // standing
			default:
				return SendClientMessage(playerid,0xFF0000FF," Используйте:: /asmoke [1-4]");
    	}
		PlayerAnim[playerid]=1;
    }
    return 1;
}
//=======================================================================
COMMAND:inbedright(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		LoopingAnim(playerid,"INT_HOUSE","BED_Loop_R",4.0,1,0,0,0,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:inbedleft(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		LoopingAnim(playerid,"INT_HOUSE","BED_Loop_L",4.0,1,0,0,0,0);
		PlayerAnim[playerid]=1;
	}
	return 1;
}
COMMAND:dance(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
		if(isnull(params))
			return SendClientMessage(playerid,0xFF0000FF," Используйте: /dance [стиль 1-7]");
		new dancestyle = strval(params);
		switch(dancestyle)
		{
			case 1:
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
			case 2:
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
			case 3:
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
			case 4:
       			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
			case 5:
       			ApplyAnimation(playerid,"LAPDAN1","LAPDAN_D",4.1,0,1,1,1,1);
			case 6:
			    ApplyAnimation(playerid,"LAPDAN2","LAPDAN_D",4.1,0,1,1,1,1);
			case 7:
			    ApplyAnimation(playerid,"LAPDAN3","LAPDAN_D",4.1,0,1,1,1,1);
			default:
				return SendClientMessage(playerid,0xFF0000FF," Используйте: /dance [стиль 1-7]");
		}
	}
	return 1;
}

OnePlayAnim(playerid,animlib[],animname[], Float:Speed, looping, lockx, locky, lockz, lp)
	ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, lockz, lp);

LoopingAnim(playerid,animlib[],animname[], Float:Speed, looping, lockx, locky, lockz, lp)
{
    gPlayerUsingLoopingAnim[playerid] = 1;
    ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, lockz, lp);
    TextDrawShowForPlayer(playerid,txtAnimHelper);
}

StopLoopingAnim(playerid)
{
	gPlayerUsingLoopingAnim[playerid] = 0;
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0);
}
public OnPlayerDeath(playerid, killerid, reason)
{
	if(gPlayerUsingLoopingAnim[playerid])
	{
        gPlayerUsingLoopingAnim[playerid] = 0;
        TextDrawHideForPlayer(playerid,txtAnimHelper);
	}
	return 1;
}

PreloadAnimLib(playerid, animlib[])
	ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0);

AnimInit()
{
	txtAnimHelper = TextDrawCreate(610.0, 400.0,
	"~r~~k~~PED_SPRINT~ ~w~to stop the animation");
	TextDrawUseBox(txtAnimHelper, 0);
	TextDrawFont(txtAnimHelper, 2);
	TextDrawSetShadow(txtAnimHelper,0); // no shadow
    TextDrawSetOutline(txtAnimHelper,1); // thickness 1
    TextDrawBackgroundColor(txtAnimHelper,0x000000FF);
    TextDrawColor(txtAnimHelper,0xFFFFFFFF);
    TextDrawAlignment(txtAnimHelper,3); // align right
}
stock IsValidNickname(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,name, sizeof name);
	new n[2][16];
	if(!NoNum(name))
	    return 0;
	if(sscanf(name,"p<_>s[16]s[16]",n[0],n[1]))
	    return 0;
	if(!ValidName(n[0]))
	    return 0;
    if(!ValidName(n[1]))
	    return 0;
	return 1;
}

stock NoNum(str[])
{
	for(new x=0; x < strlen(str); x++)
	{
		switch(str[x])
		{
		    case '0','1','2','3','4','5','6','7','8','9': return 0;
			default: continue;
		}
	}
	return 1;
}
stock ValidName(str[])
{
    for(new x=0; x < strlen(str); x++)
	{
	    switch(x)
	    {
		    case 0:
		    {
		        switch(str[x])
				{
				    case 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z': return 0;
					default: continue;
				}
		    }
		    default:
		    {
				switch(str[x])
				{
				    case 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z': return 0;
					default: continue;
				}
			}
		}
	}
	return 1;
}
COMMAND:regsshow(playerid,params[])
{
	if(!PlayerInfo[playerid][pAdmin])
	    return 1;
    AdminShowRegs(playerid);
	return 1;
}
stock AdminShowRegs(playerid)
{
	new str[2048],Field[255];
	mysql_query("SELECT id, name FROM regs WHERE checked=0");
	mysql_store_result();
	new row=mysql_num_rows();
	if(!row)
	    return ShowPlayerDialog(playerid,0,DIALOG_STYLE_LIST,"Не проверенные регистрации:","Пусто","Ок","");
    for(new x=0; x < row; x++)
	{
	    mysql_fetch_row_format(Field);
	    strcat(str,Field);
		strcat(str,"\n");
	}
	mysql_free_result();
	new str1[128];
	format(str1,sizeof(str1),"Не проверенные регистрации(всего %d):",row);
	ShowPlayerDialog(playerid,DIALOG_ALLREGSHOW,DIALOG_STYLE_LIST,str1,str,"Выбор","Выход");
	return 1;
}

new RegName[MAX_PLAYERS][MAX_PLAYER_NAME];

enum question
{
	qText[255],
	qBit,
	qText1[255],
};
new Question[][question]=
{
{"Вы увидели на сервере читера, Ваши Действия?",0},
{"Дайте определение ''Metagaming'':",0},
{"Дайте определение ''Powergaming'':",0},
{"Дайте определение ''ООС'':",0},
{"Дайте определение ''IC'':",0},
{"При обращении, игрок назвал Вас по имени, узнав его из надписи над головой. Охарактеризуйте нарушение RolePlay режима(одним словом):",0},
{"Ситуация: ''Один персонаж угрожает другому пистолетом, находясь в непосредственной близости, а второй, небоясь за жизнь своего персонажа,",1,"продолжает явно игнорировать требования первого''. Дайте определение нарушению (одним словом)."},
{"Фраза: ''Я афк на 7 минут.'' Свойственна какому из игровых чатов? Дайте определение аббревиатурой.",0},
{"Фраза: ''Погнали в забегаловку, спранка опрокинем.'' Свойственна какому из игровых чатов? Дайте определение аббревиатурой.",0},
{"Игрок постоянно движется по встречной полосе дороги, несоблюдая светофоры и прочие ПДД. дайте определение нарушению(одним словом):",0},
{"Пример: ''/report сколько очков перевозок необходимо набрать для открытия собственной компании?'' В нужный ли сервис игрок обратился с",1,"вопросом, если в игре присутствуют такие сервисы как /request и /question? (Да/Нет)"},
{"Ситуация: Игрок передвигается по местности прыжками, беспорядочно щелкая клавишу ''Shift''. Дайте определение нарушению? (Одним словом)",0},
/*
13)*Процесс ареста*
John Shaper сказал: Пройдёмте в машину! Вы арестованы!
/me (John Shaper) надел наручники на Jack Winchester.
Jack Winchester сказал: Ага, коп.
/me (Jack Winchester) разломав наручники, оттолкнул полицейского.
Дайте определение нарушению? (одним словом)*/

{"Дайте определение ''RP''(RolePlay):",0},
{"Как необходимо поступить, если Вы врезались, например, в дерево? 1)Продолжить движение, т.к. ДТП никто не видел.",1,"2) Отыграть столкновение посредством /me, /do, /try с последующим РП ремонтом в сервисе. (В ответе указать цифру: 1/2)"},
{"Ситуация: ''К Вам в автомобиль подсел игрок и начал угрожать пистолем''. Что Вы предпримите?:",1,"1) Попытаетесь выбить пистолет и перехватить инициативу. 2) Будете выполнять требования нападавшего."},

{"При вопросе, ''Cколько будет стоить этот автомобиль?'' Корректнее ответить: 1) 2.5 миллиона 2) 2.5кк 3) 2.500.000",0},
{"Приведите пример Powergaming'а",0},
{"Приведите пример Metagaming'а",0}
};
#define MAX_QUESTIONS 7
new PlayerQuestion[MAX_PLAYERS][MAX_QUESTIONS];
new RegText[MAX_PLAYERS][25][255];
new RegTextNumStr[MAX_PLAYERS];
new PlayerQuestionNum[MAX_PLAYERS];
new RegID[MAX_PLAYERS];

stock ShowReg(playerid,inputtext[])
{
    new Field1[4096],query[512],str1[255],str[4096];
	sscanf(inputtext,"p<|>ds[24]",
	RegID[playerid],
	RegName[playerid]);
	format(query,sizeof(query),"SELECT strtext0, strtext1, strtext2, strtext3, strtext4, strtext5, strtext6, strtext7, strtext8, strtext9, strtext10, strtext11, strtext12, strtext13, strtext14, strtext15, strtext16, strtext17, strtext18, strtext19, strtext20, strtext21, strtext22, strtext23, strtext24 FROM regs WHERE id='%d'",RegID[playerid]);
	mysql_query(query);
	mysql_store_result();
	if(mysql_fetch_row_format(Field1))
	{
		sscanf(Field1,"p<|>s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]\
		s[255]",
	    RegText[playerid][0],
	    RegText[playerid][1],
	    RegText[playerid][2],
	    RegText[playerid][3],
	    RegText[playerid][4],
	    RegText[playerid][5],
	    RegText[playerid][6],
	    RegText[playerid][7],
	    RegText[playerid][8],
	    RegText[playerid][9],
	    RegText[playerid][10],
	    RegText[playerid][11],
	    RegText[playerid][12],
	    RegText[playerid][13],
	    RegText[playerid][14],
	    RegText[playerid][15],
	    RegText[playerid][16],
	    RegText[playerid][17],
	    RegText[playerid][18],
	    RegText[playerid][19],
	    RegText[playerid][20],
	    RegText[playerid][21],
	    RegText[playerid][22],
	    RegText[playerid][23],
	    RegText[playerid][24]);
		format(str,sizeof(str),"%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",
		RegText[playerid][0],
	    RegText[playerid][1],
	    RegText[playerid][2],
	    RegText[playerid][3],
	    RegText[playerid][4],
	    RegText[playerid][5],
	    RegText[playerid][6],
	    RegText[playerid][7],
	    RegText[playerid][8],
	    RegText[playerid][9],
	    RegText[playerid][10],
	    RegText[playerid][11],
	    RegText[playerid][12],
	    RegText[playerid][13],
	    RegText[playerid][14],
	    RegText[playerid][15],
	    RegText[playerid][16],
	    RegText[playerid][17],
	    RegText[playerid][18],
	    RegText[playerid][19],
	    RegText[playerid][20],
	    RegText[playerid][21],
	    RegText[playerid][22],
	    RegText[playerid][23],
	    RegText[playerid][24]);
	}
	format(str1,sizeof(str1),"Заявка игрока %s",RegName[playerid]);
	ShowPlayerDialog(playerid,DIALOG_REGSHOW,DIALOG_STYLE_MSGBOX,str1,str,"Меню","Выход");
	mysql_free_result();
	return 1;
}
stock ShowMenuReg(playerid)
{
	new str[255];
	format(str,sizeof(str),"Выберите действие с заявкой игрока %s",RegName[playerid]);
	ShowPlayerDialog(playerid,DIALOG_REGMENU,DIALOG_STYLE_LIST,str,"{33AA33}Подтвердить\n{AA3333}Отклонить\n{FFFF00}Забанить","Выбор","Отмена");
	return 1;
}

stock ShowMenuRegUse(playerid,listitem)
{
	new query[255],str[255];
	format(query,sizeof query,"SELECT id FROM regs WHERE name='%s' AND checked=0",RegName[playerid]);
	mysql_query(query);
	mysql_store_result();
	if(!mysql_num_rows())
	{
	    mysql_free_result();
	    format(str,sizeof str,"{FFFFFF}Данная заявка игрока %s уже была проверена ранее",RegName[playerid]);
	    return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Ошибка",str,"Ок","");
	}
	mysql_free_result();
	switch(listitem)
	{
	    case 0://подтвердить
		{
		    format(query,sizeof query,"UPDATE regs SET checked=1 WHERE name='%s'",RegName[playerid]);
		    mysql_query(query);
		    format(str,sizeof str,"{FFFFFF}Вы {33AA33}подтвердили {FFFFFF}заявку игрока %s",RegName[playerid]);
		    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Подтверждение заявки",str,"Ок","");
		}
		case 1://отклонить
		{
		    format(query,sizeof query,"UPDATE regs SET checked=2 WHERE id='%d'",RegID[playerid]);
		    mysql_query(query);
		    format(str,sizeof str,"{FFFFFF}Вы {AA3333}отклонили {FFFFFF}заявку игрока %s",RegName[playerid]);
		    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Отклонение заявки",str,"Ок","");
		}
		case 2://забанить
		{
		    format(query,sizeof query,"UPDATE regs SET checked=2 WHERE id='%d'",RegID[playerid]);
		    mysql_query(query);
		    format(query,sizeof query,"UPDATE players SET pBan=1 WHERE name='%s'",RegName[playerid]);
		    mysql_query(query);
		    format(str,sizeof str,"{FFFFFF}Вы {AA3333}отклонили {FFFFFF}заявку игрока %s, а так же перманентно забанили его.",RegName[playerid]);
		    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Отклонение заявки",str,"Ок","");
		}
	}
	return 1;
}
stock PlayerStartRegister(playerid,bit)
{
    //format(RegText[playerid],2048,"");

    for(new x=0; x < MAX_QUESTIONS; x++)
	    PlayerQuestion[playerid][x]=-1;
    PlayerQuestionNum[playerid]=0;
    RegTextNumStr[playerid]=0;
    new str[4096];
    if(bit)
		strcat(str,"{AA3333}Ваша предыдущая заявка отклонена, вы можете написать новую.\n");
	strcat(str,
	"{FFFFFF}Началась процедура регистрации, сейчас, вам нужно будет письменно ответить\n\
	на несколько вопросов, посвященных ролевой игре, затем, заявка будет отправ-\n\
	ленна на рассмотрение администрации, после проверки заявки, и положительного\n\
	ответа вы сможете играть. В случае отрицательного ответа, вам нужно будет на-\n\
	писать заявку заного.\n");
	strcat(str,
	"{AA3333}Внимание! {FFFFFF}Ответы можно писать в несколько строчек, используйте кнопку ''сл. строка''\n\
	для написания следующей строки, и кнопку ''сл. вопрос'', для перехода к следующему\n\
	вопросу.\n\
	Нажмите кнопку начать(внизу), что бы приступить к ответам на вопросы.");
	ShowPlayerDialog(playerid,DIALOG_NEXTREG,DIALOG_STYLE_MSGBOX,"Регистрация",str,"Начать","");
	return 1;
}
stock NextQuestion(playerid,response,inputtext[])
{
    switch(PlayerQuestionNum[playerid])
	{
	    case 0..MAX_QUESTIONS-1:
	    {
	        if(response && PlayerQuestionNum[playerid]!=0)
			{
			    new str[255];
			    format(RegText[playerid][RegTextNumStr[playerid]],255,"%s",inputtext);
			    if(strlen(inputtext)>0)
			    	RegTextNumStr[playerid]++;
			    new str1[4096];
				for(new x=0; x < RegTextNumStr[playerid]; x++)
				{
				    strcat(str1,RegText[playerid][x]);
					strcat(str1,"\n");
				}
			    format(str,sizeof(str),"Регистрация. Вопрос %d.",PlayerQuestionNum[playerid]+1);
			    ShowPlayerDialog(playerid,DIALOG_NEXTREG,DIALOG_STYLE_INPUT,str,str1,"сл. строка","сл. вопрос");
			}
			else
			{
				qpoint:
				new q=random(sizeof(Question)-1);
				new bit=0;
				for(new x=0; x < MAX_QUESTIONS; x++)
				{
				    if(q==PlayerQuestion[playerid][x])
					{
  						bit=1;
  						break;
  		            }
  		        }
				if(bit)
				    goto qpoint;
				new str[255];
			    PlayerQuestion[playerid][PlayerQuestionNum[playerid]]=q;

			    format(RegText[playerid][RegTextNumStr[playerid]],255,"%s",inputtext);
			    if(strlen(inputtext)>0)
			    	RegTextNumStr[playerid]++;
			    format(RegText[playerid][RegTextNumStr[playerid]],255,"%s",Question[q][qText]);
			    RegTextNumStr[playerid]++;
			    if(Question[q][qBit])
				{
					format(RegText[playerid][RegTextNumStr[playerid]],255,"%s",Question[q][qText1]);
					RegTextNumStr[playerid]++;
				}
			    new str1[4096];

				for(new x=0; x < RegTextNumStr[playerid]; x++)
				{
				    strcat(str1,RegText[playerid][x]);
					strcat(str1,"\n");
				}
			    
			    format(str,sizeof(str),"Регистрация. Вопрос %d.",PlayerQuestionNum[playerid]+1);
			    ShowPlayerDialog(playerid,DIALOG_NEXTREG,DIALOG_STYLE_INPUT,str,str1,"сл. строка","сл. вопрос");
                PlayerQuestionNum[playerid]++;
            }
	    }
		default:
		{
		    if(response)
			{
			    new str[255];
			    format(RegText[playerid][RegTextNumStr[playerid]],255,"%s",inputtext);
			    if(strlen(inputtext)>0)
			    	RegTextNumStr[playerid]++;
			    new str1[4096];
				for(new x=0; x < RegTextNumStr[playerid]; x++)
				{
				    strcat(str1,RegText[playerid][x]);
					strcat(str1,"\n");
				}
			    format(str,sizeof(str),"Регистрация. Вопрос %d.",PlayerQuestionNum[playerid]+1);
			    ShowPlayerDialog(playerid,DIALOG_NEXTREG,DIALOG_STYLE_INPUT,str,str1,"сл. строка","конец");
			}
			else
			{
			    new str[4096],str2[512],str3[255];
			    format(RegText[playerid][RegTextNumStr[playerid]],255,"%s",inputtext);
			    if(strlen(inputtext)>0)
			    	RegTextNumStr[playerid]++;
				format(str,255,"New registration %s",oGetPlayerName(playerid));
			    SendAddMessage(COLOR_GREEN,str);
			    format(str,4096,"INSERT INTO regs SET name='%s', checked=0",oGetPlayerName(playerid));
			    for(new x=0; x < RegTextNumStr[playerid]; x++)
				{
				    mysql_real_escape_string(RegText[playerid][x],str3);
					format(str2,512,", strtext%d='%s'",x,str3);
					strcat(str,str2);
				}
				mysql_query(str);
    			new str1[4096];

				for(new x=0; x < RegTextNumStr[playerid]; x++)
				{
				    strcat(str1,RegText[playerid][x]);
					strcat(str1,"\n");
				}
			    format(str,4096,"Регистрация окончена, текст заявки:\n%s\n\nЗаявка отправлена на рассмотрение, максимальное время рассмотрения 48 часов.\nВы кикнуты.",str1);
		    	ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Регистрация, конец",str,"Ок","");
		    	SetTimerEx("kick", 1000, 0, "d", playerid);
			}
		}
	}
	return 1;
}

stock CheckRegStatus(playerid)
{
	new status,query[255],Field3[255];
	format(query,sizeof(query),"SELECT checked FROM regs WHERE name='%s' ORDER BY id DESC LIMIT 1",oGetPlayerName(playerid));
	mysql_query(query);
	mysql_store_result();
	if(!mysql_num_rows())
	    return PlayerStartRegister(playerid,0);
	mysql_fetch_row_format(Field3);
	status=strval(Field3);
	switch(status)
	{
	    case 0:
	    {
	        ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Регистрация, проверка заявки",
			"Ваша заявка еще не проверена, ожидайте. В данный момент вы кикнуты","Ок","");
			SetTimerEx("kick", 1000, 0, "d", playerid);
	    }
	    case 1://подтверждена
	    {
			PlayerInfo[playerid][pAccepted]=1;
			ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Регистрация, проверка заявки",
			"Ваша заявка подтверждена, поздравляем, теперь вы можете начать игру на нашем сервере","Ок","");
			SpawnPlayer(playerid);
	    }
	    case 2://отклонена
	    {
	        PlayerStartRegister(playerid,1);
		}
	}
	mysql_free_result();
	return 1;
}

stock DeleteObjectsConnect(playerid)
{
	// Remove all vending machines
    RemoveBuildingForPlayer(playerid, 1302, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1209, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 955, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1755, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1776, 0.0, 0.0, 0.0, 6000.0);
    //спрей теги
    RemoveBuildingForPlayer(playerid, 1529, 0.0, 0.0, 0.0, 6000.0);
    // светофоры
    RemoveBuildingForPlayer(playerid, 1283, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1284, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1315, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1350, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1352, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 3516, 0.0, 0.0, 0.0, 6000.0);
    //ворота атомной станции
   	RemoveBuildingForPlayer(playerid, 985, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 986, 0.0, 0.0, 0.0, 6000.0);
    //шлакбаум
    RemoveBuildingForPlayer(playerid, 968, 0.0, 0.0, 0.0, 6000.0);
    //ворота на площадку автошколы
    RemoveBuildingForPlayer(playerid,11014, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid,11372, 0.0, 0.0, 0.0, 6000.0);//лод
    return 1;
}

COMMAND:apage(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin]>=1)
		AchatLstMode(playerid);
	return 1;
}
//==========
COMMAND:achat(playerid,params[])
{
	new string[255];
	if(PlayerInfo[playerid][pAdmin]>=1)
	{
		if (!isnull(params))
		{
			format(string , sizeof(string), "%d->%s: %s",PlayerInfo[playerid][pAdmin],oGetPlayerName(playerid), params);
			SendAddMessage(COLOR_LIGHTBLUE,string);
			return 1;
		}
		if(AddChatAcess[playerid][0] == 0)
			EnableAChat(playerid);
		else
			DisableAChat(playerid);
	}
	return 1;
}
