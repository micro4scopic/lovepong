Hello! This is a pong game written in Lua with Love2D. In order to run the game, open a terminal, and type:
```bash
user@host:~$ love <directory-to-pong>
             ^~~~~~~~~~~~~~~~~~~~~~~~
```
... where `<directory-to-pong>` is the directory you have cloned this game. Please note that you also need Lua and Love2D installed.

## Instructions

This is a two-player game. For player 1 on the left hand side, use 'w' and 's' to control. For player 2 on the right hand side, use,
with the provided arrow keys on your keyboard, 'up' and 'down'.

## Gameplay

There is a ball which bounces about left-to-right on the screen. You, the player, have to try and bounce the ball away using your paddle
(to control the paddle refer to 'Instructions'). If you fail to bounce the ball the other direction so that the ball hits your side of
the screen, the other player will get a point.

## Goal

The first player to get 10 points wins. And if you weren't focusing on who won, you will see a result logged out on your terminal.
