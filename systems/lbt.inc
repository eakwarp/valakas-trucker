
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