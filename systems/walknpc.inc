//new FCNPCType[MAX_PLAYERS];
new PlayeridToWNPCid[2048];
#define MAX_WALKNPC 400
//#define WALKNPC_NODESRELOAD 10000
#define WNPCTimerTime 100
#define FCNPC_MOVE_SPEED_WALK      (0.1552086)
/*
//natives
native NPC_Create(const name[]);
native NPC_Destroy(npcid);
native NPC_IsValid(npcid);
native NPC_Spawn(npcid);
native NPC_SetPos(npcid, Float:x, Float:y, Float:z);
native NPC_GetPos(npcid, &Float:x, &Float:y, &Float:z);
native NPC_SetRot(npcid, Float:x, Float:y, Float:z);
native NPC_GetRot(npcid, &Float:x, &Float:y, &Float:z);
native NPC_SetVirtualWorld(npcid, vw);
native NPC_GetVirtualWorld(npcid, &vw);
native NPC_Move(npcid, Float:x, Float:y, Float:z, moveType);
native NPC_StopMove(npcid);
//Callbacks:
forward OnNPCFinishMove(npcid);
forward OnNPCConnect(npcid);
forward OnNPCDisconnect(npcid);*/

forward Float:GetDistanceXYZtoXYZ(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2);
public Float:GetDistanceXYZtoXYZ(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
{
	new Float:dist = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	return dist;
}

stock static PreloadNPCAnimations(actorid)
{
	// List of animation libraries used for preloading.
	new s_AnimationLibraries[][] =
	{
		{!"AIRPORT"},    	{!"ATTRACTORS"},   	{!"BAR"},          	{!"BASEBALL"},
		{!"BD_FIRE"},    	{!"BEACH"},        	{!"BENCHPRESS"},   	{!"BF_INJECTION"},
		{!"BIKED"},      	{!"BIKEH"},        	{!"BIKELEAP"},     	{!"BIKES"},
		{!"BIKEV"},      	{!"BIKE_DBZ"},     	{!"BMX"},          	{!"BOMBER"},
		{!"BOX"},        	{!"BSKTBALL"},     	{!"BUDDY"},        	{!"BUS"},
		{!"CAMERA"},     	{!"CAR"},          	{!"CARRY"},        	{!"CAR_CHAT"},
		{!"CASINO"},     	{!"CHAINSAW"},     	{!"CHOPPA"},       	{!"CLOTHES"},
		{!"COACH"},      	{!"COLT45"},       	{!"COP_AMBIENT"},  	{!"COP_DVBYZ"},
		{!"CRACK"},      	{!"CRIB"},         	{!"DAM_JUMP"},     	{!"DANCING"},
		{!"DEALER"},     	{!"DILDO"},       	{!"DODGE"},        	{!"DOZER"},
		{!"DRIVEBYS"},   	{!"FAT"},          	{!"FIGHT_B"},      	{!"FIGHT_C"},
		{!"FIGHT_D"},   	{!"FIGHT_E"},      	{!"FINALE"},       	{!"FINALE2"},
		{!"FLAME"},      	{!"FLOWERS"},      	{!"FOOD"},         	{!"FREEWEIGHTS"},
		{!"GANGS"},      	{!"GHANDS"},       	{!"GHETTO_DB"},    	{!"GOGGLES"},
		{!"GRAFFITI"},   	{!"GRAVEYARD"},    	{!"GRENADE"},      	{!"GYMNASIUM"},
		{!"HAIRCUTS"},   	{!"HEIST9"},       	{!"INT_HOUSE"},    	{!"INT_OFFICE"},
		{!"INT_SHOP"},   	{!"JST_BUISNESS"}, 	{!"KART"},         	{!"KISSING"},
		{!"KNIFE"},      	{!"LAPDAN1"},      	{!"LAPDAN2"},      	{!"LAPDAN3"},
		{!"LOWRIDER"},   	{!"MD_CHASE"},     	{!"MD_END"},       	{!"MEDIC"},
		{!"MISC"},       	{!"MTB"},          	{!"MUSCULAR"},     	{!"NEVADA"},
		{!"ON_LOOKERS"}, 	{!"OTB"},          	{!"PARACHUTE"},    	{!"PARK"},
		{!"PAULNMAC"},   	{!"PED"},          	{!"PLAYER_DVBYS"}, 	{!"PLAYIDLES"},
		{!"POLICE"},     	{!"POOL"},         	{!"POOR"},         	{!"PYTHON"},
		{!"QUAD"},       	{!"QUAD_DBZ"},     	{!"RAPPING"},      	{!"RIFLE"},
		{!"RIOT"},       	{!"ROB_BANK"},     	{!"ROCKET"},       	{!"RUSTLER"},
		{!"RYDER"},      	{!"SCRATCHING"},   	{!"SHAMAL"},       	{!"SHOP"},
		{!"SHOTGUN"},    	{!"SILENCED"},     	{!"SKATE"},        	{!"SMOKING"},
		{!"SNIPER"},     	{!"SPRAYCAN"},     	{!"STRIP"},        	{!"SUNBATHE"},
		{!"SWAT"},       	{!"SWEET"},        	{!"SWIM"},         	{!"SWORD"},
		{!"TANK"},       	{!"TATTOOS"},      	{!"TEC"},          	{!"TRAIN"},
		{!"TRUCK"},      	{!"UZI"},          	{!"VAN"},          	{!"VENDING"},
		{!"VORTEX"},     	{!"WAYFARER"},     	{!"WEAPONS"},      	{!"WUZI"},
		{!"WOP"},        	{!"GFUNK"},        	{!"RUNNINGMAN"}
	};
	for(new i = 0; i < sizeof(s_AnimationLibraries); i ++)
	{
		ApplyAnimation(actorid, s_AnimationLibraries[i], "null", 0.0, 0, 0, 0, 0, 0);
	}
}


//new WalkNpcBit[MAX_WALKNPC];
new Float:WalkNPCPosX[MAX_WALKNPC];
new Float:WalkNPCPosY[MAX_WALKNPC];
new Float:WalkNPCPosZ[MAX_WALKNPC];

stock Float:GetDistance2D(Float:x1, Float:y1, Float:x2, Float:y2) {
	return floatsqroot(
		((x1 - x2) * (x1 - x2)) +
		((y1 - y2) * (y1 - y2))
	);
}

enum walknpcInfo
{
    walknpc_Valid,
	walknpc_Name[MAX_PLAYER_NAME],
	walknpc_Skin,
	walknpc_StartNode,//-1
	walknpc_StartTime,//-1
	walknpc_EndTime,//-1
	walknpc_ID,//не сохранять
	walknpc_NextNode,//не сохранять
	walknpc_OldNode,//не сохранять
	walknpc_Nodes,//не сохранять
	walknpc_Created,//не сохранять
	walknpc_Timer//не сохранять
}
new WalkNPC[MAX_WALKNPC][walknpcInfo];

new WNPCStopped[MAX_WALKNPC];
new WNPCAnimated[MAX_WALKNPC];

#define MAX_WALKNODE 6144// 4096+2048
enum walknodeinfo
{
	walknodeValid,
	Float:walknodeX,
	Float:walknodeY,
	Float:walknodeZ,
	walkNodeGroupID,//-1
	walkNodeGroupName[32],
	walknextnode0,//0
	walknextnode1,//0
	walknextnode2,//0
	walknextnode3,//0
	walknodeshowed,//dontsave
	Text3D:walknodetext,//dontsave
}
new WalkNodeInfo[MAX_WALKNODE][walknodeinfo];

forward LoadWalkNPCs(i);
public LoadWalkNPCs(i)
{
	new query[255];
	format(query,sizeof(query),"SELECT Valid, Name, Skin, StartNode, StartTime, EndTime FROM walknpc WHERE id=%d",i);
	mysql_tquery(MySQL,query,"SQL_LoadWalkNPC","d",i);
	return 1;
}

forward SQL_LoadWalkNPC(i);
public SQL_LoadWalkNPC(i)
{
	new rows;
	cache_get_row_count(rows);
	if(rows)
	{
		cache_get_value_name_int(0,"Valid",WalkNPC[i][walknpc_Valid]);
		cache_get_value_name(0,"Name",WalkNPC[i][walknpc_Name],24);
		cache_get_value_name_int(0,"Skin",WalkNPC[i][walknpc_Skin]);
		cache_get_value_name_int(0,"StartNode",WalkNPC[i][walknpc_StartNode]);
		cache_get_value_name_int(0,"StartTime",WalkNPC[i][walknpc_StartTime]);
		cache_get_value_name_int(0,"EndTime",WalkNPC[i][walknpc_EndTime]);
		if(WalkNPC[i][walknpc_Valid]==1)
		{
			WalkNPC[i][walknpc_ID]=NPC_Create(WalkNPC[i][walknpc_Name]);
			printf("WNPC %d created, NPCID %d",i,WalkNPC[i][walknpc_ID]);
			//WalkNPC[i][walknpc_ID]=PED_Connect(WalkNPC[i][walknpc_Skin] ,WalkNodeInfo[WalkNPC[i][walknpc_StartNode]][walknodeX],WalkNodeInfo[WalkNPC[i][walknpc_StartNode]][walknodeY],WalkNodeInfo[WalkNPC[i][walknpc_StartNode]][walknodeZ], 0.0);
			WalkNPCPosX[i]=WalkNodeInfo[WalkNPC[i][walknpc_StartNode]][walknodeX];
			WalkNPCPosY[i]=WalkNodeInfo[WalkNPC[i][walknpc_StartNode]][walknodeY];
			WalkNPCPosZ[i]=WalkNodeInfo[WalkNPC[i][walknpc_StartNode]][walknodeZ];
			PlayeridToWNPCid[WalkNPC[i][walknpc_ID]]=i;
			//PED_SetWalkingStyle(WalkNPC[i][walknpc_ID], 1);
			//PreloadActorAnimations(WalkNPC[i][walknpc_ID]);
			WalkNPC[i][walknpc_Created]=1;
			//WalkNPCStartMove(i);
			
			printf("WalkNPC %d Load, skin %d node %d",i,WalkNPC[i][walknpc_Skin],WalkNPC[i][walknpc_StartNode]);
		}
	}
	else
	{
	    new query[128];
        format(query,sizeof(query),"INSERT INTO walknpc SET id=%d",i);
        mysql_query(MySQL,query,false);
	}
	i++;
	if(i<MAX_WALKNPC-1)
	{
		SetTimerEx("LoadWalkNPCs", 10, 0, "d", i);
	}
	return 1;
}


public OnNPCCreate(npcid)
{
	//WalkNPC[npcid][walknpc_ID]=npcid;
	//SetTimerEx("SpawnNPCTimer", 10, 0, "d", npcid);
	//dummy id
	SpawnNPCTimer(npcid);
    /*for(new i; i<MAX_WALKNPC; i++)
	{
		if(WalkNPC[i][walknpc_Valid]==1)
		{
            if(WalkNPC[i][walknpc_ID]==npcid)
            {
                //SetPlayerSkin(npcid,WalkNPC[i][walknpc_Skin]);
                //printf("skin %d setted",WalkNPC[i][walknpc_Skin]);
                //NPC_Spawn(npcid);
                //print("npc spawned");
                SetTimerEx("SpawnNPCTimer", 10000, 0, "dd", npcid,i);
                printf("npc %d wnpc %d start timer",npcid, i);
                return 1;
            }
        }
    }*/
    return 1;
}

forward SpawnNPCTimer(npcid);
public SpawnNPCTimer(npcid)
{
    //printf("npc %d wnpc %d spawned via timer",npcid,i);
    NPC_Spawn(npcid);
    SetTimerEx("WalkNPCStartMove", 10, 0, "d", PlayeridToWNPCid[npcid]);
    printf("npc %d walk start timer",npcid);
    //WalkNPCStartMove(i);
    return 1;
}
stock UpdateWalkNPC(i)
{
    new query[255];
    format(query,sizeof(query),"UPDATE walknpc SET Valid=%d, Name='%s', Skin=%d, StartNode=%d, StartTime=%d, EndTime=%d WHERE id=%d",
    WalkNPC[i][walknpc_Valid],
	WalkNPC[i][walknpc_Name],
	WalkNPC[i][walknpc_Skin],
	WalkNPC[i][walknpc_StartNode],
	WalkNPC[i][walknpc_StartTime],
	WalkNPC[i][walknpc_EndTime],
	i);
	mysql_query(MySQL,query,false);
	return 1;
}

stock LoadWalkNPCNodes()
{
	//MapAndreas_Init(MAP_ANDREAS_MODE_FULL, "scriptfiles/SAfull.hmap");
	//print("Report: MapAndreas Initialised.");
    new query[255];
	format(query,sizeof(query),"SELECT Valid, X, Y, Z, GroupID, GroupName, Node0, Node1, Node2, Node3 FROM walknpcnodes ORDER BY id ASC LIMIT %d",MAX_WALKNODE);
	mysql_tquery(MySQL,query,"SQL_LoadWalkNPCNodes");
	return 1;
}

forward SQL_LoadWalkNPCNodes();
public SQL_LoadWalkNPCNodes()
{
	new rows;
	cache_get_row_count(rows);
	if(rows < MAX_WALKNODE)
	{
		new query[255];
	    for(new i=rows; i<MAX_WALKNODE; i++)
		{
		    format(query,sizeof(query),"INSERT INTO walknpcnodes SET id=%d, Valid=0",i);
		    mysql_query(MySQL,query,false);
		}
		LoadWalkNPCNodes();
		return 1;
	}
	for(new i; i<rows; i++)
	{
		cache_get_value_name_int(i,"Valid",WalkNodeInfo[i][walknodeValid]);
		cache_get_value_name_float(i,"X",WalkNodeInfo[i][walknodeX]);
		cache_get_value_name_float(i,"Y",WalkNodeInfo[i][walknodeY]);
		cache_get_value_name_float(i,"Z",WalkNodeInfo[i][walknodeZ]);
		cache_get_value_name_int(i,"GroupID",WalkNodeInfo[i][walkNodeGroupID]);
		cache_get_value_name(i,"GroupName",WalkNodeInfo[i][walkNodeGroupName],32);
		cache_get_value_name_int(i,"Node0",WalkNodeInfo[i][walknextnode0]);
		cache_get_value_name_int(i,"Node1",WalkNodeInfo[i][walknextnode1]);
		cache_get_value_name_int(i,"Node2",WalkNodeInfo[i][walknextnode2]);
		cache_get_value_name_int(i,"Node3",WalkNodeInfo[i][walknextnode3]);

		#if defined DEBUG_LOAD
		printf("Node %d %d %s %d %d %d %d",i,WalkNodeInfo[i][walknodeValid],
		WalkNodeInfo[i][walkNodeGroupName],
		WalkNodeInfo[i][walknextnode0],
		WalkNodeInfo[i][walknextnode1],
		WalkNodeInfo[i][walknextnode2],
		WalkNodeInfo[i][walknextnode3]);
		#endif
	}
	SetTimerEx("LoadWalkNPCs", 30000, 0, "d", 0);
	return 1;
}

stock GetXYFromAngle(&Float:x, &Float:y, Float:a, Float:distance) 
{
    x += (distance*floatsin(-a,degrees));
    y += (distance*floatcos(-a,degrees));
}
stock ColorCounter()
{
	new color=random(9);
	switch(color)
	{
		case 0:
		{
		    return COLOR_YELLOW;
		}
		case 1:
		{
		    return COLOR_GREEN;
		}
		case 2:
		{
		    return COLOR_RED;
		}
		case 3:
		{
		    return COLOR_BLUE;
		}
		case 4:
		{
		    return JOB_MESSAGE;
		}
		case 5:
		{
		    return COLOR_PURPLES;
		}
		case 6:
		{
		    return COLOR_GRAD6;
		}
		case 7:
		{
		    return MASTER_MESSAGE;
		}
		case 8:
		{
		    return ADMIN_MESSAGE;
		}
		default:
		    return COLOR_ORANGERED;//
	}
	return COLOR_GREEN;
}
stock UpdateWalkNpcNode(i)
{
	new query[512];
    format(query,sizeof(query),"UPDATE walknpcnodes SET Valid=%d, X='%f', Y='%f', Z='%f', GroupID=%d, GroupName='%s', Node0=%d, Node1=%d, Node2=%d, Node3=%d WHERE id=%d",
	WalkNodeInfo[i][walknodeValid],
	WalkNodeInfo[i][walknodeX],
	WalkNodeInfo[i][walknodeY],
	WalkNodeInfo[i][walknodeZ],
	WalkNodeInfo[i][walkNodeGroupID],
	WalkNodeInfo[i][walkNodeGroupName],
	WalkNodeInfo[i][walknextnode0],//0
	WalkNodeInfo[i][walknextnode1],//0
	WalkNodeInfo[i][walknextnode2],//0
	WalkNodeInfo[i][walknextnode3],//0
	i);//-1
	mysql_query(MySQL,query,false);
	if(WalkNodeInfo[i][walknodeshowed])
    {
        DestroyDynamic3DTextLabel(WalkNodeInfo[i][walknodetext]);
     	WalkNodeInfo[i][walknodeshowed]=0;
	}
	if(WalkNodeInfo[i][walknodeValid]==1)
	{
		new labelstr[144];
	    format(labelstr,255,"%d\n%s\n%d\n%d\n%d\n%d",i,
	    WalkNodeInfo[i][walkNodeGroupName],
	    WalkNodeInfo[i][walknextnode0],
	    WalkNodeInfo[i][walknextnode1],
	    WalkNodeInfo[i][walknextnode2],
	    WalkNodeInfo[i][walknextnode3]);
	    WalkNodeInfo[i][walknodetext] = CreateDynamic3DTextLabel(labelstr,ColorCounter(),WalkNodeInfo[i][walknodeX],
		WalkNodeInfo[i][walknodeY],
		WalkNodeInfo[i][walknodeZ],100.0);
	    WalkNodeInfo[i][walknodeshowed]=1;
    }
    return 1;
}

COMMAND:wnpcnode(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]==0)return 1;
	if(isnull(params))
	{
		SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode list add delete e ed goto edit show hide nextnode0(не существует -1) nextnode1 nextnode2 nextnode3");
        SendClientMessage(playerid, COLOR_GRAD2, "findbignode");
		return 1;
	}
	new cmd[32],tmp[255];
 	sscanf(params, "s[32]s[255]", cmd,tmp);
	
	if(strcmp(cmd, "list", true) == 0)
	{
		new str[4096];
		format(str,4096,"ID\tGroupID\tGroupName\tn0\tn1\tn2\tn3\n");
		new start=1;
		if(!isnull(tmp))
		    start=strval(tmp);
		for(new i=start; i<MAX_WALKNODE; i++)
		{
			if(WalkNodeInfo[i][walknodeValid]==1)
			{
				format(str,4096,"%s%d\t%d\t%s\t%d\t%d\t%d\t%d\n",str,
				i,
				WalkNodeInfo[i][walkNodeGroupID],
				WalkNodeInfo[i][walkNodeGroupName],
				WalkNodeInfo[i][walknextnode0],//0
				WalkNodeInfo[i][walknextnode1],//0
				WalkNodeInfo[i][walknextnode2],//0
				WalkNodeInfo[i][walknextnode3]);
			}
		}
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST, "Список нод ходячих NPC", str, "OK", "");
		return 1;
	}
	else if(strcmp(cmd, "findbignode", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode findbignode [расстояние] [стартовая нода]");
		new Float:mindist;
		new startnode;
		new Float:dist;
		sscanf(tmp,"fd",mindist,startnode);
		if(startnode<1||startnode>MAX_WALKNODE)
			return SendClientMessage(playerid, COLOR_GRAD2, "Неправильная стартовая нода.");
			
		new str[255];
		for(new i=startnode; i<MAX_WALKNODE; i++)
		{
		    if(WalkNodeInfo[i][walknodeValid]==1)
		    {
		        if(WalkNodeInfo[i][walknextnode0]!=0)
		        {
			        dist=GetDistanceXYZtoXYZ(WalkNodeInfo[i][walknodeX],WalkNodeInfo[i][walknodeY],WalkNodeInfo[i][walknodeZ],
			        WalkNodeInfo[WalkNodeInfo[i][walknextnode0]][walknodeX],WalkNodeInfo[WalkNodeInfo[i][walknextnode0]][walknodeY],WalkNodeInfo[WalkNodeInfo[i][walknextnode0]][walknodeZ]);
			        if(dist>mindist)
			        {
						format(str,sizeof(str),"От %d(%s) к %d(%s) дистанция %0.1f",
						i,
						WalkNodeInfo[i][walkNodeGroupName],
						WalkNodeInfo[i][walknextnode0],
						WalkNodeInfo[WalkNodeInfo[i][walknextnode0]][walkNodeGroupName],
						dist);
						SendClientMessage(playerid,COLOR_YELLOW2,str);
			        }
		        }
		        if(WalkNodeInfo[i][walknextnode1]!=0)
		        {
			        dist=GetDistanceXYZtoXYZ(WalkNodeInfo[i][walknodeX],WalkNodeInfo[i][walknodeY],WalkNodeInfo[i][walknodeZ],
			        WalkNodeInfo[WalkNodeInfo[i][walknextnode1]][walknodeX],WalkNodeInfo[WalkNodeInfo[i][walknextnode1]][walknodeY],WalkNodeInfo[WalkNodeInfo[i][walknextnode1]][walknodeZ]);
			        if(dist>mindist)
			        {
						format(str,sizeof(str),"От %d(%s) к %d(%s) дистанция %0.1f",
						i,
						WalkNodeInfo[i][walkNodeGroupName],
						WalkNodeInfo[i][walknextnode1],
						WalkNodeInfo[WalkNodeInfo[i][walknextnode1]][walkNodeGroupName],
						dist);
						SendClientMessage(playerid,COLOR_YELLOW2,str);
			        }
		        }
		        if(WalkNodeInfo[i][walknextnode2]!=0)
		        {
			        dist=GetDistanceXYZtoXYZ(WalkNodeInfo[i][walknodeX],WalkNodeInfo[i][walknodeY],WalkNodeInfo[i][walknodeZ],
			        WalkNodeInfo[WalkNodeInfo[i][walknextnode2]][walknodeX],WalkNodeInfo[WalkNodeInfo[i][walknextnode2]][walknodeY],WalkNodeInfo[WalkNodeInfo[i][walknextnode2]][walknodeZ]);
			        if(dist>mindist)
			        {
						format(str,sizeof(str),"От %d(%s) к %d(%s) дистанция %0.1f",
						i,
						WalkNodeInfo[i][walkNodeGroupName],
						WalkNodeInfo[i][walknextnode2],
						WalkNodeInfo[WalkNodeInfo[i][walknextnode2]][walkNodeGroupName],
						dist);
						SendClientMessage(playerid,COLOR_YELLOW2,str);
			        }
		        }
		        if(WalkNodeInfo[i][walknextnode3]!=0)
		        {
			        dist=GetDistanceXYZtoXYZ(WalkNodeInfo[i][walknodeX],WalkNodeInfo[i][walknodeY],WalkNodeInfo[i][walknodeZ],
			        WalkNodeInfo[WalkNodeInfo[i][walknextnode3]][walknodeX],WalkNodeInfo[WalkNodeInfo[i][walknextnode3]][walknodeY],WalkNodeInfo[WalkNodeInfo[i][walknextnode3]][walknodeZ]);
			        if(dist>mindist)
			        {
						format(str,sizeof(str),"От %d(%s) к %d(%s) дистанция %0.1f",
						i,
						WalkNodeInfo[i][walkNodeGroupName],
						WalkNodeInfo[i][walknextnode3],
						WalkNodeInfo[WalkNodeInfo[i][walknextnode3]][walkNodeGroupName],
						dist);
						SendClientMessage(playerid,COLOR_YELLOW2,str);
			        }
		        }
		    }
		}
		return 1;
	}
	else if(strcmp(cmd, "ed", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode ed [ноды до четырех через пробел]");
		new node0,node1,node2,node3;
		sscanf(tmp,"dddd",node0,node1,node2,node3);
		for(new i=1; i<MAX_WALKNODE; i++)
		{
		    if(WalkNodeInfo[i][walknodeValid]==1)
			{
			    if(IsPlayerInRangeOfPoint(playerid,2.0,WalkNodeInfo[i][walknodeX],WalkNodeInfo[i][walknodeY],WalkNodeInfo[i][walknodeZ]))
			    {
			        if(node0!=0)
					WalkNodeInfo[i][walknextnode0]=node0;
					if(node1!=0)
						WalkNodeInfo[i][walknextnode1]=node1;//-1
					if(node2!=0)
						WalkNodeInfo[i][walknextnode2]=node2;//-1
					if(node3!=0)
						WalkNodeInfo[i][walknextnode3]=node3;
	                UpdateWalkNpcNode(i);
	                new str[144];
	                format(str,sizeof(str),"Вы изменили ноду id %d, для группы %d(%s), возможные ноды %d %d %d %d(0 - не используется)",
	                i,
	                WalkNodeInfo[i][walkNodeGroupID],
	                WalkNodeInfo[i][walkNodeGroupName],
	                WalkNodeInfo[i][walknextnode0],//0
					WalkNodeInfo[i][walknextnode1],//0
					WalkNodeInfo[i][walknextnode2],//0
					WalkNodeInfo[i][walknextnode3]);
					SendClientMessage(playerid,COLOR_WHITE,str);
			        return 1;
			    }
			}
		}
	    return 1;
	}
	else if(strcmp(cmd, "add", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode add [groupid] [groupname] [ноды до четырех через пробел]");
		new group,groupname[32],node0,node1,node2,node3;
		sscanf(tmp,"ds[32]dddd",group,groupname,node0,node1,node2,node3);
		for(new i=1; i<MAX_WALKNODE; i++)
		{
		    if(WalkNodeInfo[i][walknodeValid]==0)
			{
			    new Float:pos[3];
			    GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
			    WalkNodeInfo[i][walknodeValid]=1;
				WalkNodeInfo[i][walknodeX]=pos[0];
				WalkNodeInfo[i][walknodeY]=pos[1];
				WalkNodeInfo[i][walknodeZ]=pos[2];
				WalkNodeInfo[i][walkNodeGroupID]=group;
				format(WalkNodeInfo[i][walkNodeGroupName],32,"%s",groupname);
				if(node0!=0)
					WalkNodeInfo[i][walknextnode0]=node0;
				if(node1!=0)
					WalkNodeInfo[i][walknextnode1]=node1;//-1
				if(node2!=0)
					WalkNodeInfo[i][walknextnode2]=node2;//-1
				if(node3!=0)
					WalkNodeInfo[i][walknextnode3]=node3;
                UpdateWalkNpcNode(i);
                new str[144];
                format(str,sizeof(str),"Вы создали ноду id %d, для группы %d(%s), возможные ноды %d %d %d %d(0 - не используется)",
                i,
                WalkNodeInfo[i][walkNodeGroupID],
                WalkNodeInfo[i][walkNodeGroupName],
                WalkNodeInfo[i][walknextnode0],//0
				WalkNodeInfo[i][walknextnode1],//0
				WalkNodeInfo[i][walknextnode2],//0
				WalkNodeInfo[i][walknextnode3]);
				SendClientMessage(playerid,COLOR_WHITE,str);
				return 1;
			}
		}
	}
	else if(strcmp(cmd, "edit", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode edit [nodeid] [groupname] [ноды до четырех через пробел]");
		new i,groupname[32],node0,node1,node2,node3;
		sscanf(tmp,"ds[32]dddd",i,groupname,node0,node1,node2,node3);
		if(WalkNodeInfo[i][walknodeValid]==0)
		    return SendClientMessage(playerid,COLOR_RED,"Указанная нода не существует");
		format(WalkNodeInfo[i][walkNodeGroupName],32,"%s",groupname);
		if(node0!=0)
			WalkNodeInfo[i][walknextnode0]=node0;
		if(node1!=0)
			WalkNodeInfo[i][walknextnode1]=node1;//-1
		if(node2!=0)
			WalkNodeInfo[i][walknextnode2]=node2;//-1
		if(node3!=0)
			WalkNodeInfo[i][walknextnode3]=node3;
        UpdateWalkNpcNode(i);
        new str[144];
        format(str,sizeof(str),"Вы изменили ноду id %d, для группы %d(%s), возможные ноды %d %d %d %d(0 - не используется)",
        i,
        WalkNodeInfo[i][walkNodeGroupID],
        WalkNodeInfo[i][walkNodeGroupName],
        WalkNodeInfo[i][walknextnode0],//0
		WalkNodeInfo[i][walknextnode1],//0
		WalkNodeInfo[i][walknextnode2],//0
		WalkNodeInfo[i][walknextnode3]);
		SendClientMessage(playerid,COLOR_WHITE,str);
	}
	else if(strcmp(cmd, "e", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode e [nodeid] [groupname] [ноды до четырех через пробел]");
		new i,node0,node1,node2,node3;
		sscanf(tmp,"ddddd",i,node0,node1,node2,node3);
		if(WalkNodeInfo[i][walknodeValid]==0)
		    return SendClientMessage(playerid,COLOR_RED,"Указанная нода не существует");
		if(node0!=0)
			WalkNodeInfo[i][walknextnode0]=node0;
		if(node1!=0)
			WalkNodeInfo[i][walknextnode1]=node1;//-1
		if(node2!=0)
			WalkNodeInfo[i][walknextnode2]=node2;//-1
		if(node3!=0)
			WalkNodeInfo[i][walknextnode3]=node3;
        UpdateWalkNpcNode(i);
        new str[144];
        format(str,sizeof(str),"Вы изменили ноду id %d, для группы %d(%s), возможные ноды %d %d %d %d(0 - не используется)",
        i,
        WalkNodeInfo[i][walkNodeGroupID],
        WalkNodeInfo[i][walkNodeGroupName],
        WalkNodeInfo[i][walknextnode0],//0
		WalkNodeInfo[i][walknextnode1],//0
		WalkNodeInfo[i][walknextnode2],//0
		WalkNodeInfo[i][walknextnode3]);
		SendClientMessage(playerid,COLOR_WHITE,str);
	}
	else if(strcmp(cmd, "delete", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode delete [id ноды]");
		new i=strval(tmp);
		if(WalkNodeInfo[i][walknodeValid]==0)
		    return SendClientMessage(playerid,COLOR_RED,"Указанная нода не существует");
		WalkNodeInfo[i][walknodeValid]=0;
		WalkNodeInfo[i][walkNodeGroupID]=0;
		WalkNodeInfo[i][walknextnode0]=0;//0
		WalkNodeInfo[i][walknextnode1]=0;//0
		WalkNodeInfo[i][walknextnode2]=0;//0
		WalkNodeInfo[i][walknextnode3]=0;
		UpdateWalkNpcNode(i);
		new str[144];
		format(str,sizeof(str),"Вы удалили ноду %d",i);
		SendClientMessage(playerid,COLOR_WHITE,str);
		return 1;
	}
	else if(strcmp(cmd, "nextnode0", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode nextnode0 [nodeid] [nexnodeid ID Следующей ноды]");
  		new i, nextnode;
        sscanf(tmp,"dd",i,nextnode);
		if(WalkNodeInfo[i][walknodeValid]==0)
		{
		    return SendClientMessage(playerid,COLOR_RED,"Данная нода не существует");
		}
        WalkNodeInfo[i][walknextnode0]=nextnode;
        UpdateWalkNpcNode(i);
        new str[144];
		format(str,sizeof(str),"Вы установили для ноды %d следующую ноду %d",i,nextnode);
		SendClientMessage(playerid,COLOR_WHITE,str);
		return 1;
 	}
 	else if(strcmp(cmd, "nextnode1", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode nextnode1 [nodeid] [nexnodeid ID Следующей ноды]");
  		new i, nextnode;
        sscanf(tmp,"dd",i,nextnode);
		if(WalkNodeInfo[i][walknodeValid]==0)
		{
		    return SendClientMessage(playerid,COLOR_RED,"Данная нода не существует");
		}
        WalkNodeInfo[i][walknextnode1]=nextnode;
        UpdateWalkNpcNode(i);
        new str[144];
		format(str,sizeof(str),"Вы установили для ноды %d следующую ноду %d",i,nextnode);
		SendClientMessage(playerid,COLOR_WHITE,str);
		return 1;
 	}
 	else if(strcmp(cmd, "nextnode2", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode nextnode2 [nodeid] [nexnodeid ID Следующей ноды]");
  		new i, nextnode;
        sscanf(tmp,"dd",i,nextnode);
		if(WalkNodeInfo[i][walknodeValid]==0)
		{
		    return SendClientMessage(playerid,COLOR_RED,"Данная нода не существует");
		}
        WalkNodeInfo[i][walknextnode2]=nextnode;
        UpdateWalkNpcNode(i);
        new str[144];
		format(str,sizeof(str),"Вы установили для ноды %d следующую ноду %d",i,nextnode);
		SendClientMessage(playerid,COLOR_WHITE,str);
		return 1;
 	}
 	else if(strcmp(cmd, "nextnode3", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode nextnode3 [nodeid] [nexnodeid ID Следующей ноды]");
  		new i, nextnode;
        sscanf(tmp,"dd",i,nextnode);
		if(WalkNodeInfo[i][walknodeValid]==0)
		{
		    return SendClientMessage(playerid,COLOR_RED,"Данная нода не существует");
		}
        WalkNodeInfo[i][walknextnode3]=nextnode;
        UpdateWalkNpcNode(i);
        new str[144];
		format(str,sizeof(str),"Вы установили для ноды %d следующую ноду %d",i,nextnode);
		SendClientMessage(playerid,COLOR_WHITE,str);
		return 1;
 	}
 	else if(strcmp(cmd, "show", true) == 0)
	{
	    new labelstr[255];
	    for(new i=1; i<MAX_WALKNODE; i++)
		{
		    if(WalkNodeInfo[i][walknodeValid]==1)
			{
			    if(WalkNodeInfo[i][walknodeshowed])
			    {
			        DestroyDynamic3DTextLabel(WalkNodeInfo[i][walknodetext]);
			     	WalkNodeInfo[i][walknodeshowed] =0;
				}
			    format(labelstr,255,"%d\n%s\n%d\n%d\n%d\n%d",i,
			    WalkNodeInfo[i][walkNodeGroupName],
			    WalkNodeInfo[i][walknextnode0],
			    WalkNodeInfo[i][walknextnode1],
			    WalkNodeInfo[i][walknextnode2],
			    WalkNodeInfo[i][walknextnode3]);
			    WalkNodeInfo[i][walknodetext] = CreateDynamic3DTextLabel(labelstr,ColorCounter(),WalkNodeInfo[i][walknodeX],
				WalkNodeInfo[i][walknodeY],
				WalkNodeInfo[i][walknodeZ],100.0);
                WalkNodeInfo[i][walknodeshowed] =1;
			}
		}
		SendClientMessage(playerid,COLOR_WHITE,"Все ноды отображены");
		return 1;
	}
	else if(strcmp(cmd, "hide", true) == 0)
	{
	    for(new i=1; i<MAX_WALKNODE; i++)
		{

		    if(WalkNodeInfo[i][walknodeshowed])
		    {
		        DestroyDynamic3DTextLabel(WalkNodeInfo[i][walknodetext]);
		     	WalkNodeInfo[i][walknodeshowed] =0;
			}

		}
		SendClientMessage(playerid,COLOR_WHITE,"Все ноды скрыты");
	}
	else if(strcmp(cmd, "goto", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode goto [nodeid]");
  		new i;
        sscanf(tmp,"d",i);
		if(WalkNodeInfo[i][walknodeValid]==0)
		{
		    return SendClientMessage(playerid,COLOR_RED,"Данная нода не существует");
		}
		SetPlayerPos(playerid,WalkNodeInfo[i][walknodeX],
		WalkNodeInfo[i][walknodeY],
		WalkNodeInfo[i][walknodeZ]);
		new str[144];
		format(str,sizeof(str),"Вы телепортированы к ноде %d",i);
		SendClientMessage(playerid,COLOR_WHITE,str);
	}
	else
	{
	    return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcnode list add delete e goto edit show hide nextnode0(не существует -1) nextnode1 nextnode2 nextnode3");
	}
	return 1;
}

COMMAND:wnpc(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]==0)return 1;
	if(isnull(params))
		return SendClientMessage(playerid, COLOR_GRAD2, "/wnpc list add delete check stopall startall restartall");
	new cmd[32],tmp[255];
	sscanf(params, "s[32]s[255]", cmd,tmp);
	if(strcmp(cmd, "list", true) == 0)
	{
	    new start=0;
	    if(!isnull(tmp))
	        start=strval(tmp);
		new str[4096];
		format(str,4096,"ID\tName\tSkin\tStartNode\n");
		for(new i=start; i<MAX_WALKNPC; i++)
		{
			if(WalkNPC[i][walknpc_Valid]==1)
			{
				format(str,4096,"%s%d\t%s\t%d\t%d\n",str,
				i,
				WalkNPC[i][walknpc_Name],
				WalkNPC[i][walknpc_Skin],
				WalkNPC[i][walknpc_StartNode]);
			}
		}
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_TABLIST, "Список ходячих NPC", str, "OK", "");
		return 1;
	}
	else if(strcmp(cmd, "check", true) == 0)
	{
		new Float:pos[3];
	    for(new i=0; i<MAX_WALKNPC; i++)
		{
		    if(WalkNPC[i][walknpc_Valid]==1)
			{
				NPC_GetPos(WalkNPC[i][walknpc_ID],pos[0],pos[1],pos[2]);
				if(IsPlayerInRangeOfPoint(playerid,5.0,pos[0],pos[1],pos[2]))
				{
				    new str[144];
				    format(str,sizeof(str),"ID %d, %s(%d), skin %d, start %d, old %d, next %d",
				    i,
				    WalkNPC[i][walknpc_Name],
				    WalkNPC[i][walknpc_ID],
				    WalkNPC[i][walknpc_Skin],
  					WalkNPC[i][walknpc_StartNode],
    				WalkNPC[i][walknpc_OldNode],
					WalkNPC[i][walknpc_NextNode]);
    				SendClientMessage(playerid,COLOR_YELLOW2,str);
				    return 1;
				}
			}
		}
	    return 1;
	}
	else if(strcmp(cmd, "add", true) == 0)
	{
	    new name[MAX_PLAYER_NAME],skinid,statrtnode,starttime,endtime;
	    if(sscanf(tmp,"s[24]dddd",name,skinid,statrtnode,starttime,endtime))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpc [Имя] [Скин] [Стартовая нода] [Время появления(если -1 не используется)] [Время исчезновения(если -1 не используется)]");
        if(WalkNodeInfo[statrtnode][walknodeValid]==0)
		{
		    return SendClientMessage(playerid,COLOR_RED,"Указанная стартовая нода не существует");
		}
		for(new i=0; i<MAX_WALKNPC; i++)
		{
		    if(WalkNPC[i][walknpc_Valid]==0)
			{
			    WalkNPC[i][walknpc_Valid]=1;
				format(WalkNPC[i][walknpc_Name],24,"%s",name);
				WalkNPC[i][walknpc_Skin]=skinid;
				WalkNPC[i][walknpc_StartNode]=statrtnode;
				WalkNPC[i][walknpc_StartTime]=starttime;
				WalkNPC[i][walknpc_EndTime]=endtime;
				UpdateWalkNPC(i);
				new str[144];
				format(str,sizeof(str),"Вы создали ходячего NPC %d(%s) Скин %d, Стартовая нода %d, Время появления %d, исзчезновения %d",
				i,
				WalkNPC[i][walknpc_Name],
				WalkNPC[i][walknpc_Skin],
				WalkNPC[i][walknpc_StartNode],
				WalkNPC[i][walknpc_StartTime],
				WalkNPC[i][walknpc_EndTime]
				);
				SendClientMessage(playerid,COLOR_WHITE,str);
				WalkNPC[i][walknpc_ID]=NPC_Create(WalkNPC[i][walknpc_Name]);
			
				//WalkNPC[i][walknpc_ID]=PED_Connect(WalkNPC[i][walknpc_Skin] ,WalkNodeInfo[WalkNPC[i][walknpc_StartNode]][walknodeX],WalkNodeInfo[WalkNPC[i][walknpc_StartNode]][walknodeY],WalkNodeInfo[WalkNPC[i][walknpc_StartNode]][walknodeZ], 0.0);
				PlayeridToWNPCid[WalkNPC[i][walknpc_ID]]=i;
				//PED_SetWalkingStyle(WalkNPC[i][walknpc_ID], 1);

				WalkNPC[i][walknpc_Created]=1;
				//WalkNPCStartMove(i);
			    return 1;
			}
		}
	}
	else if(strcmp(cmd, "delete", true) == 0)
	{
	    if(isnull(tmp))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcdelete [ID NPC]");
		new i=strval(tmp);
		if(WalkNPC[i][walknpc_Valid]==0)
		    return SendClientMessage(playerid,COLOR_RED,"Данного NPC не существует");
        WalkNPC[i][walknpc_Valid]=0;
        if(WalkNPC[i][walknpc_Created]==1)
        {
	        WalkNPC[i][walknpc_Created]=0;
			NPC_Destroy(WalkNPC[i][walknpc_ID]);
		}
		UpdateWalkNPC(i);
        new str[144];
		format(str,sizeof(str),"Вы удалили ходячего NPC %d",i);
		SendClientMessage(playerid,COLOR_WHITE,str);
		return 1;
	}
	else if(strcmp(cmd, "stopall", true) == 0)
	{
		for(new i=0; i<MAX_WALKNPC; i++)
		{
		    if(WalkNPC[i][walknpc_Valid]==1)
			{
				NPC_StopMove(WalkNPC[i][walknpc_ID]);
			}
		}
		SendClientMessage(playerid,COLOR_WHITE,"Все ходячие остановлены");
	}
	else if(strcmp(cmd, "startall", true) == 0)
	{
		for(new i=0; i<MAX_WALKNPC; i++)
		{
		    if(WalkNPC[i][walknpc_Valid]==1)
			{
				NPC_Move(WalkNPC[i][walknpc_ID], WalkNodeInfo[WalkNPC[i][walknpc_NextNode]][walknodeX], WalkNodeInfo[WalkNPC[i][walknpc_NextNode]][walknodeY], WalkNodeInfo[WalkNPC[i][walknpc_NextNode]][walknodeZ], 1);
			}
		}
		SendClientMessage(playerid,COLOR_WHITE,"Все ходячие запущены");
	}
	else if(strcmp(cmd, "restartall", true) == 0)
	{
		for(new i=0; i<MAX_WALKNPC; i++)
		{
		    if(WalkNPC[i][walknpc_Valid]==1)
			{
				WalkNPCStartMove(i);
			}
		}
		SendClientMessage(playerid,COLOR_WHITE,"Все ходячие перезапущены");
	}
	return 1;
}
forward WalkNPCStartMove(i);
public WalkNPCStartMove(i)
{
    WalkNPC[i][walknpc_NextNode]=WalkNPC[i][walknpc_StartNode];
    WalkNPC[i][walknpc_OldNode]=WalkNPC[i][walknpc_StartNode];
    new thisnodeid=WalkNPC[i][walknpc_OldNode];
	NPC_SetPos(WalkNPC[i][walknpc_ID],WalkNodeInfo[thisnodeid][walknodeX],WalkNodeInfo[thisnodeid][walknodeY],WalkNodeInfo[thisnodeid][walknodeZ]);
    WNPCNextNode(i);
    printf("wnpc %d, nodeid %d walk started",i,thisnodeid);
	return 1;
}

public OnNPCFinishMove(npcid)
{
    printf("NPC %d, finish move",npcid);
	//NPC_StopMove(npcid);
	//new i=PlayeridToWNPCid[npcid];
	//PlayeridToWNPCid[WalkNPC[i][walknpc_ID]]=i;
	//SetTimerEx("WNPCNextNode", 100, 0, "d", PlayeridToWNPCid[npcid]);
	WNPCNextNode(npcid);
	return 1;
}
forward WNPCNextNode(npcid);
public WNPCNextNode(npcid)
{
    new i=npcid;
	new thisnodeid=WalkNPC[i][walknpc_NextNode];
	new nd[5];
	new mnodes=0;
    if(WalkNodeInfo[thisnodeid][walknextnode0]>0 && WalkNodeInfo[thisnodeid][walknextnode0]!=WalkNPC[i][walknpc_OldNode])
    {
        nd[mnodes]=WalkNodeInfo[thisnodeid][walknextnode0];
        mnodes++;
    }
    if(WalkNodeInfo[thisnodeid][walknextnode1]>0 && WalkNodeInfo[thisnodeid][walknextnode1]!=WalkNPC[i][walknpc_OldNode])
    {
        nd[mnodes]=WalkNodeInfo[thisnodeid][walknextnode1];
        mnodes++;
    }
    if(WalkNodeInfo[thisnodeid][walknextnode2]>0 && WalkNodeInfo[thisnodeid][walknextnode2]!=WalkNPC[i][walknpc_OldNode])
    {
        nd[mnodes]=WalkNodeInfo[thisnodeid][walknextnode2];
        mnodes++;
    }
    if(WalkNodeInfo[thisnodeid][walknextnode3]>0 && WalkNodeInfo[thisnodeid][walknextnode3]!=WalkNPC[i][walknpc_OldNode])
    {
        nd[mnodes]=WalkNodeInfo[thisnodeid][walknextnode3];
        mnodes++;
    }
    new nextnode,nextnodeid;
    if(mnodes==0)
    {
        if(WalkNodeInfo[thisnodeid][walknextnode0]>0)
        {
            nextnodeid=WalkNodeInfo[thisnodeid][walknextnode0];
        }
        else if(WalkNodeInfo[thisnodeid][walknextnode1]>0)
        {
            nextnodeid=WalkNodeInfo[thisnodeid][walknextnode1];
        }
        else if(WalkNodeInfo[thisnodeid][walknextnode2]>0)
        {
            nextnodeid=WalkNodeInfo[thisnodeid][walknextnode2];
        }
        else if(WalkNodeInfo[thisnodeid][walknextnode3]>0)
        {
            nextnodeid=WalkNodeInfo[thisnodeid][walknextnode3];
        }
    }
    else
    {
    	nextnode=random(mnodes);
		nextnodeid=nd[nextnode];
	}
   	WalkNPC[i][walknpc_OldNode]=thisnodeid;
	WalkNPC[i][walknpc_NextNode]=nextnodeid;
	//NPC_StopMove(WalkNPC[i][walknpc_ID]);
	//NPC_SetPos(WalkNPC[i][walknpc_ID],WalkNodeInfo[thisnodeid][walknodeX],WalkNodeInfo[thisnodeid][walknodeY],WalkNodeInfo[thisnodeid][walknodeZ]);
	NPC_Move(WalkNPC[i][walknpc_ID], WalkNodeInfo[WalkNPC[i][walknpc_NextNode]][walknodeX], WalkNodeInfo[WalkNPC[i][walknpc_NextNode]][walknodeY], WalkNodeInfo[WalkNPC[i][walknpc_NextNode]][walknodeZ], 1);
/*    new str[144];
	format(str,sizeof(str),"[NPC %d(%s), current node %d, next node %d]",i,WalkNPC[i][walknpc_Name],thisnodeid,nextnodeid);
	ProxDetector(40.0, WalkNPC[i][walknpc_ID], str, COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
*/
	printf("wnpc %d, moved to nextnode %d",i,nextnodeid);
	return 1;
}

forward WalkNPCStop(i);
public WalkNPCStop(i)
{
    if(WNPCStopped[i]==0)
    {
        WNPCStopped[i]=1;
    }
	return 1;
}

#define MAX_WNPCAnims 64
enum wnpcamininfo
{
	wnpcaValid,
	wnpcaName[64],
	wnpcaAnimlib[64],
	wnpcaAnimname[64],
	Float:wnpcafDelta,
	wnpcaloop,
	wnpcalockx,
	wnpcalocky,
	wnpcafreeze,
	wnpcatime
};
new WNPCAnimationList[MAX_WNPCAnims][wnpcamininfo];

stock LoadWNPCAnims()
{
	print("LoadWNPCAnims");
	new query[255];
	format(query,255,"SELECT * FROM wnpcanims ORDER BY id ASC LIMIT %d", MAX_WNPCAnims);
	mysql_pquery(MySQL, query, "SQL_LoadWNPCAnims");
	return 1;
}

forward SQL_LoadWNPCAnims();
public SQL_LoadWNPCAnims()
{
	new rows;
	cache_get_row_count(rows);
	new i;
	for(i=0;i<rows;i++)
	{
	    cache_get_value_name_int(i,"wnpcaValid",WNPCAnimationList[i][wnpcaValid]);
	    cache_get_value_name(i,"wnpcaName",WNPCAnimationList[i][wnpcaName],64);
	    cache_get_value_name(i,"wnpcaAnimlib",WNPCAnimationList[i][wnpcaAnimlib],64);
	    cache_get_value_name(i,"wnpcaAnimname",WNPCAnimationList[i][wnpcaAnimname],64);

		cache_get_value_name_float(i,"wnpcafDelta",WNPCAnimationList[i][wnpcafDelta]);
		cache_get_value_name_int(i,"wnpcaloop",WNPCAnimationList[i][wnpcaloop]);
		cache_get_value_name_int(i,"wnpcalockx",WNPCAnimationList[i][wnpcalockx]);
		cache_get_value_name_int(i,"wnpcalocky",WNPCAnimationList[i][wnpcalocky]);
		cache_get_value_name_int(i,"wnpcafreeze",WNPCAnimationList[i][wnpcafreeze]);
		cache_get_value_name_int(i,"wnpcatime",WNPCAnimationList[i][wnpcatime]);

	}
	if(rows<MAX_WNPCAnims)
	{
		new query[144];
		for(new a=i;a<MAX_WNPCAnims;a++)
		{
			format(query,sizeof(query),"INSERT INTO wnpcanims SET id=%d",a);
			mysql_query(MySQL,query, false);
		}
	}

	return 1;
}
stock SaveWNPCAnim(i)
{
	new query[1024];
	format(query,1024,"UPDATE wnpcanims SET wnpcaValid=%d, wnpcaName='%s', wnpcaAnimlib='%s', wnpcaAnimname='%s', wnpcafDelta='%f', wnpcaloop=%d, wnpcalockx=%d, wnpcalocky=%d, wnpcafreeze=%d, wnpcatime=%d WHERE id=%d",
	WNPCAnimationList[i][wnpcaValid],
	WNPCAnimationList[i][wnpcaName],
	WNPCAnimationList[i][wnpcaAnimlib],
	WNPCAnimationList[i][wnpcaAnimname],
	WNPCAnimationList[i][wnpcafDelta],
	WNPCAnimationList[i][wnpcaloop],
	WNPCAnimationList[i][wnpcalockx],
	WNPCAnimationList[i][wnpcalocky],
	WNPCAnimationList[i][wnpcafreeze],
	WNPCAnimationList[i][wnpcatime],
	i);
	mysql_query(MySQL,query, false);
	return 1;
}

COMMAND:wnpcanim(playerid,params[])
{
    if(PlayerInfo[playerid][pAdmin]==0)return 1;
	new cmd[32],tmp[255];
	sscanf(params, "s[32]s[255]", cmd,tmp);
	if(!strlen(cmd))
		return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcanim list add delete");
	if(strcmp(cmd, "list", true) == 0)
	{
		ShowWNPCAnimList(playerid,0);
		return 1;
	}
	else if(strcmp(cmd, "add", true) == 0)
	{
	    new lib[64],animname[64],Float:fdelta,loop,lockx,locky,afreeze,time,name[64];
		if(sscanf(tmp, "s[64]s[64]fiiiiis[64]",lib,animname,fdelta,loop,lockx,locky,afreeze,time,name))
		{
			SendClientMessage(playerid, COLOR_GRAD2, "/wnpcanim add [AninLib] [AnimName] [fDelta] [loop] [lockx] [locky] [freeze] [time] [название для списка]");
			SendClientMessage(playerid, COLOR_GRAD2, "Стандартные значения(все равно задавать): fDelta = 4.1, loop = 0, lockx = 1, locky = 1, freeze = 0, time = 1");
			return 1;
		}
		for(new i=0;i<MAX_WNPCAnims;i++)
		{
			if(WNPCAnimationList[i][wnpcaValid]==0)
			{
				
				WNPCAnimationList[i][wnpcaValid]=1;
				format(WNPCAnimationList[i][wnpcaName],64,"%s",name);
				format(WNPCAnimationList[i][wnpcaAnimlib],64,"%s",lib);
				format(WNPCAnimationList[i][wnpcaAnimname],64,"%s",animname);
				WNPCAnimationList[i][wnpcafDelta]=fdelta;
				WNPCAnimationList[i][wnpcaloop]=loop;
				WNPCAnimationList[i][wnpcalockx]=lockx;
				WNPCAnimationList[i][wnpcalocky]=locky;
				WNPCAnimationList[i][wnpcafreeze]=afreeze;
				WNPCAnimationList[i][wnpcatime]=time;
				new str[144];
				format(str,144,"Вы создали анимацию %s(%d)",WNPCAnimationList[i][wnpcaName],i);
				SendClientMessage(playerid,COLOR_GREEN,str);
				SaveWNPCAnim(i);
				return 1;

			}
		}
	}
	else if(strcmp(cmd, "delete", true) == 0)
	{
	    new i;
		if(sscanf(tmp, "i",i))
			return SendClientMessage(playerid, COLOR_GRAD2, "/wnpcanim delete [id анимации]");
		if(WNPCAnimationList[i][wnpcaValid]==0)
			return SendClientMessage(playerid, COLOR_GRAD2, "Указанная анимация не существует");
		WNPCAnimationList[i][wnpcaValid]=0;
		SaveWNPCAnim(i);
		new str[144];
		format(str,sizeof(str),"Вы удалили анимацию %s(%d)",WNPCAnimationList[i][wnpcaName],i);
		SendClientMessage(playerid,COLOR_GRAD2,str);
		return 1;
	}
	return 1;
}

stock ShowWNPCAnimList(playerid,start)
{
	new str[4096];
	new m;
	new n;
	for(new i=start;i<MAX_WNPCAnims;i++)
	{
		if(WNPCAnimationList[i][wnpcaValid]==1)
		{
			//strmid(strsmall,QuestInfo[i][questName], 0, 32, 32);
			format(str,4096,"%s%d|%s|%s|%s|%f|%d|%d|%d|%d|%d\n",str,i,
			WNPCAnimationList[i][wnpcaName],
			WNPCAnimationList[i][wnpcaAnimlib],
			WNPCAnimationList[i][wnpcaAnimname],
			WNPCAnimationList[i][wnpcafDelta],
			WNPCAnimationList[i][wnpcaloop],
			WNPCAnimationList[i][wnpcalockx],
			WNPCAnimationList[i][wnpcalocky],
			WNPCAnimationList[i][wnpcafreeze],
			WNPCAnimationList[i][wnpcatime]);
			m=i;
			n++;
			if(n==64)break;
		}
	}
	format(str,4096,"%s%d|Следующая", str,m);
	ShowPlayerDialog(playerid,625,DIALOG_STYLE_LIST,"Список анимаций:",str,"Выбор","Отмена");
	return 1;
}

stock ShowWNPCAnim(playerid,const inputtext[])
{
	new i,strm[128];
	sscanf(inputtext,"p<|>ds[128]",i,strm);
	if(strcmp(strm ,"Следующая", true ) == 0 )
	{
		ShowWNPCAnimList(playerid,i);
		return 1;
	}
	return 1;
}

stock SetWnpcAnimList(playerid)
{
    new str[4096];
	format(str,4096,"Позвать прохожего за собой\n");
	for(new i;i<MAX_WNPCAnims;i++)
	{
		if(WNPCAnimationList[i][wnpcaValid]==1)
		{
			format(str,4096,"%s%d|%s\n",str,i,
			WNPCAnimationList[i][wnpcaName]);
		}
	}
	ShowPlayerDialog(playerid,730,DIALOG_STYLE_LIST,"Список анимаций для прохожего:",str,"Выбор","Отмена");
	return 1;
}

stock SetWNPCAnim(playerid,listitem,const inputtext[])
{
	if(listitem==0)
	{
		//пошли со мной мой друг
		//PED_FollowPlayer(WalkNPC[SelectedPlayerid[playerid]][walknpc_ID],playerid);//,true);
		return 1;
	}
    new i,strm[128];
	sscanf(inputtext,"p<|>ds[128]",i,strm);
    ApplyAnimation(WalkNPC[SelectedPlayerid[playerid]][walknpc_ID],
	WNPCAnimationList[i][wnpcaAnimlib],
	WNPCAnimationList[i][wnpcaAnimname],
	WNPCAnimationList[i][wnpcafDelta],
	WNPCAnimationList[i][wnpcaloop],
	WNPCAnimationList[i][wnpcalockx],
	WNPCAnimationList[i][wnpcalocky],
	WNPCAnimationList[i][wnpcafreeze],
	WNPCAnimationList[i][wnpcatime]);
	WNPCAnimated[SelectedPlayerid[playerid]]=1;
	return 1;
}

COMMAND:findnpc(playerid,params[])
{
	if(FindClosestWNPCAndStopIT(playerid))
		SendClientMessage(playerid,COLOR_YELLOW2,"Я нашел пешехода, отображаю меню действий");
	else
		SendClientMessage(playerid,COLOR_YELLOW2,"Нет пешеходов в радиусе обзора");
	return 1;
}

forward FindClosestWNPCAndStopIT(playerid);
public FindClosestWNPCAndStopIT(playerid)
{
	new wnpcid = -1;
	wnpcid=GetClosestWNPC(playerid);
	if (wnpcid != -1)
    {
        NPC_StopMove(WalkNPC[wnpcid][walknpc_ID]);
		SelectedPlayerid[playerid]=wnpcid;
		SetWnpcAnimList(playerid);
		return 1;
	}
	return 0;
}

stock GetClosestWNPC(playerid)
{
	new biz=-1;
	new Float:dist=99999.9;
	new Float:pos[6];
	new Float:dist2;
	GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	for(new i; i<MAX_WALKNPC; i++)
	{
		if(WalkNPC[i][walknpc_Valid]==1)
		{
            NPC_GetPos(WalkNPC[i][walknpc_ID], pos[3],pos[4],pos[5]);
            dist2=GetDistanceXYZtoXYZ(pos[0],pos[1],pos[2],pos[3],pos[4],pos[5]);
            if(dist2<dist)
            {
                dist=dist2;
                biz=i;
            }
		}
	}
	if(dist>3.0) return -1;
	return biz;
}

stock FCNPC_GetClosestPlayer(Float:mx, Float:my, Float:mz, &Float:cdist = 65000.0)
{
	new cid = -1;
	new Float:dist;

	foreach (new i : Player)
	{
		dist = GetPlayerDistanceFromPoint(i, mx, my, mz);
		if (dist < cdist)
		{
			cdist = dist;
			cid = i;
		}

	}
	return cid;
}