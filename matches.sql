/* There are 10  team. Write an sql query such that each team play with every other team just once. */

drop table teams;
create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams values ('1', 'AAA');
insert into teams values ('2', 'BBB');
insert into teams values ('3', 'CCC');
insert into teams values ('4', 'DDDD');
insert into teams values ('5', 'EEEE');
insert into teams values ('6', 'FFFF');
insert into teams values ('7', 'GGGG');
insert into teams values ('8', 'HHHH');
insert into teams values ('9', 'IIII');
insert into teams values ('10', 'JJJJ');
commit;

select * from teams


select * from teams as t1
 join teams as t2 on t1.team_code<>t2.team_code


 with matches as
	(	select row_number() over (order by team_name) as ID, team_code, team_name 
		from teams t )
select team.team_name as team, opponent.team_name as opponet
from matches team
join matches opponent on team.id < opponent.id


 with matches as
	(	select row_number() over (order by team_name) as ID, team_code, team_name 
		from teams t )
select team.team_name as team, opponent.team_name as opponet
from matches team
join matches opponent on team.id <> opponent.id