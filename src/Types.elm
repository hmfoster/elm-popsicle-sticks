module Types exposing (..)


type alias Model =
    { picked : Student, roster : Class, queue : Class }


type alias Student =
    String


type alias Class =
    List Student


type Msg
    = Pick
    | Skip
    | ShuffledQueue Class
    | Reshuffle
