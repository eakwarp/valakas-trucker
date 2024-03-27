new PlayerAnim[MAX_PLAYERS];
new gPlayerUsingLoopingAnim[MAX_PLAYERS];
new gPlayerAnimLibsPreloaded[MAX_PLAYERS];
new Text:txtAnimHelper;

stock PreloadAnimLibs(playerid)
{
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
	return 1;
}

forward ClearAnims(playerid);
public ClearAnims(playerid)
{
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0);
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

COMMAND:animlist(playerid,params[])
{
    SendClientMessage(playerid,0xAFAFAFAA," ƒÓÒÚÛÔÌ˚Â ‡ÌËÏ‡ˆËË:");
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
			return SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /bat [1-2]");
		new animationplayed = strval(params);
		switch(animationplayed)
		{
			case 1:
				LoopingAnim(playerid,"CRACK","Bbalbat_Idle_01",4.1,0,1,1,1,1);
			case 2:
				LoopingAnim(playerid,"CRACK","Bbalbat_Idle_02",4.1,0,1,1,1,1);
			default: SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /bat [1-2]");
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
			return SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /gsigns [1-10]");
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
			default: return SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /gsigns [1-10]");
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
			return SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /ncrack [1-7]");
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
			    return SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /ncrack [1-7]");
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
			return SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /gangs [1-9]");
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
			default: return SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /gangs [1-9]");
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
			return SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /bar [1-3]");
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
			    return SendClientMessage(playerid,COLOR_GRAD2,"»—œŒÀ‹«Œ¬¿Õ»≈: /bar [1-3]");
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
		Me(playerid,"‰ÓÒÚ‡Î ÒË„‡ÂÚÛ Ë Á‡ÍÛËÎ", 5.0);
	}
	return 1;
}
COMMAND:asmoke(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
        if (!strlen(params))
			return SendClientMessage(playerid,0xFF0000FF," »ÒÔÓÎ¸ÁÛÈÚÂ: /asmoke [1-4]");
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
				return SendClientMessage(playerid,0xFF0000FF," »ÒÔÓÎ¸ÁÛÈÚÂ:: /asmoke [1-4]");
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
			return SendClientMessage(playerid,0xFF0000FF," »ÒÔÓÎ¸ÁÛÈÚÂ: /dance [ÒÚËÎ¸ 1-7]");
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
				return SendClientMessage(playerid,0xFF0000FF," »ÒÔÓÎ¸ÁÛÈÚÂ: /dance [ÒÚËÎ¸ 1-7]");
		}
	}
	return 1;
}
forward OnPlayerDeathAnim(playerid, killerid, reason);
public OnPlayerDeathAnim(playerid, killerid, reason)
{
	if(gPlayerUsingLoopingAnim[playerid])
	{
        gPlayerUsingLoopingAnim[playerid] = 0;
        TextDrawHideForPlayer(playerid,txtAnimHelper);
	}
	return 1;
}