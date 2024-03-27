#define Loop(%1,%2) for(new %1;%1<=%2;%1++)

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

stock Float:GetDistanceBetweenPoints(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
	return floatadd(floatadd(floatsqroot(floatpower(floatsub(x1,x2),2)),floatsqroot(floatpower(floatsub(y1,y2),2))),floatsqroot(floatpower(floatsub(z1,z2),2)));


stock Translate(str[])
{
    new retstr[512];
    for(new i=0;i<strlen(str);i++)
	{
		switch(str[i])
		{
			case 'À':strcat(retstr,"A");
			case 'Á':strcat(retstr,"B");
			case 'Â':strcat(retstr,"V");
			case 'Ã':strcat(retstr,"G");
			case 'Ä':strcat(retstr,"D");
			case 'Å':strcat(retstr,"E");
			case '¨':strcat(retstr,"Jo");
			case 'Æ':strcat(retstr,"Zh");
            case 'Ç':strcat(retstr,"Z");
            case 'È':strcat(retstr,"I");
            case 'É':strcat(retstr,"J");
            case 'Ê':strcat(retstr,"K");
            case 'Ë':strcat(retstr,"L");
            case 'Ì':strcat(retstr,"M");
            case 'Í':strcat(retstr,"N");
            case 'Î':strcat(retstr,"O");
            case 'Ï':strcat(retstr,"P");
            case 'Ð':strcat(retstr,"R");
            case 'Ñ':strcat(retstr,"S");
            case 'Ò':strcat(retstr,"T");
            case 'Ó':strcat(retstr,"U");
            case 'Ô':strcat(retstr,"F");
            case 'Õ':strcat(retstr,"H");
            case 'Ö':strcat(retstr,"C");
            case '×':strcat(retstr,"Ch");
            case 'Ø':strcat(retstr,"Sh");
            case 'Ù':strcat(retstr,"Shh");
            case 'Ü':strcat(retstr,"#");
            case 'Û':strcat(retstr,"Y");
            case 'Ú':strcat(retstr,"'");
            case 'Ý':strcat(retstr,"Je");
            case 'Þ':strcat(retstr,"Ju");
            case 'ß':strcat(retstr,"Ja");
            case 'à':strcat(retstr,"a");
			case 'á':strcat(retstr,"b");
			case 'â':strcat(retstr,"v");
			case 'ã':strcat(retstr,"g");
			case 'ä':strcat(retstr,"d");
			case 'å':strcat(retstr,"e");
			case '¸':strcat(retstr,"jo");
			case 'æ':strcat(retstr,"zh");
            case 'ç':strcat(retstr,"z");
            case 'è':strcat(retstr,"i");
            case 'é':strcat(retstr,"j");
            case 'ê':strcat(retstr,"k");
            case 'ë':strcat(retstr,"l");
            case 'ì':strcat(retstr,"m");
            case 'í':strcat(retstr,"n");
            case 'î':strcat(retstr,"o");
            case 'ï':strcat(retstr,"p");
            case 'ð':strcat(retstr,"r");
            case 'ñ':strcat(retstr,"s");
            case 'ò':strcat(retstr,"t");
            case 'ó':strcat(retstr,"u");
            case 'ô':strcat(retstr,"f");
            case 'õ':strcat(retstr,"h");
            case 'ö':strcat(retstr,"c");
            case '÷':strcat(retstr,"ch");
            case 'ø':strcat(retstr,"sh");
            case 'ù':strcat(retstr,"shh");
            case 'ú':strcat(retstr,"#");
            case 'û':strcat(retstr,"y");
            case 'ü':strcat(retstr,"'");
            case 'ý':strcat(retstr,"je");
            case 'þ':strcat(retstr,"ju");
            case 'ÿ':strcat(retstr,"ja");
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


stock IsATruck(carid)
{
    switch(GetVehicleModel(carid))
    {
		case 403,514,515: return 1;
	}
	return 0;
}


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