;
; ship problem
;
(define (problem ShipProblem)
  (:domain ShipDomain)

  (:objects
      
      
      bridge
      transporterRoom
      engineeringRoom
      briefingRoom
      scienceLab
      sickBay
      shuttleBay
      cargoBay
      

      captain
      engineer
      navigator
      doctor
      scientist
      transporterChief
      security
      botMatt3000
      deliveryMan
      
      floor1
      floor2
      floor3
      ground
      
      ship
      Mars
      Venus
      Jupiter
      Saturn
      Earth
      
      asteroidbelt
      clear
      
      gold
      none 
      insulin
      painkillers
      
      Rover
      CommunicationTower
      
      
      
      left 
      right
      
      charged
      notcharged
    
      rocks
      plasma
      plasma1
      
      damaged
      working
      
      sick 
      healthy
      notalive
     
  )

  (:init
  
     
      (planetResources Venus rocks) 
      (planetResources Jupiter plasma)
      (planetResources Mars plasma)
	  (planetResources Venus plasma)
        
        
     ;starting ship shipCondition
      (shipCondition clear)
      
     ;transporterRoom shipCondition
      (transporterCondition working)
      
     ;hand empty
      (handEmpty captain left)
      (handEmpty captain right)
	  (handEmpty navigator left)
	  (handEmpty navigator right)
	  (handEmpty engineer left)
	  (handEmpty engineer right)
	  (handEmpty transporterChief left)
	  (handEmpty transporterChief right)
	  (handEmpty doctor left)
	  (handEmpty doctor right)
	  (handEmpty security left)
	  (handEmpty security right)
	  (handEmpty scientist left)
	  (handEmpty scientist right)
      
     ;lightObject
    
      (lightObject gold)
	  (lightObject insulin)
	  (lightObject painkillers)
      
      
     ;objectLocation
     
      (objectLocation floor2 gold scienceLab)
      (objectLocation floor1 insulin sickBay)
      (objectLocation floor1 painkillers sickBay)
      
      (heavyObjectLocation floor1 Rover cargoBay)
      (heavyObjectLocation floor1 CommunicationTower cargoBay)
      
     ;ship starting point 
      (shipLocation Earth)
      
     ;personnel starting point
      (personnelLocation floor1 captain cargoBay)
      (personnelLocation floor1 navigator shuttleBay)
      (personnelLocation floor3 engineer bridge)
      (personnelLocation floor1 transporterChief sickBay)
      (personnelLocation floor2 doctor briefingRoom)
	  (personnelLocation floor2 security briefingRoom)
	  (personnelLocation floor3 scientist bridge)
      
      ;create different method for robot potentially
      (personnelLocation floor3 botMatt3000 transporterRoom)
      (personnelLocation floor2 deliveryMan briefingRoom)
      
      ;health condition 
      (personnelCondition captain healthy)
      (personnelCondition navigator healthy)
      (personnelCondition engineer healthy)
      (personnelCondition transporterChief healthy)
      (personnelCondition doctor healthy)
      (personnelCondition botMatt3000 notalive)
      (personnelCondition deliveryMan sick)
	  (personnelCondition security healthy)
      (personnelCondition scientist sick)
      
     ;change to clear or asteroidbelt
     ;ship flight route  
      (shipPath Earth clear Saturn)
      (shipPath Earth clear Jupiter)
      (shipPath Earth asteroidbelt Venus)
      (shipPath Earth asteroidbelt Mars)
      (shipPath Saturn clear Earth)
      (shipPath Saturn clear Jupiter)
      (shipPath Saturn asteroidbelt Venus)
      (shipPath Saturn asteroidbelt Mars)
      (shipPath Jupiter clear Saturn)
      (shipPath Jupiter clear Earth)
      (shipPath Jupiter asteroidbelt Venus)
      (shipPath Jupiter asteroidbelt Mars)
      (shipPath Venus clear Earth)
      (shipPath Venus clear Saturn)
      (shipPath Venus clear Jupiter)
      (shipPath Venus asteroidbelt Mars)
      (shipPath Mars clear Earth)
      (shipPath Mars clear Saturn)
      (shipPath Mars clear Jupiter)
      (shipPath Mars asteroidbelt Venus)
      
     ;path within ship
      (path floor3 floor3 bridge transporterRoom)
      (path floor3 floor3 transporterRoom bridge)
      (path floor3 floor2 bridge engineeringRoom)
      (path floor2 floor3 engineeringRoom bridge)
      (path floor3 floor2 transporterRoom scienceLab)
      (path floor2 floor3 scienceLab transporterRoom)
      (path floor2 floor2 engineeringRoom briefingRoom)
      (path floor2 floor2 briefingRoom engineeringRoom)
      (path floor2 floor2 briefingRoom scienceLab)
      (path floor2 floor2 scienceLab briefingRoom)
      (path floor2 floor1 engineeringRoom sickBay)
      (path floor1 floor2 sickBay engineeringRoom)
      (path floor2 floor1 scienceLab cargoBay)
      (path floor1 floor2 cargoBay scienceLab)
      (path floor1 floor1 sickBay shuttleBay)
      (path floor1 floor1 shuttleBay sickBay)
      (path floor1 floor1 shuttleBay cargoBay)
      (path floor1 floor1 cargoBay shuttleBay)
      
      ;path betweeen transporterRoom and planets
      (path floor3 ground transporterRoom Earth)
      (path floor3 ground transporterRoom Jupiter)
      (path floor3 ground transporterRoom Mars)
      (path floor3 ground transporterRoom Saturn)
      (path floor3 ground transporterRoom Venus)
      (path ground floor3 Earth transporterRoom)
      (path ground floor3 Jupiter transporterRoom)
      (path ground floor3 Mars transporterRoom)
      (path ground floor3 Saturn transporterRoom)
      (path ground floor3 Venus transporterRoom)
     
     ;path between floor3 and floor1 (lift can go more than 1 level at a time) 
      (path floor3 floor1 bridge sickBay)
      (path floor1 floor3 sickBay bridge)
      
      (path floor3 floor1 transporterRoom cargoBay)
      (path floor1 floor3 cargoBay transporterRoom)
      
      ;(traveller doctor Jupiter)
     
      
     
  )

  (:goal
      (and
    		  
		  (contact captain doctor Venus)
		  (contact captain engineer Saturn)
		  
      )
  )
)
