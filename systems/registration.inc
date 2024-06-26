COMMAND:regsshow(playerid,params[])
{
	if(!PlayerInfo[playerid][pAdmin])
	    return 1;
    AdminShowRegs(playerid);
	return 1;
}
stock AdminShowRegs(playerid)
{
	mysql_tquery(MySQL, "SELECT id, name FROM regs WHERE checked=0", "SQL_AdminShowRegs", "d", playerid);
	return 1;
}
forward SQL_AdminShowRegs(playerid);
public SQL_AdminShowRegs(playerid)
{
	new rows,str[2048];
	cache_get_row_count(rows);
	if(!rows)
	    return ShowPlayerDialog(playerid,0,DIALOG_STYLE_LIST,regtext1,"�����","��","");
    for(new x=0; x < rows; x++)
	{
		new id,name[24];
		cache_get_value_name_int(0,"id",id);
		cache_get_value_name(0,"name",name,24);
	    //mysql_fetch_row_format(Field);
		new Field[128];
		format(Field,128,"%d|%s\n",id,name);
	    strcat(str,Field);
	}
	new str1[128];
	format(str1,sizeof(str1),regtext2,rows);
	ShowPlayerDialog(playerid,DIALOG_ALLREGSHOW,DIALOG_STYLE_LIST,str1,str,"�����","�����");
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
{regquestion1,0},
{regquestion2,0},
{regquestion3,0},
{regquestion4,0},
{regquestion5,0},
{regquestion6,0},
{regquestion7,1,regquestion8},
{regquestion9,0},
{regquestion10,0},
{regquestion11,0},
{regquestion12,1,regquestion13},
{regquestion14,0},
{regquestion15,0},
{regquestion16,1,regquestion17},
{regquestion18,1,regquestion19},

{regquestion20,0},
{regquestion21,0},
{regquestion22,0}
};
#define MAX_QUESTIONS 7
new PlayerQuestion[MAX_PLAYERS][MAX_QUESTIONS];
new RegText[MAX_PLAYERS][25][255];
new RegTextNumStr[MAX_PLAYERS];
new PlayerQuestionNum[MAX_PLAYERS];
new RegID[MAX_PLAYERS];

stock ShowReg(playerid,inputtext[])
{
    new query[512];
	sscanf(inputtext,"p<|>ds[24]",
	RegID[playerid],
	RegName[playerid]);
	format(query,sizeof(query),"SELECT strtext0, strtext1, strtext2, strtext3, strtext4, strtext5, strtext6, strtext7, strtext8, strtext9, strtext10, strtext11, strtext12, strtext13, strtext14, strtext15, strtext16, strtext17, strtext18, strtext19, strtext20, strtext21, strtext22, strtext23, strtext24 FROM regs WHERE id='%d'",RegID[playerid]);
	mysql_tquery(MySQL, query, "SQL_ShowReg", "d", playerid);
	return 1;
}
forward SQL_ShowReg(playerid);
public SQL_ShowReg(playerid)
{
	new str1[255],str[4096];
	new rows;
	cache_get_row_count(rows);
	if(rows>0)
	{
		cache_get_value_name(0,"strtext0",RegText[playerid][0],255);
		cache_get_value_name(0,"strtext1",RegText[playerid][1],255);
		cache_get_value_name(0,"strtext2",RegText[playerid][2],255);
		cache_get_value_name(0,"strtext3",RegText[playerid][3],255);
		cache_get_value_name(0,"strtext4",RegText[playerid][4],255);
		cache_get_value_name(0,"strtext5",RegText[playerid][5],255);
		cache_get_value_name(0,"strtext6",RegText[playerid][6],255);
		cache_get_value_name(0,"strtext7",RegText[playerid][7],255);
		cache_get_value_name(0,"strtext8",RegText[playerid][8],255);
		cache_get_value_name(0,"strtext9",RegText[playerid][9],255);
		cache_get_value_name(0,"strtext10",RegText[playerid][10],255);
		cache_get_value_name(0,"strtext11",RegText[playerid][11],255);
		cache_get_value_name(0,"strtext12",RegText[playerid][12],255);
		cache_get_value_name(0,"strtext13",RegText[playerid][13],255);
		cache_get_value_name(0,"strtext14",RegText[playerid][14],255);
		cache_get_value_name(0,"strtext15",RegText[playerid][15],255);
		cache_get_value_name(0,"strtext16",RegText[playerid][16],255);
		cache_get_value_name(0,"strtext17",RegText[playerid][17],255);
		cache_get_value_name(0,"strtext18",RegText[playerid][18],255);
		cache_get_value_name(0,"strtext19",RegText[playerid][19],255);
		cache_get_value_name(0,"strtext20",RegText[playerid][20],255);
		cache_get_value_name(0,"strtext21",RegText[playerid][21],255);
		cache_get_value_name(0,"strtext22",RegText[playerid][22],255);
		cache_get_value_name(0,"strtext23",RegText[playerid][23],255);
		cache_get_value_name(0,"strtext24",RegText[playerid][24],255);
		/*
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
	    RegText[playerid][24]);*/
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
	format(str1,sizeof(str1),"������ ������ %s",RegName[playerid]);
	ShowPlayerDialog(playerid,DIALOG_REGSHOW,DIALOG_STYLE_MSGBOX,str1,str,"����","�����");
	//mysql_free_result();
	return 1;
}
stock ShowMenuReg(playerid)
{
	new str[255];
	format(str,sizeof(str),"�������� �������� � ������� ������ %s",RegName[playerid]);
	ShowPlayerDialog(playerid,DIALOG_REGMENU,DIALOG_STYLE_LIST,str,"{33AA33}�����������\n{AA3333}���������\n{FFFF00}��������","�����","������");
	return 1;
}

stock ShowMenuRegUse(playerid,listitem)
{
	new query[255],str[255];
	format(query,sizeof query,"SELECT id FROM regs WHERE name='%s' AND checked=0",RegName[playerid]);
	new Cache:result=mysql_query(MySQL,query);
    new rows;
	cache_get_row_count(rows);
    if(rows==0)
    {
	   	cache_delete(result);
		format(str,sizeof str,"{FFFFFF}������ ������ ������ %s ��� ���� ��������� �����",RegName[playerid]);
	    return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"������",str,"��","");
	}
	cache_delete(result);
	switch(listitem)
	{
	    case 0://�����������
		{
		    format(query,sizeof query,"UPDATE regs SET checked=1 WHERE name='%s'",RegName[playerid]);
		    mysql_query(MySQL, query, false);
		    format(str,sizeof str,"{FFFFFF}�� {33AA33}����������� {FFFFFF}������ ������ %s",RegName[playerid]);
		    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"������������� ������",str,"��","");
		}
		case 1://���������
		{
		    format(query,sizeof query,"UPDATE regs SET checked=2 WHERE id='%d'",RegID[playerid]);
		    mysql_query(MySQL, query, false);
		    format(str,sizeof str,"{FFFFFF}�� {AA3333}��������� {FFFFFF}������ ������ %s",RegName[playerid]);
		    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"���������� ������",str,"��","");
		}
		case 2://��������
		{
		    format(query,sizeof query,"UPDATE regs SET checked=2 WHERE id='%d'",RegID[playerid]);
		    mysql_query(MySQL, query, false);
		    format(query,sizeof query,"UPDATE players SET pBan=1 WHERE name='%s'",RegName[playerid]);
		    mysql_query(MySQL, query, false);
		    format(str,sizeof str,"{FFFFFF}�� {AA3333}��������� {FFFFFF}������ ������ %s, � ��� �� ����������� �������� ���.",RegName[playerid]);
		    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"���������� ������",str,"��","");
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
		strcat(str,"{AA3333}���� ���������� ������ ���������, �� ������ �������� �����.\n");
	strcat(str,
	"{FFFFFF}�������� ��������� �����������, ������, ��� ����� ����� ��������� ��������\n\
	�� ��������� ��������, ����������� ������� ����, �����, ������ ����� ������-\n\
	����� �� ������������ �������������, ����� �������� ������, � ��������������\n\
	������ �� ������� ������. � ������ �������������� ������, ��� ����� ����� ��-\n\
	������ ������ ������.\n");
	strcat(str,
	"{AA3333}��������! {FFFFFF}������ ����� ������ � ��������� �������, ����������� ������ ''��. ������''\n\
	��� ��������� ��������� ������, � ������ ''��. ������'', ��� �������� � ����������\n\
	�������.\n\
	������� ������ ������(�����), ��� �� ���������� � ������� �� �������.");
	ShowPlayerDialog(playerid,DIALOG_NEXTREG,DIALOG_STYLE_MSGBOX,"�����������",str,"������","");
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
			    format(str,sizeof(str),"�����������. ������ %d.",PlayerQuestionNum[playerid]+1);
			    ShowPlayerDialog(playerid,DIALOG_NEXTREG,DIALOG_STYLE_INPUT,str,str1,"��. ������","��. ������");
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
			    
			    format(str,sizeof(str),"�����������. ������ %d.",PlayerQuestionNum[playerid]+1);
			    ShowPlayerDialog(playerid,DIALOG_NEXTREG,DIALOG_STYLE_INPUT,str,str1,"��. ������","��. ������");
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
			    format(str,sizeof(str),"�����������. ������ %d.",PlayerQuestionNum[playerid]+1);
			    ShowPlayerDialog(playerid,DIALOG_NEXTREG,DIALOG_STYLE_INPUT,str,str1,"��. ������","�����");
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
				    mysql_escape_string(RegText[playerid][x],str3);
					format(str2,512,", strtext%d='%s'",x,str3);
					strcat(str,str2);
				}
				mysql_query(MySQL, str, false);
    			new str1[4096];

				for(new x=0; x < RegTextNumStr[playerid]; x++)
				{
				    strcat(str1,RegText[playerid][x]);
					strcat(str1,"\n");
				}
			    format(str,4096,"����������� ��������, ����� ������:\n%s\n\n������ ���������� �� ������������, ������������ ����� ������������ 48 �����.\n�� �������.",str1);
		    	ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"�����������, �����",str,"��","");
		    	SetTimerEx("kick", 1000, 0, "d", playerid);
			}
		}
	}
	return 1;
}

stock CheckRegStatus(playerid)
{
	new status,query[255];//
	format(query,sizeof(query),"SELECT checked FROM regs WHERE name='%s' ORDER BY id DESC LIMIT 1",oGetPlayerName(playerid));
	new Cache:result=mysql_query(MySQL,query);
    new rows;
	cache_get_row_count(rows);
    if(rows==0)
    {
	   	cache_delete(result);
	    return PlayerStartRegister(playerid,0);
	}
	cache_get_value_name_int(0,"checked",status);
	cache_delete(result);
/*

	mysql_query(query);
	mysql_store_result();
	if(!mysql_num_rows())
	    return PlayerStartRegister(playerid,0);
	mysql_fetch_row_format(Field3);*/
	//status=strval(Field3);
	switch(status)
	{
	    case 0:
	    {
	        ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"�����������, �������� ������",
			"���� ������ ��� �� ���������, ��������. � ������ ������ �� �������","��","");
			SetTimerEx("kick", 1000, 0, "d", playerid);
	    }
	    case 1://������������
	    {
			PlayerInfo[playerid][pAccepted]=1;
			ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"�����������, �������� ������",
			"���� ������ ������������, �����������, ������ �� ������ ������ ���� �� ����� �������","��","");
			SpawnPlayer(playerid);
	    }
	    case 2://���������
	    {
	        PlayerStartRegister(playerid,1);
		}
	}
	return 1;
}
