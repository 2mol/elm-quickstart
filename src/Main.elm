module Main exposing (main)

import Browser
import Html exposing (Html)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    ()


type alias Msg =
    ()


init =
    ()


view : Model -> Html msg
view model =
    Html.div [] []


update : Msg -> Model -> Model
update msg model =
    model
