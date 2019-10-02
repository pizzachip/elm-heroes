-- /* HeroesComponent's private CSS styles */
port module MyStyles exposing ( heroes, hero, badge )

import Html
import Html.Attributes exposing ( style )
import DataModel exposing ( Hero )

heroes = [ style "margin" "0 0 2em 0"
  , style "list-style-type" "none"
  , style "padding" "0"
  , style "width" "15em"
  ]


hero : Hero -> List ( Html.Attribute msg ) 
hero myHero = 
  let
    statusStyles =
      if myHero.isActive then
        [ style "background-color" "#CFD8DC"
        , style "color" "white"
        ]
      else []
      ++
      if
        myHero.isFocus then
        [ style "color" "#607D8B"
        , style "background-color" "#DDD"
        , style "left" ".1em"
        ]
      else []
  in
  [ style "cursor" "pointer"
  , style "position" "relative"
  , style "left" "0"
  , style "background-color" "#EEE"
  , style "margin" ".5em"
  , style "padding" ".3em 0"
  , style "height" "1.6em"
  , style "border-radius" "4px"
  ] ++ statusStyles

{--
  .heroes li:hover {
  "color" #607D8B"
    background-color: #DDD"
  "left" .1em"
  }
  .heroes li.selected {
    background-color: #CFD8DC"
  "color" white"
  }
  .heroes li.selected:hover {
    background-color: #BBD8DC"
  "color" white"
  }
--}

badge = [ style "display" "inline-block"
  , style "font-size" "small"
  , style "color" "white"
  , style "padding" "0.8em 0.7em 0 0.7em"
  , style "background-color" "#405061"
  , style "line-height" "1em"
  , style "position" "relative"
  , style "left" "-1px"
  , style "top" "-4px"
  , style "height" "1.8em"
  , style "margin-right" ".8em"
  , style "border-radius" "4px 0 0 4px"
  ]
