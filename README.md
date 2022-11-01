# ST207_Assignment1
Assignment 1 (Baseball Database) for LSE ST207, MT2022

Contained within this repository are my solutions to Assignment 1 of LSE's ST207 Databases class. 

Contents include:
1. Organized and sectioned source code SQLite script (to be executed in DB Browser) for creating, populating, and querying tables.
2. Entity-Relationship (ER) Model for Database Design
3. Conceptual Mode for Database Design





Instructions::

You have been given 3 different miniworld descriptions in a textual form. Pick one miniworld description and provide solutions for the following questions:

Design a conceptual model for the chosen miniworld (question A): Refer to Weeks 1 and 2 materials (and any additional source) to build your model. Make sure you specify all entities and their corresponding attributes, including primary keys, whether an attribute vill be single or composite, single-valued or multivalued and any other description discussed in the lectures and seminars. Do the same with the relationships: you should specify whether an entity is weak or not, partial and total participation, and the corresponding cardinalities to all relationships. You MUST use (min,max) notation for that. You can also use EER concepts, such as class/subclass or union types to map all specialisation and generalisation relationships (if any). Lastly, make sure you choose proper names for your entities, attributes and relationships, mapping the real context of the chosen miniworld. Remember that you will need to code some SQL commands later and these names should be easy to understand. You can use LucidChart, Draw.io or any other software for conceptual modelling. Once you finished, export your diagram as a PNG or PDF file and upload it into GitHub.

Transpose your conceptual model into an Entity-Relationship model (E-R) (question B): create an Entity-Relationship (E-R) diagram mapping your conceptual model. Remember to map all entities, attributes, and relationships as close as possible to your conceptual model - this means that any modification/adjustment in your E-R should be carefully assessed - for instance, in Week 2 we discussed whether a composite attribute, such as SName (FName, MName, LName), should be mapped as three distinct attributes (FName, MName, LName) or an unique attribute into the E-R model. Explore all the optional and mandatory relationships (remember that this refers to partial and total participation) and use those you think more appropriate to the chosen miniworld. You can use LucidChart, Draw.io or any other software for conceptual modelling. Once you finished, export your diagram as a PNG or PDF file and upload it into GitHub.

For each miniworld, provide SQL commands to answer the corresponding questions (questions C-H). You can use any SQL resource (join, nested queries, aggregate functions etc). Make sure your SQL commands retrieve the correct data. Do not worry about performance or execution time, number of lines in your code, and any other aspect other than the correctness of your answers. You can use i) a terminal, ii) DB Browser, or iii) a Python program to create and access your database. Once you finished, upload your source code (all SQL commands for creating, inserting, and querying your database) into GitHub.

Remember that this is a 2-step submission process: once you have all your files on GitHub, copy the link to your GitHub repository and submit it through Moodle (Coursework submissions section).


Miniworld 1: BASEBALL database
Consider a database system for a baseball organisation such as the major league. The data requirements are summarised as follows:

The personnel involved in the league include players, coaches, managers, and umpires. Each is identified by a unique personnel id. They are also described by their first and last names along with the date and place of birth.
Players are further described by other attributes such as their batting orientation (left, right, or switch) and have a lifetime batting average (BA).
Within the players group is a subset of players called pitchers. They have a lifetime ERA (earned run average) associated with them.
Teams are uniquely identified by their names. Teams are also described by the city in which they are located and the division and league in which they play (such as Central division of the American League).
Teams have one manager, a number of coaches, and a number of players.
Games are played between two teams, with one designated as the home team and the other the visiting team on a particular date. The score (runs, hits, and errors) is recorded for each team. The team with the most runs is declared the winner of the game. Each game has two umpires as well.
With each finished game, a winning pitcher and a losing pitcher are recorded. In case there is a save awarded, the save pitcher is also recorded (see here and here for more details).
With each finished game, the number of hits (singles, doubles, triples, and home runs) obtained by each player is also recorded.

