# Baduk Online Documentation
This documentation contains all three parts, which defines the procotol between front end and back
- Socket Events 
- Api 
- Model/Schema 



## Socket Events
3 Communication Models:
- client request -> server reponse
    - e.g 
        - calc score (client send) -> calc score (server respond back)
- client status change -> server broad cast change
    - e.g 
        - join room player -> room player change (broadcast)
- client 1 init -> server broadcast -> client 2 ack -> server broadcast result
    - e.g. 
        step 1. game start init (fired by player 1)
        step 2. game start init (server broadcast request to all other players)
        step 3. game start response (from client 2 to server) 
        step 4. servers wait until all related players have responded, decide whether agreement is reached.
        step 5. game start response (server broadcast result to all players)

| Server event  |    Param Data format    |     Client event     | Param Data format      |
| :-----------------: | :----------------------: | :---------------: | :---------------: |
| join_room_bystander|     {username, room_id}     |  room bystander change  | JSON.stringify(room)|
| join_room_player   |     {username, room_id}     |  room player change  | JSON.stringify(room) |
| game start init   |     {username, room_id}     |  game start init  | JSON.stringify(room) |
| game start response   |     {username, room_id, answer:bool}     |  game start response  | JSON.stringify(room) |
| move   |     {username, room_id, sign, vertex, reservedTimeLeft, countdownLeft}     |  game start response  | JSON.stringify(room) |
| resign   |     {username, room_id}     |  game ended  | JSON.stringify(room) |
| timeout   |     {username, room_id}     |  game ended  | JSON.stringify(room) |
| calc score   |     {username, room_id}     |  calc score  | JSON.stringify(scoreResult)) |
| game end init   |     {username, room_id}     |  game end init  | JSON.stringify(room) |
| game end response   |     {username, room_id, answer}     |  game end result  | JSON.stringify(room) <br> flag: room.game.Finished  |
| regret init |     {username, room_id}     |  regret init  | JSON.stringify(room) |
| regret response |     {username, room_id, answer}     |  regret result  | JSON.stringify(room) |
| disconnect   |     {}     |  player leave  | JSON.stringify(room) <br> room.players[i].active=false了, 重新渲染即可 |
| disconnect   |     {}     |  room bystander change  | JSON.stringify(room)<br>room.bystanders.username |



## Server api list
- /auth
     - /login
        - return jwt if success
    - /signup
        - create new user and return jwt if success
    - /reset_password
        - reset password and return jwt if success
- /game
    - /room/:room_id
        - GET
- /message
    - /room/:room_id
        - GET
        - POST
        - DELETE
    - /user/:username
        - GET
        - DELETE
    - /delete/all
        - DELETE
            - delete all messages
- /user
    - /
        - GET
            - return all users
    - /:username
        - GET
        - POST
        - DELETE
    - /delete/all
        - DELETE
            - delete all users
- /room
    - /:room_id
        - GET
        - POST
        - DELETE
    - /delete/all
        - DELETE
            - clear all rooms


## Schema
### Move Schema (server)
- Sign: all signs should be int, either 1 (black), or -1 (white)
- Vertex: [x,y]
```javascript    
Move: {
    sign: {
        type: Number
    },
    vertex: [{type: Number}]
}
```


### scoreResult Json Schema
- first entry black score, second entry white score
- territoryScore = black territory - white territory  
- black wina when territoryScore > 0
```json
{
    area: [149, 211],
    territory: [56, 89],
    captures: [14, 43],
    areaScore: -69.5,
    territoryScore: -69.5
}
```

### Room Schema
```javascript
const RoomSchema = mongoose.Schema({
    room_id: {
        type: String
    },
    currentTurn: {  // index 0 or 1, use room.players[index] to find current player
        type: Number
    },
    winner: {
        type: Number
    },
    gameStarted: {
        type: Boolean
    },
    gameFinished: {
        type: Boolean
    },
    lastMove: {
        sign: {
            type: Number
        },
        vertex: [{type: Number}]
    },
    lastMakeMoveTimeStamp: {
        type: Number
    },
    reservedTime:{
        type: Number
    },
    countDown:{
        type:Number
    },
    scoreResult: {
        area: [{type: Number}],
        territory: [{type: Number}],
        areaScore: {type: Number},
        territoryScore: {type: Number},
    },
    regretInitiator: {
        type: Number
    },
    players: [{
        userProfile: {
            ref: 'User',
            type: mongoose.Schema.Types.ObjectId
        },
        username: {
            type: String
        },
        color: { // black or white or undefined
            type: String
        },
        active: {
            type:Boolean
        },
        initial_time: {
            type: Number
        },
        reservedTimeLeft:{
            type: Number
        },
        countdownLeft: {
            type: Number
        },
        ackGameEnd: {
            type: Boolean
        },
        ackRegret: {
            type: Boolean
        },
        ackGameStart: {
            type: Boolean
        },
        resigned:{
            type: Boolean
        },
        timeout:{
            type:Boolean
        }
    }],
    bystanders: [{
        ref: 'User',
        type: mongoose.Schema.Types.ObjectId
    }],
    currentBoardSignedMap: {
        type: String
    },
    currentBoardJson: {
        type: String
    },
})
```

### User Schema
```javascript
const UserSchema = mongoose.Schema({
    username: {
        type: String, required: true, index: {unique: true}
    },
    email: {
        type: String
    },
    password: {
        type: String
    },
    rank: {
        type: String
    },
    lastLoginTime: {
        type: Date
    },
    role:{
        type: String,   // admin, or user
        default: 'user'
    },
    past_games: [{
        ref: 'GameRecord',
        type: mongoose.Schema.Types.ObjectId
    }],
    active_games: [{
        ref: 'Room',
        type: mongoose.Schema.Types.ObjectId
    }]
})
```

### game_record schema
```javascript
const GameRecordSchema = mongoose.Schema({
    room_id: {
        type: String
    },
    players: [{
        username: {
            type: String
        },
        color: { // black or white or undefined
            type: String
        },
        resigned: {
            type: Boolean
        },
        timeout:{
            type: Boolean
        }
    }],
    winner: {
        type: Number
    },
    scoreResult: {
        area: [{type: Number}],
        territory: [{type: Number}],
        areaScore: {type: Number},
        territoryScore: {type: Number},
    },
    gameTree: {
        type: String
    }
}, {collection: 'game_records'})
```
#### new profile (client to server)
- name
- email
- password
- .....

#### profile (server to client)
- name
- email
- rank
- password
- past_games
- ....



