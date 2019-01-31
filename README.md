Minesweeper API
===============

Versioned API for Minesweeper game

Init
-----

```bash
cp config/environment_variables.example.yml config/environment_variables.yml
```

Filled the variables with the right values of your environment


```bash
bundle install
```
```bash
bundle exec rails db:create db:migrate
```
```bash
bundle exec rails s
```

For testing
---------
`bundle exec rspec`

What decisions did I make?
--------
* To version the API
* Create a Game with the possibility of change the number of rows and cols
``` json
POST /api/v1/games

{
    "player": "", // str
    "board": {
        "rows": 10, // int
        "cols": 10, // int
        "mines_percentage": 10 // int
    }
}
```
* The mines are calculated by a percentage of your choice
* Save the name of a player on the game
* Implementation with 4 models: 
Plays n<---1 Game 1--->1 Board 1--->n Cells
* Use of 3 services for better architecture on the business logic
* Every play made (POST /api/v1/games/:id/plays) returns the play made, the game with the board and their cells
``` json
// POST /api/v1/games/:id/plays

{
    "x": 0, // int
    "y": 0  // int
}

// response:

{
    "x": 0,
    "y": 0,
    "game": {
        "id": 1,
        "player": "",
        "won": false,
        "over" true,
        "board": {
            "rows": 10,
            "cols": 10,
            "mines_percentage": 10,
            "cells": [
                {
                    "x": 0,
                    "y": 0,
                    "kind": "void",
                    "played": true,
                    "mines_neighbors": 0
                },
                {
                    "x": 0,
                    "y": 1,
                    "kind": "void",
                    "played": true,
                    "mines_neighbors": 0
                },
                ...
            ]
        }
    }
}
```
* Todo: rswag API DOCS
* Todo: Services tests
