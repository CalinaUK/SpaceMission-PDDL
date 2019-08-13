(define (domain ShipDomain)
    (:requirements
        :strips
    )

    (:predicates
        (personnel ?p)
        (room ?r)
        (floor ?f)
        (shipCondition ?c)
        (personnelLocation ?f ?p ?r)
        (path ?f1 ?f2 ?r1 ?r2)
        (shipLocation ?pl1)
        (shipPath ?pl1 ?c ?pl2)
        (orderGiven)
        (traveller ?p ?planet)
        ;(personnelHolding ?p ?i)
        (lightObject ?i)
        (heavyObject ?hi)
        (objectLocation ?f ?i ?r)
        (handEmpty ?p ?h)
        (holding ?p ?i ?h)
        (takepackage ?p ?i)
        (packageDelivery ?planet1 ?i)
        (packageReady ?i)
        (heavyObjectLocation ?f ?hi ?r)
        (botCharge ?bc)
        (planetResources ?planet1 ?i)
        (shipDelivery ?planet1 ?i)
        (packageDelivered ?f ?i ?r)
        (prepareHeavyObject ?hi)
        (transporterCondition ?tc)
        (personnelCondition ?p ?healthy)
        (discover ?p ?hi1 ?hi2 ?i)
        (discovered ?planet1)
        (heavyObjectTake ?hi ?planet1) 
        (heavyObjectBring ?hi ?r)	
	    (heavyObjectDelivery ?hi ?planet1) 
		(contact ?p1 ?p2 ?planet1)
		(relief ?p ?planet1 ?i)
		(mission ?progress)
        
        
      
    )

(:action moveDeck
    :parameters
        (?p ?f1 ?f2 ?r1 ?r2)
    :precondition
        (and
          
            (personnelLocation ?f1 ?p ?r1)
            
            (path ?f1 ?f2 ?r1 ?r2)
            (not (= ?r1 ?r2))
            (= ?f1 ?f2)
         
        )
    :effect
        (and
            (not (personnelLocation ?f1 ?p ?r1))
            (personnelLocation ?f1 ?p ?r2)
            
        )
)

(:action moveFloor
    :parameters
        (?p ?f1 ?f2 ?r1 ?r2)
    :precondition
        (and
            ;add doors
            (personnelLocation ?f1 ?p ?r1)
            (not (= ?f1 ground))
            (path ?f1 ?f2 ?r1 ?r2)
            (not (= ?r1 ?r2))
            (not (= ?f1 ?f2))
         
        )
    :effect
        (and
            (not (personnelLocation ?f1 ?p ?r1))
            (personnelLocation ?f2 ?p ?r2)
            
        )
)




(:action moveShipFromEarth
    :parameters
        (?c ?pl2)
    :precondition
        (and
            
            (personnelLocation floor3 captain bridge)
            (personnelLocation floor3 navigator bridge)
            ;(personnelCondition captain healthy)
            (not(personnelCondition captain sick))
            ;(not(personnelCondition navigator sick))
            
            
            (shipLocation Earth)
            (shipPath Earth ?c ?pl2)
            (not(shipCondition asteroidbelt))
            
            (orderGiven)
           
         
        )
    :effect
        (and
            
            (not (shipLocation Earth))
            (shipLocation ?pl2)
            (shipCondition ?c)
            (not(orderGiven))
            
            
            
        )
)

(:action moveShipBackToEarth
    :parameters
        (?pl1 ?c)
    :precondition
        (and
            
            (personnelLocation floor3 captain bridge)
            (personnelLocation floor3 navigator bridge)
            
            (personnelCondition captain healthy)
            (personnelCondition navigator healthy)
            
            (not(shipLocation Earth))
            (shipPath ?pl1 ?c Earth)
            (not(shipCondition asteroidbelt))
            
            ;(not (orderGiven))
           
         
        )
    :effect
        (and
            ;(orderGiven)
            (not (shipLocation ?pl1))
            (shipLocation Earth)
            (shipCondition ?c)
           
            
            
            
        )
)

(:action fixShip
    :parameters
        ()
    :precondition
        (and
            
            (personnelLocation floor2 engineer engineeringRoom)
            (personnelCondition engineer healthy)
            (shipCondition asteroidbelt)
           
          
            
           
         
        )
    :effect
        (and
            (not(shipCondition asteroidbelt))
            (shipCondition clear)
            
            
        )
)

(:action useTransporter
    :parameters
        (?p ?planet1)
    :precondition
        (and
            
          
            (shipLocation ?planet1)
            
            (personnelLocation floor3 transporterChief transporterRoom)
            (personnelLocation floor3 ?p transporterRoom)
			(personnelCondition transporterChief healthy)
			(not (personnelCondition ?p sick))
            
            
           
           
            
            
            
           
         
        )
    :effect
        (and
            
            (traveller ?p ?planet1)
            
            (not (personnelLocation floor3 ?p transporterRoom))
            (personnelLocation ground ?p ?planet1)
            
           
            
            
        )
)

(:action backToShip
    :parameters
        (?p ?planet1)
    :precondition
        (and
            
          
            (shipLocation ?planet1)
            
            
            (personnelLocation floor3 transporterChief transporterRoom)
            (personnelLocation ground ?p ?planet1)
			(personnelCondition transporterChief healthy)
			(personnelCondition ?p healthy)
            
            
         )
    :effect
        (and
            
            ;(traveller ?p ?planet1)
            
            (not (personnelLocation ground ?p ?planet1))
            (personnelLocation floor3 ?p transporterRoom)
           
            
            
        )
)



(:action pickUp
    :parameters
        (?h ?f ?i ?p ?r)
    :precondition
        (and
           (handEmpty ?p ?h)
           (objectLocation ?f ?i ?r)
           (personnelLocation ?f ?p ?r)
           (personnelCondition ?p healthy)
           ;(shipLocation ?planet1)
           ;(packageDelivery ?planet1 ?i)
           
        )
    :effect
        (and
           (not (handEmpty ?p ?h))
           ;(not (objectLocation ?f ?i ?r))
           (holding ?p ?h ?i)
           (personnelLocation ?f ?p ?r)
           
        )
)

(:action moveLightPackage
    :parameters
        (?h ?i ?p)
    :precondition
        (and
           (not (handEmpty ?p ?h))
           (holding ?p ?h ?i)
           (personnelCondition ?p healthy)
           
           
           
        )
    :effect
        (and
           (takepackage ?p ?i)
		   (personnelLocation floor3 ?p transporterRoom)
           
        )
)

(:action putDownInTransporter
    :parameters
        (?h ?i ?p)
    :precondition
        (and
           (takepackage ?p ?i)
		   (personnelLocation floor3 ?p transporterRoom)
           (personnelCondition ?p healthy)
           
           
        )
    :effect
        (and
           
		   (not (holding ?p ?h ?i))
           (handEmpty ?p ?h)
           (packageReady ?i)
           
        )
)



(:action transportLightPackage
    :parameters
        (?i ?planet1)
    :precondition
        (and
           (packageReady ?i)
		   (personnelLocation floor3 transporterChief transporterRoom)
		   (shipLocation ?planet1)
           (personnelCondition transporterChief healthy)
           
           
        )
    :effect
        (and
           (packageDelivery ?planet1 ?i)
           
        )
)

(:action moveHeavyPackageToShuttleBay
    :parameters
        (?hi)
    :precondition
        (and
           (heavyObjectLocation floor1 ?hi cargoBay)
           (personnelLocation floor1 botMatt3000 cargoBay)
           (not (botCharge notcharged))
           ;(botCharge charged)
           
        )
    :effect
        (and
           (prepareHeavyObject ?hi)
           (not (heavyObjectLocation floor1 ?hi cargoBay))
           (heavyObjectLocation floor1 ?hi shuttleBay)
           (not (personnelLocation floor1 botMatt3000 cargoBay))
           (personnelLocation floor1 botMatt3000 shuttleBay)
           (botCharge notcharged)
           
        )
)

(:action recharge
    :parameters
        ()
    :precondition
        (and
            
            
            (personnelLocation floor2 botMatt3000 scienceLab)
            
            (botCharge notcharged)
           
          
            
           
         
        )
    :effect
        (and
            (not(botCharge notcharged))
            (botCharge charged)
            
            
        )
)

(:action collectPackage
    :parameters
        (?planet1 ?i)
    :precondition
        (and
            
            (planetResources ?planet1 ?i)
            (personnelLocation floor3 transporterChief transporterRoom)
            (shipLocation ?planet1)
            (not (transporterCondition damaged))
            

         
        )
    :effect
        (and
            (when ( = ?i plasma)
                (transporterCondition damaged)
            )
            (shipDelivery ?planet1 ?i)
            (not (planetResources ?planet1 ?i))
            
            
        )
)

(:action fixTransporter
    :parameters
        ()
    :precondition
        (and
            
            
            (personnelLocation floor3 engineer transporterRoom)
            
            (transporterCondition damaged)
           (personnelCondition engineer healthy)
          
            
           
         
        )
    :effect
        (and
            (not(transporterCondition damaged))
            (transporterCondition working)
            
            
        )
)

(:action healPersonnel
    :parameters
        (?p)
    :precondition
        (and
            
            
            (personnelLocation floor1 doctor sickBay)
            (personnelLocation floor1 ?p sickBay)
            
            ;(not (personnelCondition ?p healthy))
            (personnelCondition ?p sick)
           
          
            
           
         
        )
    :effect
        (and
            (not(personnelCondition ?p sick))
            (personnelCondition ?p healthy)
            
            
        )
)

(:action missionBrief
    :parameters
        ()
    :precondition
        (and
            
            
            (shipLocation Earth)
            
            (not(orderGiven))
            
            
            
            (personnelLocation floor1 captain briefingRoom)
			(personnelCondition captain healthy)
            (personnelLocation floor1 engineer briefingRoom)
			(personnelCondition engineer healthy)
            (personnelLocation floor1 navigator briefingRoom)
			(personnelCondition navigator healthy)
            (personnelLocation floor1 doctor briefingRoom)
			(personnelCondition doctor healthy)
            (personnelLocation floor1 transporterChief briefingRoom)
			(personnelCondition transporterChief healthy)
            (personnelLocation floor1 deliveryMan briefingRoom)
			(personnelCondition deliveryMan healthy)
			(personnelLocation floor1 security briefingRoom)
			(personnelCondition security healthy)
			(personnelLocation floor1 scientist briefingRoom)
			(personnelCondition scientist healthy)
                   
            
            
           
         
        )
    :effect
        (and
            
            (orderGiven)
            
        )
)





(:action shuttleTakeHeavyPackage
    :parameters
        (?hi ?planet1)
    :precondition
        (and
            
          
            (shipLocation ?planet1)
            (heavyObjectLocation floor1 ?hi shuttleBay)        
         
        )
    :effect
        (and
            (not (heavyObjectLocation floor1 ?hi shuttleBay))
            (heavyObjectLocation ground ?hi ?planet1)
			
			(heavyObjectTake ?hi ?planet1)        
            
        )
)


(:action shuttleBringHeavyPackage
    :parameters
        (?hi ?planet1)
    :precondition
        (and
            (shipLocation ?planet1)
            (heavyObjectLocation ground ?hi ?planet1)               
         
        )
    :effect
        (and
            (not (heavyObjectLocation ground ?hi ?planet1))
            (heavyObjectLocation floor1 ?hi shuttleBay)
			
			(heavyObjectBring ?hi shuttleBay)       
            
        )
)

(:action useHumanShuttleToGround
    :parameters
        (?p ?planet1)
    :precondition
        (and
            
          
            (shipLocation ?planet1)
            
            (personnelLocation floor1 ?p shuttleBay)
            
        )
    :effect
        (and
            
            (traveller ?p ?planet1)
            
            (not (personnelLocation floor1 ?p shuttleBay))
            (personnelLocation ground ?p ?planet1)
            
           
            
            
        )
)

(:action useHumanShuttleToShip
    :parameters
        (?p ?planet1)
    :precondition
        (and
            
          
            (shipLocation ?planet1)
            (personnelLocation ground ?p ?planet1)
            
            
         )
    :effect
        (and
            
            
            
            (not (personnelLocation ground ?p ?planet1))
            (personnelLocation floor1 ?p shuttleBay)
           
            
            
        )
)



(:action firstContactMission
    :parameters
        (?p ?planet1)
    :precondition
        (and
            
			(personnelCondition captain healthy)
			(personnelCondition ?p healthy)
            (traveller captain ?planet1)
            (traveller ?p ?planet1)
			(shipLocation ?planet1)
            (not( = ?p captain))
			(personnel ?p)
            
            
            
        )
    :effect
        (and
		
		    (contact captain ?p ?planet1)
            (personnelCondition captain sick)
             
            
            (when ( = ?p security)
            
                (not (personnelCondition captain sick))
                
            )
        )
)


(:action exploreMission
    :parameters
        (?hi1 ?hi2 ?planet1 ?i)
    :precondition
        (and
            
            
			(traveller scientist ?planet1)
            (heavyObjectTake ?hi1 ?planet1)
			(heavyObjectTake ?hi2 ?planet1)
			;(not ( = ?hi1 ?hi2))
			;(not(discovered ?planet1))
			(shipDelivery ?planet1 ?i)
			(shipLocation ?planet1)
            
        )
    :effect
        (and
            (discover ?planet1 ?hi1 ?hi2 ?i)
            ;(discovered ?planet1)
        )
)

(:action reliefMission
    :parameters
        (?planet1 ?i)
    :precondition
        (and
            
            (shipLocation ?planet1)
			(traveller doctor ?planet1)
            (packageDelivery ?planet1 ?i)
			
            
        )
    :effect
        (and
            (relief doctor ?planet1 ?i)
        )
)



)
