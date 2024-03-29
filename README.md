# SpaceMission-PDDL
Knowledge Representation and Automated Planning 

Model a planning domain in PDDL to satisfy the requirements in the problem description. 

Problem description 

The Heriot-Watt SpacePort has decided to launch a new spaceship. Operations on board the spaceship will be controlled with plans generated by an AI planner that will direct the people, artificial agents, and the spaceship's controls. The ship itself is a large ship with multiple decks that are connected by lifts. Important locations on the ship include the bridge, engineering, sickbay, transporter room, shuttle bay, science lab, cargo bay, among others. The ship has different types of personnel on board: the captain, engineers, science officers, navigators, medical personnel, security staff, and the transporter chief. The ship has also been equipped with a group of robots that can move heavy equipment around the ship. 

Some of the ship's operations are described in the following list (which isn't exhaustive): 
• The captain can order the ship to travel to a given destination, provided the captain is on the bridge. 

• The ship can travel to another location provided it isn't damaged and there is a navigator on the bridge who has been given an appropriate order. 

• Travelling to a planet that is in an asteroid belt damages the ship.

• Engineers can fix the ship from engineering. 

• Personnel can move around a deck provided the rooms on the deck are connected by doors. 

• Personnel can move between decks by using one of the lifts that are scattered around the ship. 

• Personnel can transport to/from a planet from the transporter room. 

• Small/light equipment can also be transported to/from a planet from the transporter room. 

• After delivering heavy equipment the robots must recharge. 

• The robots can only recharge from the science lab. 

• Only the transporter chief can operate the transporter and only if it isn't damaged. 

• Transporting plasma ore to the ship damages the transporter. 

• Heavy equipment is stored in the cargo bay. 

• A shuttlecraft can also be used to transport personnel and equipment to and from a planet. 

• Medical supplies are kept in the sickbay. 

• Injured crew members can be healed in the sickbay if medical personnel are present.

