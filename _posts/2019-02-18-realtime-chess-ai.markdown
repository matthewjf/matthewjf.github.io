---
layout: post
title:  "Realtime Chess AI"
date:   2019-02-18
categories: Development
tags: [games, development]
image: "/images/chess.jpg"
---

# The Game

What is realtime chess without turns?

From the Wikipedia article on [Kung-Fu Chess](https://en.wikipedia.org/wiki/Kung-Fu_Chess)
>either player can move any available piece at any given moment, though only one piece can be moved at a time. After a piece is moved, a predefined delay prevents it from moving again for a short period of time. This, plus piece movements not being instantaneous, means that speed and timing are crucial aspects of the game, as any delay could determine whether a piece is captured or not.

I played this game quite a bit when I was younger. At some point, the site was taken down but I always remembered it fondly. As I learned more about web development, I had this grand vision to restore it to its former glory!

Here's what the gameplay looks like:

![kungfu chess](/images/kungfu_chess.gif "kungfu chess")

After building the multiplayer version, it seemed like it'd be nice to have a single player mode for new players to learn the game. The realtime component of the game made it an interesting challenge.

You can try playing against the computer at <a href="https://www.chessx.io/solo" target="_blank" rel="noopener">ChessX</a>.

# Considerations

So the goal wasn't to create a sophisticated algorithm that could beat any human. The goal was to create a challenging experience for new players. Even with the simple algorithm that I came up with, an easy way to increase the computer's effectiveness is to increase the rate at which it performs moves. This is a trivial way for the computer to outperform humans, and has a greater impact than in a traditional chess game.

Another consideration is that moves are not instantaneous. It currently takes a second for each square to be traversed by a piece or seven seconds to move across the entire board. That's is plenty of time to move a king out of harm's way or even intercept the attacker along its path.

# Algorithm

With these considerations in mind, the computer doesn't try to look too far into the future.

The computer will perform moves every two seconds. It's split into two independent checks: one attempts to protect the King and the other tries to maximize move value. I certainly could have combined these two efforts into a single check, but I wanted to be able to control their rates independently.

## Protect King

This check is fairly naive. For any pieces threatening the King, it'll either try to capture the attacking piece or move the King to safety.

This can certainly be improved by attempting to block attackers or move to a position other pieces can help block attackers.

## Move Value

The computer compares all available moves and choose the one with the maximum value. I took a heuristic approach to determining the overall value of a given move. There's only a handful of factors that are taken into account.

- #### Current Position

  The computer attemps to calculate the current board position value by determining the current piece's value and whether it is under attack by the opponent. It will also check to see if the piece is defended. The algorithm puts a lower value on defending pieces because of the dynamic nature of the board state: other pieces can block defenders and pieces can be intercepted mid move. There's also a slight incentive to keep a piece in a defended position, over moving it into an undefended position.

- #### Target Position

  The computer will calculate the net gain from taking another piece, which can include the loss of the attacking piece when the target is defended. There's a slight bias towards making trades; I believe this makes the computer more engaging.

- #### Movement Risk

  As I've mentioned previously, there is a certain amount of risk involved in moving pieces. The computer is less likely to make moves that require a long travel distance.

- #### Board Position

  There's also an advantage to holding the middle of the board so there's a slight positive incentive to gain control there. These values are determined randomly across a range.

There's quite a few coefficients involved in the total calculation, which can be dialed to encourage the computer to behave differently. These values could even be randomized to create different "playstyles".

# Improvements

The computer curerntly evaluates each move in isolation. Being able to coordinate moves, like moving a piece out of the way to open up better woulds, would be pretty significant improvement. The computer also doesn't take into account the cooldown timers. That would unlock another layer to the risk calculation. There's plenty of ways to improve on this fairly simple approach, but in my experience, the most effective way to adjust difficulty was to adjust the rate at which the computer would make moves.

If you haven't tried it yet, you can give it a shot at <a href="https://www.chessx.io/solo" target="_blank" rel="noopener">ChessX</a> and let me know what you think!
