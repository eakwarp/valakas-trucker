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
stock RealChatKeyLeft(playerid)
{
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
	return 1;
}
stock RealChatKeyRight(playerid)
{
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
	return 1;
}