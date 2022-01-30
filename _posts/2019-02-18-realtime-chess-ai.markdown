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

I played this game quite a bit when I was younger. At some point, the site was taken down but I always remembered it fondly. As I learned more about web development, I had this grand vision to restore it to its former glory.

Here's what the gameplay looks like:

![kungfu chess](/images/kungfu_chess.gif "kungfu chess")

After building the multiplayer version, it seemed like it would be nice to start up a single player game for new players to learn the game. The realtime component of the game made it an interesting challenge.

You can try playing against the computer at <a href="https://www.chessx.io/solo" target="_blank" rel="noopener">ChessX</a>.

# Considerations

So the goal wasn't to create a sophisticated algorithm that could beat any human. The goal was to create a challenging experience for new players. Even with the simple algorithm that I came up with, an easy way to increase the computer's effectiveness is to increase the rate at which it performs moves. This is a trivial way for the computer to outperform humans, and has a greater impact than in a traditional chess game.

Another consideration is that moves are not instantaneous. It currently takes a second for each square to be traversed by a piece or seven seconds to move across the entire board. That's is plenty of time to move a king out of harm's way or even intercept the attacker along its path.

# Heuristic

With these considerations in mind, the computer doesn't try to project too far out into the future.

# Improvements
