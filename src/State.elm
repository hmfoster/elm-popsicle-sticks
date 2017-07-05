module State exposing (init, update, subscriptions)

import Types exposing (..)
import List exposing (..)
import Random.List exposing (shuffle)
import Random exposing (generate)
import Maybe exposing (..)


init : ( Model, Cmd Msg )
init =
    ( { picked = "a"
      , roster = [ "a", "b", "c", "d" ]
      , queue = [ "b", "c", "d" ]
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ShuffledQueue shuffledQueue ->
            { model | queue = shuffledQueue } ! []

        Pick ->
            pickNext model

        Skip ->
            skipNext model

        Reshuffle ->
            ( { model | picked = "" }, generate ShuffledQueue (shuffle model.roster) )


pickNext : Model -> ( Model, Cmd Msg )
pickNext model =
    let
        next =
            Maybe.withDefault "" (List.head model.queue)

        remaining =
            Maybe.withDefault [] (List.tail model.queue)
    in
        if List.isEmpty remaining then
            ( { model | picked = next }, generate ShuffledQueue (shuffle model.roster) )
        else
            { model | picked = next, queue = remaining } ! []


skipNext : Model -> ( Model, Cmd Msg )
skipNext model =
    let
        queue =
            if model.picked == "" then
                model.queue
            else
                model.queue ++ [ model.picked ]

        updated =
            { model | queue = queue }
    in
        pickNext updated


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
