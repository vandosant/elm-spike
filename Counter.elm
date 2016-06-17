module Counter exposing (Model, Msg, init, update, view)

import Html exposing(..)
import Html.Attributes exposing(..)
import Html.Events exposing(onClick)

-- MODEL


type alias Model =
  { value : Int }


init : Int -> Model
init count =
  { value = count }




-- UPDATE


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> Model
update msg ({value} as model) =
  case msg of
    Increment ->
      { model | value = value + 1 }

    Decrement ->
      { model | value = value - 1 }




-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [ countStyle ] [ text (toString model.value) ]
    , button [ onClick Increment ] [ text "+" ]
    ]


countStyle : Attribute msg
countStyle =
  style
    [ ("font-size", "2em")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]

