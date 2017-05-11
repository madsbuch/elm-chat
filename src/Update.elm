module Update exposing (..)

import Msg exposing (..)
import Model exposing (..)
import Config exposing (socketAddr)

import WebSocket
import Json.Decode as Json
import Material

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp -> ( model, Cmd.none )
        AddMessage -> ( { model | currentMsg = ""}, WebSocket.send socketAddr model.currentMsg )
        UpdateCurrentMsg msg -> ( { model | currentMsg = msg }, Cmd.none )
        NewMessage msg -> ( { model | chatMsgs = msg :: model.chatMsgs}, Cmd.none )
        Mdl msg_ -> Material.update Mdl msg_ model