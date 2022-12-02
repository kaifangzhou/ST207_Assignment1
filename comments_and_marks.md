## ST207 - ASSIGNMENT 1

Feedback and provisional marks

### DATABASE DESIGN

#### A: Conceptual model design (max 20 points)

Overall it is a good conceptual model. You have mapped most of the entities, attributes and relationship correctly. These are some points that could be improved in your model:
1) We can see that player,coach,manager and umpire have some common attributes. I think it would better that we can treat personnel as superclass and player, coach,manager and umpire as subclasses. You can check out our lecture note week 2 part 1 for details.  
2) We don't have to draw foreign key attributes to the entity in conceptual model. For example, Team_ID attribute for Managers entity. 
3) The relationships between Teams, Umpires and Games are confusing. Why not seperate the relationship lines? (connect Teams with Games, and connect Umpires with Games)


#### B: E-R diagram (max 25 points)
Overall the E-R diagram is well designed based on the conceptual model in part A. 
However, the crow's foot notations are all in the wrong direction. For each relationshop line, the crow's foot notations should be other way around. 

#### C. Database creation (CREATE TABLE commands) (max 10 points)

Excellent!

#### D. Data loading (INSERT TABLE commands) (max 5 points)

Excellent!

### DATABASE MANIPULATION (DML)

#### E: Correctly retrieving/displaying all information (max 10 points)

It is good that you used VIEW statement for this question. However, you need to list all teams, their corresponding managers, coaches, and players.
I can only see Team_name, TEAM_ID, First_name and Last_name for each person, no information could be found for the roles that they have. There should be ome more column in your output to denote the role (manager, coach or player) for each person. 

#### F: Correctly retrieving/displaying all information (max 10 points)

Excellent!

#### G: Correctly retrieving/displaying all information (max 10 points)

Excellent! 

#### H: Correctly retrieving/displaying all information (max 10 points)

Excellent!

### General comment: please submit the file with correct names next time. For example, you submitted conceptual model using E-R diagram as file name. Same mistake for the other file constains E-R diagram, you used conceptual model as its file name. 


## Your points

|Question | Max points| Your points|
|:--------|-----------:|-----------:|
|A 	 |      	20|      	14|
|B 	 |      	25|      	15|
|C   |      	10|      	10|
|D   |      	 5|      	5|
|E   |        10|       6|
|F 	 |      	10|       10|
|G 	 |      	10|       10|
|H   |      	10|       10|
|Total |     100|     	80|
