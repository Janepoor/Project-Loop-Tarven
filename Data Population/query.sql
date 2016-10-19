--The average integer height of player who have highest shooting accuracy
select AVG(p.height)::int from player p where p.shootaccuracy >= ALL(select p2.shootaccuracy from player p2);
--The number of user who has commented on everygame
select COUNT(lt.userid) from ltuser lt where NOT EXISTS (select g.gameid from game g where g.gameid NOT IN (select c.gameid from comment_written_about c where c.userid=lt.userid));
--Which team has not yet owned a championship
select b.teamid from basketball_team_runned b EXCEPT select b.teamid from basketball_team_runned b, championship_achieved champ where b.teamid=champ.teamid;

select lt.username, g.place from ltuser lt inner join comment_written_about c on lt.userid=c.userid inner join game g on g.gameid=c.gameid;

