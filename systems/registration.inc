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
	    return ShowPlayerDialog(playerid,0,DIALOG_STYLE_LIST,"Не проверенные регистрации:","Пусто","Ок","");
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
	format(str1,sizeof(str1),"Не проверенные регистрации(всего %d):",rows);
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
	format(str1,sizeof(str1),"Заявка игрока %s",RegName[playerid]);
	ShowPlayerDialog(playerid,DIALOG_REGSHOW,DIALOG_STYLE_MSGBOX,str1,str,"Меню","Выход");
	//mysql_free_result();
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
	new Cache:result=mysql_query(MySQL,query);
    new rows;
	cache_get_row_count(rows);
    if(rows==0)
    {
	   	cache_delete(result);
		format(str,sizeof str,"{FFFFFF}Данная заявка игрока %s уже была проверена ранее",RegName[playerid]);
	    return ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Ошибка",str,"Ок","");
	}
	cache_delete(result);
	switch(listitem)
	{
	    case 0://подтвердить
		{
		    format(query,sizeof query,"UPDATE regs SET checked=1 WHERE name='%s'",RegName[playerid]);
		    mysql_query(MySQL, query, false);
		    format(str,sizeof str,"{FFFFFF}Вы {33AA33}подтвердили {FFFFFF}заявку игрока %s",RegName[playerid]);
		    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Подтверждение заявки",str,"Ок","");
		}
		case 1://отклонить
		{
		    format(query,sizeof query,"UPDATE regs SET checked=2 WHERE id='%d'",RegID[playerid]);
		    mysql_query(MySQL, query, false);
		    format(str,sizeof str,"{FFFFFF}Вы {AA3333}отклонили {FFFFFF}заявку игрока %s",RegName[playerid]);
		    ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX,"Отклонение заявки",str,"Ок","");
		}
		case 2://забанить
		{
		    format(query,sizeof query,"UPDATE regs SET checked=2 WHERE id='%d'",RegID[playerid]);
		    mysql_query(MySQL, query, false);
		    format(query,sizeof query,"UPDATE players SET pBan=1 WHERE name='%s'",RegName[playerid]);
		    mysql_query(MySQL, query, false);
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
	return 1;
}
