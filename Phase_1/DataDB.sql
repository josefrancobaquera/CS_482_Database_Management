
/*
	Group Number: 2
   Group Names: Jose Franco Baquera, Kevin Hindman, and Michael Daviet
   Due Date:  September 30, 2018
   Project: Phase 1 (20 points)
   Purpose: The purpose of this project phase is to create a MySQ; database with information
   about Offensive NFL players.

*/

/* Adding 5 new players into the Players relation. NOTE: These are just random data and may not be
100% accurate.*/
insert into Players values ( 'Alex Smith', 8081, 'Washington Redskins', 'QB', 4, 767, 40000000 );
insert into Players values ( 'Antonio Brown', 1129,  'Pittsburgh Steelers', 'WR', 1, 160, 17000000 );
insert into Players values (  'Kapri Bibbs', 1204, 'Washington Redskins', 'RB', 0, 3, 622065 );
insert into Players values (  'DeAndre Hopkins', 9111, 'Houston Texans', 'WR', 1, 274, 16200000 );
insert into Players values ( 'Aaron Rodgers', 8910, 'Green Bay Packers', 'QB', 6, 832, 66900000 );

/* Adding 5 new games into the Games relation. NOTE: These are just random data and may not be
100% accurate.*/
insert into Games values (10204, '2018-08-30', 'M&T Bank Stadium', 'L', 12000, 1589001 );
insert into Games values (14029, '2018-08-18', 'NRG Stadium', 'W', 52000, 8193199 );
insert into Games values (20019, '2018-09-16', 'Lambeau Field', 'T', 78461, 5991003 );
insert into Games values (12303, '2018-09-16', 'FedEx Field', 'L', 71000, 10987104 );
insert into Games values (30001, '2018-09-09', 'FirstEnergy Stadium', 'T', 68000, 7987019 );


/* Adding 5 new plays into the Play relation. */
insert into Play values ( 1204, 10204 );
insert into Play values ( 9111, 14029 );
insert into Play values ( 8910,  20019 );
insert into Play values ( 8081,  12303 );
insert into Play values ( 1129, 30001 );
