# cerberus-prox-frontend

This is a rails app that is meant to serve as a frontend to the 
cerberus-prox project at

https://code.google.com/p/cerberus-prox/


The Cerberus Prox is an application that interfaces with an open-source RFID reader design to enable
swipecard access to the Austin HackerSpace.

Cerberus Prox is a java application that uses a MySQL database to store the data about Cards, Doors, and Access Priviledges
(ie: is this card a known card? and do they have access to the door?)


The problem is that the only way to administrate your doorsystem was via directly manipulating the database.

UNTIL NOW!

The Cerberus Prox Frontend is a tested Rails 3 applicaiton that allows easy administration of the doorsystem.

Some cool features:

* Simple administration of cards, doors, and access priviledges
* Card Capture system instead of keying the card manually (if you don't know its ID)
* When XML-RPC is enabled, the dashboard allows you to open any door from the web interface
* Timeline for the access log



We're actively developing this project at the Austin Hackerspace and are eager to
start sharing with other spaces!
