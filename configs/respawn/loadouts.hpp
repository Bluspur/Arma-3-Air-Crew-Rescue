class CfgRoles
{
	class Rifleman
	{
		displayName = "Rifleman";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};
	class HeavyWeapons
	{
		displayName = "Heavy Weapons";
		icon = "\A3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa";
	};
	class Medic
	{
		displayName = "Medic";
		icon = "\A3\Ui_f\data\GUI\Cfg\RespawnRoles\support_ca.paa";
	};
	class Recon
	{
		displayName = "Recon";
		icon = "\A3\Ui_f\data\GUI\Cfg\RespawnRoles\recon_ca.paa";
	};
};

class CfgRespawnInventory
{
	class GER_TeamLeader
	{
		displayName = "German TL";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Rifleman";
		show = "true";
		uniformClass = "CUP_U_B_GER_Flecktarn_6";
		backpack = "";
		weapons[] = {
			"CUP_arifle_G36A",
			"CUP_Vector21Nite",
			"CUP_hgun_glock17_flashlight",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"SmokeShellRed",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_HandGrenade_M67",
			"B_IR_Grenade",
			"SmokeShellGreen",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17"};
		items[] = {
			"FirstAidKit",
			"CUP_NVG_PVS7"};
		linkedItems[] = {
			"CUP_V_B_GER_PVest_Fleck_TL",
			"CUP_H_Ger_M92_Cover_GG_CB",
			"CUP_G_PMC_Facewrap_Black_Glasses_Ember",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"",
			"",
			"CUP_optic_G36DualOptics_PIP",
			"",
			"",
			"",
			"",
			""};
	};
	class GER_AntiTank
	{
		displayName = "German AT";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "HeavyWeapons";
		show = "true";
		uniformClass = "CUP_U_B_GER_Flecktarn_6";
		backpack = "CUP_B_GER_Backpack_PZF_Fleck";
		weapons[] = {
			"CUP_launch_HCPF3_Loaded",
			"CUP_arifle_G36A",
			"CUP_Vector21Nite",
			"CUP_hgun_glock17_flashlight",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"SmokeShellRed",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"B_IR_Grenade",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17"};
		items[] = {
			"FirstAidKit",
			"CUP_NVG_PVS7"};
		linkedItems[] = {
			"CUP_V_B_GER_PVest_Fleck_RFL_LT",
			"CUP_H_Ger_M92_Cover_GG_CB",
			"CUP_PMC_Facewrap_Black",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"",
			"",
			"CUP_optic_G36DualOptics_PIP",
			"",
			"",
			"",
			"",
			""};
	};
	class GER_Medic
	{
		displayName = "German Medic";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Medic";
		show = "true";
		uniformClass = "CUP_U_B_GER_Flecktarn_5";
		backpack = "CUP_B_GER_Backpack_Medic_Fleck";
		weapons[] = {
			"CUP_arifle_G36A",
			"CUP_Vector21Nite",
			"CUP_hgun_glock17_flashlight",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"SmokeShellRed",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"B_IR_Grenade",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17"};
		items[] = {
			"FirstAidKit",
			"CUP_NVG_PVS7",
			"Medikit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit"};
		linkedItems[] = {
			"CUP_V_B_GER_PVest_Fleck_Med_LT",
			"CUP_H_Ger_M92_Cover_GG_CF",
			"CUP_G_Oakleys_Drk",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"",
			"",
			"CUP_optic_G36DualOptics_PIP",
			"",
			"",
			"",
			"",
			""};
	};
	class GER_Marksman
	{
		displayName = "German Marksman";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Recon";
		show = "true";
		uniformClass = "CUP_U_B_GER_Flecktarn_2";
		backpack = "";
		weapons[] = {
			"CUP_arifle_HK417_20_Scope",
			"CUP_hgun_glock17_flashlight",
			"CUP_Vector21Nite",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_20Rnd_762x51_HK417",
			"CUP_20Rnd_762x51_HK417",
			"CUP_20Rnd_762x51_HK417",
			"CUP_20Rnd_762x51_HK417",
			"CUP_20Rnd_762x51_HK417",
			"CUP_20Rnd_762x51_HK417",
			"CUP_20Rnd_762x51_HK417",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"B_IR_Grenade",
			"SmokeShellRed",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17"};
		items[] = {
			"FirstAidKit",
			"CUP_NVG_PVS7"};
		linkedItems[] = {
			"CUP_V_B_GER_PVest_Fleck_RFL",
			"CUP_H_Ger_M92_Cover_GG_CB",
			"CUP_G_Oakleys_Embr",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"",
			"",
			"CUP_optic_SB_11_4x20_PM_pip",
			"",
			"",
			"",
			"",
			""};
	};
	class GER_MachineGunner
	{
		displayName = "German MG3";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "HeavyWeapons";
		show = "true";
		uniformClass = "CUP_U_B_GER_Flecktarn_2";
		backpack = "CUP_B_GER_Backpack_MG3_Fleck";
		weapons[] = {
			"CUP_lmg_MG3",
			"CUP_Vector21Nite",
			"CUP_hgun_glock17_flashlight",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"B_IR_Grenade",
			"SmokeShellRed",
			"CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17",
			"CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",
			"CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"};
		items[] = {
			"FirstAidKit",
			"CUP_NVG_PVS7"};
		linkedItems[] = {
			"CUP_V_B_GER_PVest_Fleck_MG_LT",
			"CUP_H_Ger_M92_Cover_GG_CB",
			"CUP_G_Oakleys_Drk",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			""};
	};
	class GER_Rifleman
	{
		displayName = "German Rifleman";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Rifleman";
		show = "true";
		uniformClass = "CUP_U_B_GER_Flecktarn_2";
		backpack = "";
		weapons[] = {
			"CUP_arifle_G36A",
			"CUP_Vector21Nite",
			"CUP_hgun_glock17_flashlight",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"SmokeShellRed",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"B_IR_Grenade",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17"};
		items[] = {
			"FirstAidKit",
			"CUP_NVG_PVS7"};
		linkedItems[] = {
			"CUP_V_B_GER_PVest_Fleck_RFL",
			"CUP_H_Ger_M92_Cover",
			"CUP_G_PMC_Facewrap_Black_Glasses_Dark",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"",
			"",
			"CUP_optic_G36DualOptics_PIP",
			"",
			"",
			"",
			"",
			""};
	};
	class GER_Grenadier
	{
		displayName = "German Grenadier";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Rifleman";
		show = "true";
		uniformClass = "CUP_U_B_GER_Flecktarn_6";
		backpack = "CUP_B_GER_Backpack_GL_Fleck";
		weapons[] = {
			"CUP_arifle_AG36",
			"CUP_Vector21Nite",
			"CUP_hgun_glock17_flashlight",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"B_IR_Grenade",
			"SmokeShellRed",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17",
			"CUP_17Rnd_9x19_glock17",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_556x45_G36",
			"CUP_FlareWhite_M203",
			"CUP_FlareWhite_M203",
			"CUP_FlareWhite_M203",
			"CUP_FlareWhite_M203",
			"CUP_1Rnd_SmokeRed_M203",
			"CUP_1Rnd_SmokeRed_M203",
			"CUP_1Rnd_SmokeRed_M203",
			"CUP_1Rnd_SmokeRed_M203",
			"Laserbatteries",
			"B_IR_Grenade"};
		items[] = {
			"FirstAidKit",
			"CUP_NVG_PVS7"};
		linkedItems[] = {
			"CUP_V_B_GER_PVest_Fleck_Gren_LT",
			"CUP_H_Ger_M92_Cover_GG",
			"CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"",
			"",
			"CUP_optic_G36DualOptics_PIP",
			"",
			"",
			"",
			"",
			""};
	};
	class CZE_TeamLeader
	{
		displayName = "Czech TL";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Rifleman";
		show = "true";
		uniformClass = "CUP_U_B_CZ_WDL_NoKneepads";
		backpack = "CUP_B_ACRScout_m95_M4";
		weapons[] = {
			"CUP_arifle_CZ805_A1_ZDDot_Laser",
			"CUP_hgun_Duty_M3X",
			"CUP_Vector21Nite",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"SmokeShell",
			"B_IR_Grenade",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_30Rnd_556x45_Stanag",
			"SmokeShell",
			"SmokeShellRed"};
		items[] = {
			"FirstAidKit"};
		linkedItems[] = {
			"CUP_V_CZ_NPP2006_co_vz95",
			"CUP_H_CZ_Helmet03",
			"CUP_G_ESS_BLK",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"ItemGPS",
			"CUP_NVG_PVS7_Hide",
			"",
			"acc_pointer_IR",
			"CUP_optic_ZDDot",
			"",
			"",
			"",
			"",
			""};
	};
	class CZE_AutoRifleman
	{
		displayName = "Czech Minimi";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "HeavyWeapons";
		show = "true";
		uniformClass = "CUP_U_B_CZ_WDL_Kneepads_Gloves";
		backpack = "";
		weapons[] = {
			"CUP_lmg_minimi_railed_ElcanM145",
			"CUP_hgun_Phantom_Flashlight",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_18Rnd_9x19_Phantom",
			"CUP_18Rnd_9x19_Phantom",
			"CUP_18Rnd_9x19_Phantom",
			"CUP_18Rnd_9x19_Phantom",
			"SmokeShell",
			"SmokeShellRed",
			"CUP_100Rnd_TE4_Green_Tracer_556x45_M249",
			"CUP_100Rnd_TE4_Green_Tracer_556x45_M249",
			"CUP_100Rnd_TE4_Green_Tracer_556x45_M249",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67"};
		items[] = {
			"FirstAidKit"};
		linkedItems[] = {
			"CUP_V_CZ_vest11",
			"CUP_H_CZ_Helmet03",
			"CUP_G_ESS_BLK",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"CUP_NVG_PVS7_Hide",
			"",
			"",
			"CUP_optic_ElcanM145_PIP",
			"",
			"",
			"",
			"",
			""};
	};
	class CZE_AntiTank
	{
		displayName = "Czech AT";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "HeavyWeapons";
		show = "true";
		uniformClass = "CUP_U_B_CZ_WDL_NoKneepads";
		backpack = "CUP_B_ACRScout_m95_MAAWS";
		weapons[] = {
			"CUP_arifle_CZ805_A2",
			"CUP_hgun_Duty_M3X",
			"CUP_launch_MAAWS_Scope",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"SmokeShell",
			"SmokeShell",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"CUP_MAAWS_HEAT_M",
			"CUP_MAAWS_HEDP_M"};
		items[] = {
			"FirstAidKit"};
		linkedItems[] = {
			"CUP_V_CZ_NPP2006_vz95",
			"CUP_H_CZ_Helmet03",
			"CUP_G_ESS_BLK",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"CUP_NVG_PVS7_Hide",
			"",
			"",
			"",
			"",
			"",
			"",
			"CUP_optic_MAAWS_Scope",
			""};
	};
	class CZE_Medic
	{
		displayName = "Czech Medic";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Medic";
		show = "true";
		uniformClass = "CUP_U_B_CZ_WDL_Kneepads_Gloves";
		backpack = "CUP_B_ACRPara_m95_Medic";
		weapons[] = {
			"CUP_arifle_CZ805_A2",
			"CUP_hgun_Compact",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"SmokeShell",
			"SmokeShell",
			"CUP_10Rnd_9x19_Compact",
			"CUP_10Rnd_9x19_Compact",
			"CUP_10Rnd_9x19_Compact",
			"CUP_10Rnd_9x19_Compact"};
		items[] = {
			"FirstAidKit",
			"Medikit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit"};
		linkedItems[] = {
			"CUP_V_CZ_vest09",
			"CUP_H_CZ_Helmet03",
			"CUP_G_ESS_BLK",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"CUP_NVG_PVS7_Hide",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			""};
	};
	class CZE_Marksman
	{
		displayName = "Czech Marksman";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Recon";
		show = "true";
		uniformClass = "CUP_U_B_CZ_WDL_Kneepads_Gloves";
		backpack = "";
		weapons[] = {
			"CUP_srifle_SVD_pso",
			"CUP_hgun_Duty_M3X",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_10Rnd_762x54_SVD_M",
			"CUP_10Rnd_762x54_SVD_M",
			"CUP_10Rnd_762x54_SVD_M",
			"CUP_10Rnd_762x54_SVD_M",
			"CUP_10Rnd_762x54_SVD_M",
			"CUP_10Rnd_762x54_SVD_M",
			"CUP_10Rnd_762x54_SVD_M",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag"};
		items[] = {
			"FirstAidKit"};
		linkedItems[] = {
			"CUP_V_CZ_NPP2006_vz95",
			"CUP_H_CZ_Helmet04",
			"",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"CUP_NVG_PVS7_Hide",
			"",
			"",
			"CUP_optic_PSO_1",
			"",
			"",
			"",
			"",
			""};
	};
	class CZE_Rifleman
	{
		displayName = "Czech Rifleman";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Rifleman";
		show = "true";
		uniformClass = "CUP_U_B_CZ_WDL_NoKneepads";
		backpack = "CUP_B_ACRPara_m95_Ammo";
		weapons[] = {
			"CUP_arifle_CZ805_A1_ZDDot_Laser",
			"CUP_hgun_Duty_M3X",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"SmokeShell",
			"SmokeShell",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"CUP_30Rnd_Sa58_M",
			"CUP_30Rnd_Sa58_M",
			"CUP_30Rnd_Sa58_M",
			"CUP_30Rnd_Sa58_M",
			"CUP_30Rnd_Sa58_M",
			"CUP_30Rnd_Sa58_M",
			"CUP_PipeBomb_M",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"SmokeShell",
			"SmokeShell",
			"SmokeShellRed"};
		items[] = {
			"FirstAidKit"};
		linkedItems[] = {
			"CUP_V_CZ_NPP2006_vz95",
			"CUP_H_CZ_Helmet04",
			"",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"CUP_NVG_PVS7_Hide",
			"",
			"acc_pointer_IR",
			"CUP_optic_ZDDot",
			"",
			"",
			"",
			"",
			""};
	};
	class CZE_Grenadier
	{
		displayName = "Czech Grenadier";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
		role = "Rifleman";
		show = "true";
		uniformClass = "CUP_U_B_CZ_WDL_Kneepads_Gloves";
		backpack = "CUP_B_ACRScout_m95_M4";
		weapons[] = {
			"CUP_arifle_CZ805_GL_ZDDot_Laser",
			"CUP_hgun_Duty_M3X",
			"Throw",
			"Put"};
		magazines[] = {
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"CUP_30Rnd_556x45_CZ805",
			"16Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"CUP_HandGrenade_M67",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HEDP_M203",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_30Rnd_556x45_Stanag",
			"SmokeShell",
			"SmokeShellRed"};
		items[] = {
			"FirstAidKit"};
		linkedItems[] = {
			"CUP_V_CZ_NPP2006_vz95",
			"CUP_H_CZ_Helmet03",
			"CUP_G_ESS_BLK",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio",
			"CUP_NVG_PVS7_Hide",
			"",
			"acc_pointer_IR",
			"CUP_optic_ZDDot",
			"",
			"",
			"",
			"",
			""};
	};

}