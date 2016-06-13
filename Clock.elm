import Html exposing (Html, div, text)
import Html.App as App
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, millisecond, hour)
import Date exposing (fromTime)


main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL


type alias Model = Time


init : (Model, Cmd Msg)
init =
  (0, Cmd.none)




-- UPDATE


type Msg
  = Tick Time |
  Tock Time




update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      (newTime, Cmd.none)

    Tock newTime ->
      (newTime, Cmd.none)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
  [
    Time.every millisecond Tick
  , Time.every hour Tock
  ]




-- VIEW


view : Model -> Html Msg
view model =
  let
    minuteAngle =
      turns (Time.inMinutes model)

    minuteHandX =
      toString (50 + 40 * cos minuteAngle)

    minuteHandY =
      toString (50 + 40 * sin minuteAngle)

    hourAngle =
      turns (Time.inHours model)

    hourHandX =
      toString (50 + 40 * cos hourAngle)

    hourHandY =
      toString (50 + 40 * sin hourAngle)

    timeToDisplay =
      toString (Date.fromTime Time.hour)

  in
    div []
    [ svg [ viewBox "0 0 100 100", width "300px" ]
      [ circle [ cx "50", cy "50", r "45", fill "#ceecee" ] []
      , line [ x1 "50", y1 "50", x2 minuteHandX, y2 minuteHandY, stroke "#000" ] []
      , line [ x1 "50", y1 "50", x2 hourHandX, y2 hourHandY, stroke "#eee" ] []
      ]
    , div [] [Html.text timeToDisplay] 
    ]
