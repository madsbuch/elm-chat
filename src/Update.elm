module Update exposing (update)

import Msg exposing (..)
import Model exposing (..)
import Config exposing (socketAddr)

import WebSocket
import Json.Decode as Json
import Material

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp                    -> model |> noCmd
        AddMessage              -> ( { model | currentMsg = ""}, WebSocket.send socketAddr model.currentMsg )
        UpdateCurrentMsg msg    -> { model | currentMsg = msg } |> noCmd
        NewMessage msg          -> { model | chatMsgs = msg :: model.chatMsgs} |> noCmd
        Mdl msg_                -> Material.update Mdl msg_ model

noCmd model = (model, Cmd.none)