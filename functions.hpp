class BLU
{
	class mission
	{
		class initHostage {};
		class initLaptop {};
		class markPrison {};
		class incrementCrewCounter {};
		class decrementCrewCounter {};
		class updateCrewStatusDead {};
		class missionFlow {};
		class evaluateEnd {};
		class initCivilians {};
		class incrementCivilianCounter {};
		class initDeadCrewman {};
	}
	class ambience
	{
		class radiochatterRussian {};
		class introText {};
	}
	class discovery
	{
		class siteSearch {};
		class siteManager {};
		class makeRequest {};
		class resetNamespace {};
		class getDiscoverySites 
		{
			postInit = 1;
		};
	}
	class reinforcements
	{
		class getRoads {};
		class getSpawnPoints 
		{
			postInit = 1;
		};
		class initReinforceSystem {};
		class registerCaller {};
		class sendCall {};
		class reinforcementController {};
		class spawnReinforcements {};
		class sendReinforcements {};
	}
	class helpers
	{
		class getTimeDifference {};
		class toLowerNoun {};
		class getLoadout {};
	}
	class playerManagement
	{
		class getIsLeader {};
		class organiseGroup {};
		class getIsPlayer {};
		class initBriefing {};
		class initLoadouts {};
		class addLocalRespawn {};
	}
}