port module DataModel exposing ( Hero, initialHeroList, emptyHero )

import Dict

type alias Hero = { name : String
  , isTop : Bool
  , isFocus : Bool
  , isActive : Bool }


emptyHero = Hero "" False False False

-- INITIAL VALUES

initialHeroList = 
  Dict.fromList [ ( 11, { name = "Dr Nice" , isTop = False, isFocus = False, isActive = False } )
    ,( 12, { name = "Narco" , isTop = False, isFocus = False, isActive = False } )
    ,( 13, { name = "Bombasto" , isTop = False, isFocus = False, isActive = False } )
    ,( 14, { name = "Celeritas" , isTop = False, isFocus = False, isActive = False } )
    ,( 15, { name = "Magneta" , isTop = False, isFocus = False, isActive = False } )
    ,( 16, { name = "RubberMan" , isTop = False, isFocus = False, isActive = False } )
    ,( 17, { name = "Dynama" , isTop = False, isFocus = False, isActive = False } )
    ,( 18, { name = "Dr IQ" , isTop = False, isFocus = False, isActive = False } )
    ,( 19, { name = "Magma" , isTop = False, isFocus = False, isActive = False } )
    ,( 20, { name = "Tornado" , isTop = False, isFocus = False, isActive = False } ) 
  ]
