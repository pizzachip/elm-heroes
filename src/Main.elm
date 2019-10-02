import Browser

import Html exposing (..)
import Html.Attributes exposing ( style )
import Html.Events exposing ( onClick, onMouseEnter, onMouseLeave, onInput )
import Dict

import MyStyles exposing ( heroes, hero, badge )
import DataModel exposing ( Hero, initialHeroList, emptyHero )

main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model = { heroList : Dict.Dict Int Hero
  }


init : Model
init = { heroList = initialHeroList 
  }


-- UPDATE

type Msg = CreateHero String Bool
  | UpdateHero Int
  | EditHero Int String
  | FocusHero Int
  | ClearFocus


update : Msg -> Model -> Model
update msg model =
  case msg of
    CreateHero name favorite ->
      let
        newId = Dict.keys model.heroList
          |> List.maximum 
          |> Maybe.withDefault 0
          |> (\x -> x + 1)

        newHeroList = Dict.map (\k v -> { v | isActive = False }  ) model.heroList
      in
      { model | heroList = Dict.insert newId ( Hero name favorite False False ) model.heroList }

    UpdateHero id ->
      let
        newHeroList = Dict.map (\k v -> { v | isActive = False }  ) model.heroList
        hero = Dict.get id model.heroList 
          |> Maybe.withDefault emptyHero
          |> (\h -> { h | isActive = True } )
      in
      { model | heroList = Dict.insert id hero newHeroList }

    EditHero id name ->
      let
        hero = Dict.get id model.heroList 
          |> Maybe.withDefault emptyHero
          |> (\h -> { h | name = name } )
      in
      { model | heroList = Dict.insert id hero model.heroList }

    FocusHero id ->
      let
        hero = Dict.get id model.heroList 
          |> Maybe.withDefault emptyHero
          |> (\h -> { h | isFocus = True } )
      in
      { model | heroList = Dict.insert id hero model.heroList }
      
    ClearFocus ->
      { model | heroList = Dict.map (\k v -> { v | isFocus = False } ) model.heroList }


-- VIEW

view : Model -> Html Msg
view model = div [ style "font-family" "Arial, Helvetica, sans-serif"
    , style "margin" "32px" ] 
  [ h1 [ style "font-size" "2.5em" 
       , style "color" "#369" ] 
     [ text "Tour of Heroes" ] 
  , div [] [ h2 [ style "font-weight" "lighter" ] [ text "My Heroes" ]
      , ul heroes ( 
          model.heroList
            |> Dict.toList
            |> List.map (\(k, v) -> li ( ( hero v ) ++ [ onClick ( UpdateHero k )
                 , onMouseEnter ( FocusHero k )
                 , onMouseLeave ClearFocus ] )
               [ span badge [ text ( String.fromInt k ) ]
               , text v.name
               ]
             )
        )
      ]
  , editForm model.heroList
  ]


editForm : Dict.Dict Int Hero -> Html Msg
editForm heroList =
  let
    ( id, hero ) = Dict.filter (\k v -> v.isActive) heroList
      |> Dict.toList
      |> List.head
      |> Maybe.withDefault ( -1, emptyHero )
  in
  if id /= -1 then
    div [] [ h2 [] [ text ( hero.name ++ " Details" ) ]
      , p [] [ text ( String.fromInt id ) ]
      , input [ onInput ( EditHero id ), Html.Attributes.value hero.name ] [ ]
    ]
  else text ""
