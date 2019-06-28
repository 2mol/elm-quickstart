module Main exposing (main)

import Browser
import Html exposing (Html)


main =
    Browser.sandbox { init = initModel, update = update, view = view }


type alias Model =
    ()


type Msg =
    NoOp


initModel : Model
initModel =
    ()


view : Model -> Html Msg
view model =
    Html.div [] []


update : Msg -> Model -> Model
update msg model =
    model
