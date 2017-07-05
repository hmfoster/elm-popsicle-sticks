module View exposing (root)

import Html exposing (..)
import Types exposing (..)
import Html.Events as E exposing (onClick)


root : Model -> Html Msg
root model =
    div []
        [ button [ E.onClick Pick ] [ text "Pick a name" ]
        , button [ E.onClick Skip ] [ text "Skip and pick another" ]
        , h2 [] [ text "Up Next..." ]
        , h2 [] [ text (toString model) ]
        , button [ E.onClick Reshuffle ] [ text "Reshuffle names" ]
        ]
