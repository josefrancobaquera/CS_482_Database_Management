/*
   Group Number: 2
   Group Names: Jose Franco Baquera, Kevin Hindman, and Michael Daviet
   Due Date:  September 30, 2018
   Project: Phase 1 (20 points)
   Purpose: The purpose of this project phase is to create a MySQ; database with information
   about Offensive NFL players.

*/

/* *******NOTE: Assume that this database is for past, current, and future NFL season offensive players and games. ******** */

/* Creating the table "Players" */
create table Players (

   /* Assume that the name of every NFL player that ever existed
   (and will ever exist) will be at most 30 characters. We also assume
   that the Player's name will always be known (i.e. that's why 
   we include the not null contraint). That is, a player will always have 
   a name. We also not that the Name attribute will always consist of both
   the players' first and last name. */
   Name varchar(30) not null,
   
   /* PlayerID will be the primary key, so it can never be null.
   In addition, assume that the smallest allowed value for PlayerID is 0 
   and that the largest allowed value is 99999. That is, the database 
   will support only having 100,000 past, current, and future offensive players, 
   which is more than enough for both players and "free agents". Make sure that 
   the PlayerID is not negative and that it never exceeds 99999. */
   PlayerID int not null check( PlayerID >= 0 and PlayerID <= 99999 ),
   
   /* The largest team name in the NFL is the Tampa Bay Buccaneers, which is 22
   characters in length (including spaces). Assume that no NFL team's name 
   will ever be larger than 25 characters. NOTE: A Player can be 
   a "free agent", meaning that his team name is "unkown" or "undefined". Therefore, 
   we should allow this value to be NULL (i.e. DO NOT include the "not null" contraint). */
   TeamName varchar(25),
   
   /* Assume that each player can only play as a 'QB', 'RB', or 'WR' position. That is, a player 
   cannot play two or more position types and cannot have a NULL position type. 
   Assume that the position of the player will always be known (i.e. a player will always 
   have a position). */
   Position char(2) not null check ( Position = 'QB' or Position = 'RB' or Position = 'WR' ),
   
   /* Check that the number of touchdowns equals to 0 or more. That is, 
   a player cannot have a negative number of touchdowns. The touchdowns 
   can also never be NULL since we assume that each player's touchdowns will
   always be known. In addition, check that the number of touchdowns is never 
   greater than 500 (i.e. the current all-time record is 208 by Jerry Rice). Assume 
   that no player will ever score 501 or more touchdowns. */
   Touchdowns int not null check( Touchdowns >= 0 and Touchdowns <= 500 ),

   /* We note that the TotalYards will always be known, so check that it
   is never null. In addition, TotalYards can be BOTH negative OR 
   positive. Therefore, allow both negative and positive values to be entered.
   In addition, no upper or lower "limits" will be checked. Assume that the data 
   entered will always be correct (i.e. not checking for a lower or upper limit allows
   the database to be more "free"). */
   TotalYards int not null,
   
   /* Assume the salaray is YEARLY and not cummlative. Furthermore, this DOES 
   NOT include insentitives. That is, this is the salary that NFL pays to their 
   players. In addition, assume that the salary is always known. Check that the 
   salary is NOT negative. Assume that 1 = $1, 2 = $2, etc. In addition, 
   make this numeric since NFL players make millions of dollars and a couple 
   of cents are irrevelant, so it wouldn't make sense to make this a 
   numeric type. We also do not have an upper limit since salaries vary widely.
   In addition, not having an upper limit will allow the database to take into 
   account inflation.*/
   Salary int not null check( Salary >= 0 ),
   
   /* The primary key of the Players relation is PlayerID. This will also make PlayerID unique. */
   primary key ( PlayerID )
   
);

/* Creating the table "Games" */
create table Games (
   
   /* GameID will be a primary key, so it can never be NULL. 
   In addition, assume that the smallest allowed value for GameID is 0 
   and that the largest allowed value is 99999. That is, the database 
   will support only having 100,000 games. This should be 
   enough for all past, present, and future games NFL games. */
   GameID int not null check( GameID >= 0 and GameID <= 99999),
   
   /* Date will be a SQL date type. This attribute should also never be
   NULL since game dates will always be known. In addition, the NFL was founded 
   on Agust 20, 1920, so no game could have been done before this date.
   Check that the data is never less than that date. */
   Date date not null check( '1920-08-20' <= Date ),
   
   /* Assume that the longest-named stadium is 30 characters in length. 
   The Stadium attribute should also never be NULL since we assume that
   the game's location will always be known.  */
   Stadium varchar(30) not null,
   
   /* The Result attribute will always be 1 character in length.
   In addition, the Result of a particular Game can never be unkown.
   Therefore, add a constraint that will guarantee that it is never 
   NULL. In addition, check that Result is always 'W', 'L', or 'T.' */
   Result char(1) not null check( Result = 'W' or Result = 'L' or Result = 'T' ),
   
   /* The largest stadium in the United States holds 107,601 people.
   Assume that a game will never have a higher attendence than 150,000.
   We also need to check that the attendance is never negative. In addition,
   assume that the attendance will be caculated by counting the amount of tickets
   sold. Furthmore, we cannot have a negative attendance. */
   Attendance int not null check(Attendance >= 0 and Attendance <= 150000),
   
   /* Assume that Ticket Revenue will always be known, so the value 
   can never be NULL. In addition, check that the TicketRevenue is 
   never negative. */
   TicketRevenue int not null check(TicketRevenue >= 0 ),
  
   /* The primary key of the Games relation is GameID. This will also make GameID unique. */
   primary key ( GameID )
   
);

/* Creating the table "Play" */
create table Play (

   /*PlayerID can never be null since it is one of the attributes needed for the relation's
   primary key. In addition, make sure that it is within the range of allowed
   player IDs.*/
   PlayerID int not null check( PlayerID >= 0 and PlayerID <= 99999 ),
   
   /*GameID can never be null since it is one of the attributes needed for the relation's
   primary key. In addition, make sure that it is within the range of allowed
   game IDs.*/
   GameID int not null check( GameID >= 0 and GameID <= 99999 ),
   
   /* The primary key is a combination of the two attributes. */
   primary key( PlayerID, GameID ),
   
   /* Make sure that PlayerID and GameID only contain values already declared in 
   the previous two table. If a player or game is deleted, cascade the relevant touple
   by using the "on delete cascade" command. */
   foreign key( PlayerID ) references Players( PlayerID ) on delete cascade,
   foreign key( GameID ) references Games( GameID ) on delete cascade
      
);












