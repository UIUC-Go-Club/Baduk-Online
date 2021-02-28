# Online GO

This is a cooperate project by Ziyang Yu(zyu18) and Xingzhi Liu(xingzhi2)
We are building a web application for online Go match, with functionality like live chat, match replays, etc.

## Abstract

### Project Motivation

Website for campus Go club

## Tech specfics

### Language

FrontEnd
: React.js

BackEnd
: Node.js or Python

Databases: 
Options from the following: MongoDb, Neo4j, MySQL

### Tools

1. Go board displaying API
**Shudan.js**


### Style Guide

Official styling guide of React.JS part

PEP 8 -- Style Guide for Python Code

### High level functionality

Online match
Chat while matching
View Replay
Integrated AI provides match review and GO matches against AI

## Weekly Goal

### Week 1

**Functional Requirements**
Total score of functional requirements is 30, will be split between two team members when implementing. 
Basic back-end and front-end structure, support online Go match
Chat function alongside

| Category   | Total Score Allocated | Detailed Rubrics                                                                                           |
| ---------- | :-------------------: | ---------------------------------------------------------------------------------------------------------- |
| create view for Go board |           4           | +1: all Board UI components are drawn <br> +2: player can cycle between different ui options <br> +1: Pieces could show up on the board |
| create model for game |           6           | +1: design what to store in a game <br> +2: has a model to record the game state <br> +1: be able to export the game to SGF format (The standard format for recording go) <br> +1: allow initializing(import) a past game by importing from a SGF file. <br> +1 : could save the game on the server side in a database (any database is ok) |
| create model for player (profile) | 4 | +1: design what should be stored for a player <br> +1: can create new player profile <br> +1: can save player profile to database <br> +1: correct link between player and its games|
| create view for game room |         3         |  +1: design the view of game room <br> +2: A game room UI is correctly rendered, it should contains a place where to play the game and a place where to chat with your opponents and other information such as who are in the room <br> bonus +1 point:  good looking UI |
| realtime playing |           10           | +1: design state message, what kind of information should be passed to the other side <br> +2: player can make moves on the board, invalid moves are dropped <br> +1: one players move could show up in another player's view  <br> +1: player could resign, and pass (decide not to play a move) a move <br> +2: game could end if both players want to end, then we would calculate territories and determine winner <br> +1: a player could regret a move with the consent from another player <br> +2: support reconnecting to a ongoing game if disconnected <br> bonus +1: has sound effect when a play is played |
| Basic Profile for each user |           3           |  +1: design the screen of the profile of the user  <br> +1: correctly display live games of player <br> +1 : display past games | 

**Testing Requirements**

| Category   | Total Score Allocated | Detailed Rubrics                                                                                           |
| ---------- | :-------------------: | ---------------------------------------------------------------------------------------------------------- |
| Testing   | 5 |  0.5 point for each unit test implemented |
| Manual Test Plan | 5 | 0: Didn't have a manual test plan for UI components <br> 2: Manual test plan includes basic setup and configuration requirements. <br> 4: Manual test plan includes all UI components. <br> 5: Manual test plan includes error states |

### Week 2

**Functional Requirements**

| Category   | Total Score Allocated | Detailed Rubrics                                                                                           |
| ---------- | :-------------------: | ---------------------------------------------------------------------------------------------------------- |
| room improve | 10 | +1: ko (cannot play immediate captures a ko back) is prevented <br> +1: the most recent move will be marked <br> +1: be able to regret multiple moves <br> +1: show the winner when game has ended <br> +1: room name must be unique, faild to create room if room name has already exists, also show room name in the room <br> +1: The game is not automatically started. When a user joins a room, and opponent also joins the room, they could start a new game request, game started only if your opponent agrees <br> +1: user could leave the room if the game is not started, then your opponent will shown up as empty marked as left <br> +1 if a user close the tab after game finished, it's the same as leaving the room <br> +1 if a player leaves the room and game is not ongoing, another player could join the room. <br> +1: both players could restart a new game after game has finished |
| Realtime chatting |         4          |  +1: server could post message to both user, such as initializing message in the chatroom: "The game has started, white side is ..., black side is ..." <br> +1: user could send text to each other <br> +2: chatting room view GUI is displayed (embedded as a component of the game room, it should display each messages as somebody: some words, and use some padding to properly separate between different messages) <br> bonus +1: when messages are many, scroll bar is enable to view messages |
| Support timing mode |    2        | +2: support total time usage limit, both players should have a limited amount of time (reserved time) to play. If a player exceeded the time limit, it's consider the same as a resign <br> bonus +2: support countdown, each player has a timer, if the reserved time is used up, the user must play a move thin a certain period such a minute. If a player miss it, it's considered a pass. If failed to obey the countdown 3 times (or some limit), the player automatically lose. |
| spectator mode |           4           |  +1: spectator could join an ongoing room <br> +1: spectator could rejoin an ongoing room <br> +1: spectator could view the game synchronously  <br> +1: spectator could talk in the chatroom as well, everyone should be able to see spectator's message <br> bonus +1: message before a user join are also shown <br> +1: when joining a room and the game has already started, you automatically becomes an spectator <br> bonus +1: have an additional ui to show spectators in a room|
| user Authentication and management  |           10           | +1 design the sign up page <br> +1: User could sign up <br> +2: has a sign in page for the user, if not login, could not play games  <br> +2: has some authentication in the backend <br> +2: when a user has signed in, this status is maintained across the website <br> +1: a user could also logout as well <br> +1: when a user has logout, he needs to signin again if he wants to play <br> bonus +1: incorporate jwt to use token based authentication  |



**Testing Requirements**

| Category   | Total Score Allocated | Detailed Rubrics                                                                                           |
| ---------- | :-------------------: | ---------------------------------------------------------------------------------------------------------- |
| Testing   | 5 |  0.5 point for each unit test implemented |
| Manual Test Plan | 5 | 0: Didn't have a manual test plan for UI components <br> 2: Manual test plan includes basic setup and configuration requirements. <br> 4: Manual test plan includes all UI components. <br> 5: Manual test plan includes error states |



### Week 3

**Functional Requirements**

| Category   | Total Score Allocated | Detailed Rubrics                                                                                           |
| ---------- | :-------------------: | ---------------------------------------------------------------------------------------------------------- |
| improve the profile for each user  |           2           | <br> +1 design a page for user to change the information of their profile <br> +1: user could change the information of their profile by submitting some form <br> bonus +1: correctly display live games of player and allow user to click on the link to reconnect to their live games by click it | 
| Live Game Analysis |        6       |  +1: allow users to estimate current score(not calculate final score). <br> +1: This done purely on the frontend without troubling the backend to reduce serve pressure. <br> +2: show estimation on the board, mark the white and black territory on the board. <br> +1: be able to hide it as well after showing the white and black territory on the board <br> +1: still be able to handle other event when it's in game analysis mode, in specific, chatting is still going in the background, when another player makes move, territory analysis mode is automatically off and the board renders the new state. <br> bonus +1: dead stones are half transparent <br> bonus +1: draw border of groups of pieces|
| create a room hall view |           4           | +1: design the outlook of game hall, it should contains a list of rooms that is open/active <br> +1: display the current active rooms <br> +1: each of the rooms are joinable, click and we can join <br> +1: if the game is ongoing, will join as a bystander <br> bonus 1 point: good looking UI|
| Replay Mode Basic |        5       |  +2: user could select any past game and play it back to review it (i.e. create special review room for the user) <br> +1: Player is able to navigate to a past game state <br> +2: easy navigation -> create a view to view past moves and could go to the corresponding past state by clicking some UI. |
| support multiple game room and multiple games happening the same time |           8           |  +2: a player could play 2 games same time <br> +1: a player could play multiple games same time <br> +1: and there is a way for users to switch to different room to play <br> +2: multiple users could play multiple games at the same time <br> +1: handle error when a user goes offline, one of the game continue/end according to his remaining time properly <br> +1 handle error when a user goes offline, all of the game he is playing continue/end according to his remaining time properly|
| game setting page |          5           |  +1: has a basic view page, or a pop-up to customize the rule of game <br> +2: Be able to set all of the following information: Boardsize, territory calculator method, reserved time, time for countdown before starting a game <br>+1: each of the above field should have a default value, for easy start <br>+1: error handling when  important setting are invalid, the website should not create the game in such condition <br> bonus 1 point: be able set [handicap](https://en.wikipedia.org/wiki/Handicap_(go)) (a special rule for unequal game in Go, see Handicap placement)|


**Extra Bonus Functions**

| Category   | Total Score Allocated (Bonus) | Detailed Rubrics                                                                                           |
| ---------- | :-------------------: | ---------------------------------------------------------------------------------------------------------- |
|make it a native application|  3  | +2: wrap it as a native application, such as using electron, make it a native application (Windows / Mac / Ubuntu / etc) <br> +1: support more than one platform|
| host it online |  3  | +1: host it on a cloud server <br> +2 two users could play this game online|
| Replay Mode Advanced |     6      | +1: be able to try play some other moves in the replay mode. <br> +1: we can return to a previously tried move <br> +2: if play another move, record it as a branch, be able to store branchs of games in the game state as well <br> +2: support navigation from branch to branch, i.e, click on a move in another branch, then go the corresponding state in that branch |
| Train an Go A.I. and make it available for online match 24/7  | 8 |    +2: find A.I. model and trained A.I. locally, A.I. should have some ways to interact human <br> +2: wrap A.I. as an API call, or as a service, so that we could feed moves to A.I., and when A.I. make moves, A.I. could send its information in certain format <br> +1: A.I is added as a user in the platform <br> +1: other user could challenge the A.I. in our game platform <br> +2: A.I. move looks professional|
| A.I. Analysis |      3        | +2: add Win rate analysis for every past game, so in the review mode, there should be an A.I. win rate for every move <br> +1: add a view to show the win rate curve in the replay mode |
| A.I. suggestions |     2       | +2: could show A.I. suggested moves in the replay mode, and use a different color(for instance half transparent pieces) to indicate an A.I. suggested moves |

**Testing Requirements**

| Category   | Total Score Allocated | Detailed Rubrics                                                                                           |
| ---------- | :-------------------: | ---------------------------------------------------------------------------------------------------------- |
| Testing   | 5 |  0.5 point for each unit test implemented |
| Manual Test Plan | 5 | 0: Didn't have a manual test plan for UI components <br> 2: Manual test plan includes basic setup and configuration requirements. <br> 4: Manual test plan includes all UI components. <br> 5: Manual test plan includes error states |

