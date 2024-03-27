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