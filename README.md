
	Design

	/api/v1/players > StatsController > Players Context > Queries (Filter, Order, Pagination) > DB > Response
	
	lib
		- players
			- schemas
				stats.ex
			- queries
				stats_queries.ex
				
			players.ex
		
		- players_web
			- api/v1 
				stats_controller.ex
				fallback_controller.ex
				
		nfl_rush.ex
	
	__________________________________________________________________________________________________________________________________________________
	
	Rules:
	
	Create a webpage which displays a table with the contents of rushing.json
	The user should be able to sort the players by Total Rushing Yards, Longest Rush and Total Rushing Touchdowns
	The user should be able to filter by the player's name
	The user should be able to download the sorted data as a CSV, as well as a filtered subset
		
	__________________________________________________________________________________________________________________________________________________
		
	Data:
	
		Player (Player's name) > player_name

		Team (Player's team abbreviation) > team_name

		Pos (Player's postion) > player_position

		Att/G (Rushing Attempts Per Game Average) > avg_attempts:float

		Att (Rushing Attempts) > rushing_attempts:integer

		Yds (Total Rushing Yards) > total_yards:integer

		Avg (Rushing Average Yards Per Attempt) > avg_yards_per_attempt:float

		Yds/G (Rushing Yards Per Game) > yards_per_game:integer
		
		TD (Total Rushing Touchdowns) > touchdowns:integer
		
		Lng (Longest Rush -- a T represents a touchdown occurred) > longest_rush:integer
		
		Lng (Longest Rush -- a T represents a touchdown occurred) > longest_rush_tuchdown:boolean
		
		1st (Rushing First Downs) > first_downs:integer
		
		1st% (Rushing First Down Percentage) > first_down_percent:float
		
		20+ (Rushing 20+ Yards Each) > plus_20_yards:integer
		
		40+ (Rushing 40+ Yards Each) > plus_40_yards:integer
		
		FUM (Rushing Fumbles) > rushing_fumbles:integer
	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	