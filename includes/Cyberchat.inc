// Script by CyberDemon & Eakwarp
//  Чат на фреймовом алгоритме
//==================
//установка
//#include "Cyberchat"
/*public OnGameModeInit()
{
	SendAddMessage(0x33AA33AA,"  Welcome to Server.");//COLOR_GREEN
}
public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/achat", cmdtext, true, 10) == 0)
	{
	EnableAChat(playerid);
	return 1;
	}
	if (strcmp("/achatoff", cmdtext, true, 10) == 0)
	{
	DisableAChat(playerid);
	return 1;
	}
	if (strcmp("/page", cmdtext, true, 10) == 0)
	{
	AchatLstMode(playerid);
	return 1;
	}
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	AchatKeyLst(playerid,newkeys);
}
public OnPlayerDisconnect(playerid, reason)
{
 	DisableAChat(playerid);
}*/
//===================
/*использование
В скрипте:
SendAddMessage(COLOR,string);
или
SendAddMessage(COLOR,"Ваш текст");
В режиме:
"/achat" активизация чата для вас
"/achatoff" деактивизация чата для вас
"/page" листание чата
==================
контакты
CyberDemon icq#399316055
Eakwarp icq#252094743*/
//<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>


#define ChatBuffer 40       
#define ChatYsize 8 
new FramePos; 
new Text:AddDrawing[40],Text:ChatDrain[10];
new AddChatActive,AchatLister[MAX_PLAYERS][1];
new AddChatAcess[MAX_PLAYERS][2];
new Achattratata;
enum ChatInfo {ChatFrame[40]}
new AddChat[(ChatBuffer)][ChatFrame] = {
{"::                                                                                      "}, //1
{"::                                                                                      "}, //2
{"::                                                                                      "}, //3
{"::                                                                                      "}, //4
{"::                                                                                      "}, //5
{"::                                                                                      "}, //6
{"::                                                                                      "}, //7
{"::                                                                                      "}, //8
{"::                                                                                      "}, //9
{"::                                                                                      "}, //10
{"::                                                                                      "}, //11
{"::                                                                                      "}, //12
{"::                                                                                      "}, //13
{"::                                                                                      "}, //14
{"::                                                                                      "}, //15
{"::                                                                                      "}, //16
{"::                                                                                      "}, //17
{"::                                                                                      "}, //18
{"::                                                                                      "}, //19
{"::                                                                                      "}, //20
{"::                                                                                      "}, //21
{"::                                                                                      "}, //22
{"::                                                                                      "}, //23
{"::                                                                                      "}, //24
{"::                                                                                      "}, //25
{"::                                                                                      "}, //26
{"::                                                                                      "}, //27
{"::                                                                                      "}, //28
{"::                                                                                      "}, //29
{"::                                                                                      "}, //30
{"::                                                                                      "}, //31
{"::                                                                                      "}, //32
{"::                                                                                      "}, //33
{"::                                                                                      "}, //34
{"::                                                                                      "}, //35
{"::                                                                                      "}, //36
{"::                                                                                      "}, //37
{"::                                                                                      "}, //38
{"::                                                                                      "}, //39
{"::                                                                                      "} //40
};
//--------------------------
forward SendAddMessage(color,message[]);
public SendAddMessage(color,message[])
{
	AchatInit();
	new string[256],h,m,s;
	gettime(h,m,s);
	FramePos=FramePos+1;if(FramePos == ChatBuffer) FramePos=0;
	new framedown=FramePos;    //Ид нижней строчки
	for (new i=1; i<ChatYsize; i++) {framedown+=1;if (framedown ==ChatBuffer ) framedown=0;}
	format(string,74,"[%d:%d]%s",h,m,message);
	format(string,sizeof(string),"%d %s",color,Translate(string));
	format( (AddChat[framedown][ChatFrame]), sizeof(string), string);
	if(AddChatActive == 1)
	{
	//SendAddMessagePrintDrow();
	//SendAddMessageShowDrow();

		if(Achattratata== 0)SetTimer("glukoff",1,0);
	}
	return 1;
}
forward glukoff();
public glukoff()
{
	SendAddMessagePrintDrow();
	SendAddMessageShowDrow();
	Achattratata=0;
	return 1;
}
//============================================================
forward SendAddMessagePrintDrow();
public SendAddMessagePrintDrow()
{
	if(AddChatActive == 0) return 1;
	new tmp[256];
	new FramePosDrawing=FramePos;
	new FramePosxxx=FramePos;
	new Addpos=0;
	for (new i=0; i<5; i++)
	{
		for (new i1=0; i1<ChatYsize; i1++)
		{
			format(tmp,sizeof(tmp),"%s",AddChat[FramePosDrawing][ChatFrame]);
			new result[20],resdel=0;
			while (tmp[resdel]<=' ')resdel++;
			new offset=resdel;
			while (tmp[resdel]>' ')
			{
				result[resdel-offset]=tmp[resdel];
				resdel++;
			}
			result[resdel-offset] = EOS;
			new color=strval(result);
			strdel(tmp, 0, resdel);
	    	TextDrawSetString( AddDrawing[(i1+Addpos)] ,tmp);
			TextDrawColor(AddDrawing[(i1+Addpos)],color);
			FramePosDrawing+=1;
			if(FramePosDrawing == ChatBuffer) FramePosDrawing=0;
		}
		Addpos+=ChatYsize;
		for (new i2=1; i2<ChatYsize; i2++)
		{
			if (FramePosxxx ==0)FramePosxxx=ChatBuffer;
			FramePosxxx-=1;
		}
		FramePosDrawing=FramePosxxx;
	}
	return 1;
}

forward AchatInit();
public AchatInit()    
{
	if(AddChatActive == 1) return 1;
	AddChatActive=1;
 	new string[256];
	format(string, sizeof(string), ".....");
	for(new achatint=1;achatint<ChatBuffer;achatint++)SendAddMessage(0xFFFFFFAA,string);//COLOR_WHITE
	new Float:x=342.000000;//352.000000;
	new Float:xpos;
	new Addpos=0;
	for (new i=0; i<5; i++)
	{
	xpos=x;
	for (new i1=0; i1<ChatYsize; i1++)
	{
	AddDrawing[(i1+Addpos)] = TextDrawCreate(152.000000,xpos,"CyberDemon icq399316055");
	TextDrawAlignment(AddDrawing[(i1+Addpos)],0);
	TextDrawBackgroundColor(AddDrawing[(i1+Addpos)],0x000000ff);
	TextDrawFont(AddDrawing[(i1+Addpos)],1);
	TextDrawLetterSize(AddDrawing[(i1+Addpos)],0.299999,1.100000);
	TextDrawColor(AddDrawing[(i1+Addpos)],0xffffffff);
	TextDrawSetOutline(AddDrawing[(i1+Addpos)],1);
	TextDrawSetOutline(AddDrawing[(i1+Addpos)],1);
	TextDrawSetProportional(AddDrawing[(i1+Addpos)],1);
	TextDrawSetShadow(AddDrawing[(i1+Addpos)],1);
	xpos+=10.000000;
	}
	Addpos+=ChatYsize;
	}
	//poloska----
	ChatDrain[0]= TextDrawCreate(157.000000,345.000000,".");
	TextDrawUseBox(ChatDrain[0],1);
	TextDrawBoxColor(ChatDrain[0],0x00000066);
	TextDrawTextSize(ChatDrain[0],141.000000,-1.000000);//-2
	TextDrawAlignment(ChatDrain[0],0);
	TextDrawBackgroundColor(ChatDrain[0],0x00000000);
	TextDrawFont(ChatDrain[0],3);
	TextDrawLetterSize(ChatDrain[0],2.000000,8.500000);//9
	TextDrawColor(ChatDrain[0],0x00000000);
	TextDrawSetOutline(ChatDrain[0],1);
	TextDrawSetProportional(ChatDrain[0],1);
	xpos=x-3.500;
	for (new i=1; i<6;i++)
	{
	ChatDrain[i]=TextDrawCreate(146.000000,xpos,"l");
	TextDrawAlignment(ChatDrain[i],0);
	TextDrawBackgroundColor(ChatDrain[i],0x000000ff);
	TextDrawFont(ChatDrain[i],1);
	TextDrawLetterSize(ChatDrain[i],0.599999,3.000000);//0.29 1.1
	TextDrawColor(ChatDrain[i],0xffffffff);
	TextDrawSetOutline(ChatDrain[i],1);
	TextDrawSetOutline(ChatDrain[i],1);
	TextDrawSetProportional(ChatDrain[i],1);
	TextDrawSetShadow(ChatDrain[i],1);
	xpos+=15.000000;
	}
	return 1;
}
forward SendAddMessageShowDrow();
public SendAddMessageShowDrow()
{
	if(AddChatActive == 0) return 1;
	for (new i=0; i<MAX_PLAYERS; i++)
	{
		if(!IsPlayerConnected(i)) {AddChatAcess[i][0]=0;AddChatAcess[i][1]=0;}
		if(AddChatAcess[i][0] == 1)
		{
		new MuLL=( AddChatAcess[i][1] * ChatYsize);
		for (new i1=ChatYsize-1; i1>=0; i1--)TextDrawShowForPlayer(i, AddDrawing[MuLL+i1] );
		}
	}
	return 1;
}
forward EnableAChat(playerid);
public EnableAChat(playerid)
{
	if(AddChatAcess[playerid][0]==1) return;
	AddChatAcess[playerid][0]=1;
	AddChatAcess[playerid][1]=0; //nomer stranicu
	new MuLL=( AddChatAcess[playerid][1] * ChatYsize);
	for (new i=ChatYsize-1; i>=0; i--)TextDrawShowForPlayer(playerid, AddDrawing[MuLL+i]);
	TextDrawShowForPlayer(playerid,ChatDrain[0]);
	TextDrawShowForPlayer(playerid,ChatDrain[5]);
}
forward DisableAChat(playerid);
public DisableAChat(playerid)
{
	if(AddChatAcess[playerid][0]==0) return;
	AddChatAcess[playerid][0]=0;
	AddChatAcess[playerid][1]=0; //nomer stranicu
	new MuLL=( AddChatAcess[playerid][1] * ChatYsize);
	for (new i=ChatYsize-1; i>=0; i--)TextDrawHideForPlayer(playerid, AddDrawing[MuLL+i]);
	for (new i=0; i<6;i++)TextDrawHideForPlayer(playerid,ChatDrain[i]);
}
forward AchatLst(playerid,page);
public AchatLst(playerid,page)
{
	if(AddChatAcess[playerid][0]==0)return;
	new tekpage=5-AddChatAcess[playerid][1];
	new MuLL=( AddChatAcess[playerid][1] * ChatYsize);
	for (new i=0; i<ChatYsize; i++)TextDrawHideForPlayer(playerid, AddDrawing[MuLL+i]);
	AddChatAcess[playerid][1]=page;
	MuLL=page*ChatYsize;
	page=5-page;
	for (new i=ChatYsize-1; i>=0; i--)TextDrawShowForPlayer(playerid, AddDrawing[MuLL+i]);
	TextDrawShowForPlayer(playerid,ChatDrain[page]);
	TextDrawHideForPlayer(playerid,ChatDrain[tekpage]);
}
forward AchatLstMode(playerid);
public AchatLstMode(playerid)
	{
	SendClientMessage(playerid,0x9ACD32AA," * Selecting mode activated.");//COLOR_LIGHTGREEN
	SendClientMessage(playerid,0x9ACD32AA," * Use 'Crouch'(listdown), 'Jump'(listup), TAB to finish.");//COLOR_LIGHTGREEN
	AchatLister[playerid][0]=255;
	return 1;
	}
forward AchatKeyLst(playerid,newkeys);
public AchatKeyLst(playerid,newkeys)
{
	new string[64];
	if(AchatLister[playerid][0]==0)return;
	if((newkeys==KEY_JUMP) && (AddChatAcess[playerid][1]<4))AchatLst(playerid,(AddChatAcess[playerid][1]+1));
	else if((newkeys==KEY_CROUCH) && (AddChatAcess[playerid][1]>0))AchatLst(playerid,(AddChatAcess[playerid][1]-1));
	else if(newkeys==KEY_ACTION)
	{
		format(string,sizeof(string)," * You set page #%d.",AddChatAcess[playerid][1]);
		SendClientMessage(playerid,0x9ACD32AA,string);//COLOR_LIGHTGREEN
		AchatLister[playerid][0]=0;
	}
	return;
}
