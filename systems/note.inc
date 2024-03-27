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
