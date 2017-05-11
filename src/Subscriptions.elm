module Subscriptions exposing (..)

import WebSocket
import Msg exposing (..)
import Model exposing (..)
import Config exposing (socketAddr)

subscriptions : Model -> Sub Msg
subscriptions model = WebSocket.listen socketAddr NewMessage