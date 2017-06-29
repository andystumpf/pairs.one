port module PortsIn exposing (..)

import Types.Game exposing (..)
import Json.Encode as JE


port onUpdatePlayer : (String -> msg) -> Sub msg


port onSendCompressedGame : (JE.Value -> msg) -> Sub msg


port onGameUpdate : (JE.Value -> msg) -> Sub msg
