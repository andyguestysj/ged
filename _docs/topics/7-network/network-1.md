---
title: Network Overview
permalink: /docs/network-1/
---

### Networking Strategies

#### The Illusion

We want online/networked games to work as if all players are playing in real-time on the same machine. This isn't possible so we need to emulate this as much as possible.  

<img src="{{ "/assets/img/network/illusion.png" | relative_url }}" alt="Illusion of concurrency" class="img-responsive">  

**What the player should see**

* Consistent game state
* Responsive controls
* Difficult (impossible) to cheat

**Potential Problems**

* Game state is greater (bigger) than bandwidth
* Variable or high latency
* Antagonistic users

#### Option 1 - Send The Entire World!

The "simple" option - send all the game data back and forward.  

This works for turn based games. Player two can't do anything when player one is taking their turn. The time taken to transmit the data is (usually) lost in the time a player takes to make a move.  

The time taken to send the game state is proportional to the size of the game state. The more moving parts a game has - units, players, personalisations, etc. the larger the game state is.  

This transmission time is terrible for most games :

* RTS: potentially millions of units
* FPS: potentially millions of bullets
* Competitive games: timing is crucial

#### Modelling the world

If we send everything then we are modelling the world as if everything is equally important.  
 
* This is seldom true
* Not all entities react to the player
* The player doesn't need every level, just the one they are on

We need a better model to solve these problems.  

#### Option 2 - Client-Server Model

* One process is the authoritative server
  * Now we don’t have to wait for slow players, just the server
  * Server can either be hosted by a player or on a separate computer
* Other processes are “dumb terminals”
  * Sends all input to server
  * Server updates the world and sends it back
* Problem: client has to wait for server to respond to perform even basic actions

<img src="{{ "/assets/img/network/clientser.png" | relative_url }}" alt="Illusion of concurrency" class="img-responsive">  

**Client-side Prediction**

* Client responds to player input immediately
* When the server sends back the authoritative game state, client state is overwritten

<img src="{{ "/assets/img/network/clientser2.png" | relative_url }}" alt="Illusion of concurrency" class="img-responsive">  

**Rollback**

* What if the server sends a game state that was 100ms in the past?
* We can’t just replace our game world because we lose all the commands from the local player
  * Client has to roll back the world and integrate commands since the last known good state
  * Client needs to maintain a list of all commands/actions taken since the last game state update was recieved from the server
  
**Masking The Timewarp**

* Laggy players experience this jump often
* If the server usually sends states from 100ms ago, run the client 100ms behind
* Turns a jumpy experience into a smooth and only slightly slow one
  * Very useful if relative timing of commands is important

**Server Side**

* Without rollback and with masking:
  * In an FPS, would need to lead shots because the game state displayed is in the past
* With rollback and without masking:
  * The target could be shot after they think they have taken cover (by a less laggy player)
  * Or we could delay the server player as well
* Need to think carefully about both technical requirements and game impacts of any networking model

<img src="{{ "/assets/img/network/serverside.png" | relative_url }}" alt="Masking" class="img-responsive">  

### Implementation

#### TCP: Transmission Control Protocol

* Abstracts over IP
* All packets are guaranteed to be received and in the correct order
* Good for sending important, permanent data
  * Connecting to server
  * Initial game state

<img src="{{ "/assets/img/network/tcp.png" | relative_url }}" alt="TCP" class="img-responsive">  

#### UDP: User Datagram Protocol

* A very thin shell around IP
* Much faster than TCP, but no guarantees about reception or order
* Good for information where only the most recent state matters
  * Current game state

<img src="{{ "/assets/img/network/udp.png" | relative_url }}" alt="UDP" class="img-responsive">  

#### TCP vs UDP

* (Very) generally: action games use UDP and turn-based games use TCP
  * World state updates can be lost without worry, commands not so much
* Can potentially combine them
  * TCP sends one-time messages
  * UDP streams updates
* Best choice varies by project

#### Java Sockets

* Very good for most purposes
* Read and write objects to sockets
* UDP is deprecated for sockets
  * Use DatagramSocket

<img src="{{ "/assets/img/network/jsock.png" | relative_url }}" alt="Java Sockets" class="img-responsive">  

#### Edge Cases

* What if…
  * The client disconnects
  * The server dies
  * The client goes insane and send gibberish
  * The client loses internet for 30 seconds
  * The client is malicious
  * The client changes IP address
* Handling errors well is vital to the player experience

**Elegant Disconnects**  

* Handles and respond to IO exceptions
  * Don’t just dump a stack trace
* Display informative status messages
* Send heartbeat packets every few seconds
  * Then respond if server / client hasn’t received a heartbeat in a while
* Never let the game continue to run in an unrecoverable state!

### Links

* [Beginner's Guide To Game Networking](https://pvigier.github.io/2019/09/08/beginner-guide-game-networking.html)
* [A curated list of game networking resources](https://github.com/ThusWroteNomad/GameNetworkingResources)
* [Unreal Engine Networking](https://cyrextech.net/unreal-engine-networking/)
* [Unity Networking](https://unity.com/roadmap/unity-platform/multiplayer-networking)
