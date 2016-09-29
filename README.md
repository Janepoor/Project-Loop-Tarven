# HOOP TAVERN - Wiki, schedule and recommendations  for basketball fanatics
### License

Team Yulong Qiao(yq2212) & Jianpu Ma(jm4437)

### Objective
This web application provides the following functions:
 - Team Wiki - User gets access to detailed information about one basketball team by searching, including precise player profile, game schedule, team management and other supporting details
 - Data Analysis - User obtains data analysis & comparison between teams
 - Thoughts Share - User shares thoughts by commenting on a particular game and rating it
 - Recommendation System - User receives recommendations about future games to watch based on algorithms taking user behavior and user identity categories as input

### Challenging Part

 - Correct and efficient coding for a comparatively complicated ER diagram.
 - Algorithm design and realization of data analysis and recommendation system.

### Interesting Part

 - A panoramic display of basketball teams
 - “Enemy-Recommendation”: a user consecutively rating low one team’s games indicates that he/she is a fan of  its “enemy team”, thus mutating the recommendation priority
 - Algorithms tracking user’s behavior thus customizing the recommendation

### Modify History

 - Set`Web` as `Basketball_Team`’s attribute instead of an entity
 - Remove `Constitutes` relationship between `Player` and `Basketball_Team`, add `PlayerID` as `Player`'s primary key
 - Switch `Payment` from the attribute of `Manager` to the attribute of the `Runs` relationship. For entity `Manager`, add one more attribute `ManagerID` and set it as the only primary key
 - Add `CompanyID` attribute of entity `Company`, and set it as the only primary key; remove attribute `Board`
 - Remove attribute `Searchlist` of relationship `Searches` between `User` and `BasketBall_Team`, add `Searchtime`
 - Reset relationship `Comments` to entity, link it to `User` and `Game` through relationship `Writes` and `About`. Now the attributes of `Comments` are primary key `CommentID`, `CommentTime`, `Rate` and `Content`
 - Reset attribute `Score` of entity `Game` to attribute of relationship `Plays`. Rephrase attribute `GameNumber` of entity `Game` to `GameID`
 - Remove attribute `Season` of entity `Championship`, redesign attribute `Coach` of entity `Basketball_Team`












 


