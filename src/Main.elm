module Main exposing (main)

import Html
import State
import View
import Types


main : Program Never Types.Model Types.Msg
main =
    Html.program
        { init = State.init
        , update = State.update
        , subscriptions = State.subscriptions
        , view = View.root
        }
