module ChatCollection exposing (..)
{-
  Rsponsibility of this library:
  * Marhsalling / de-marshalling
  * 

-}


import WebSocket

{-
  Configuration
-}

--socketAddr = "ws://localhost:9160"
socketAddr = "ws://echo.websocket.org"

-- Model for this collection
type alias ObjectType = {
    msg : String
}
type alias Model = {
    objects : List ObjectType
}


{-
  Interface exports
-}

init : ( Model, Cmd Msg )
init = ({
    objects = []
    }, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = WebSocket.listen socketAddr ExtUpdate

-- MESSAGES
type Msg =
      NoOp
    | ExtUpdate String
    | AddObject ObjectType

-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp -> ( model, Cmd.none )
        AddObject o -> ( {
                objects = o :: model.objects,
            }, WebSocket.send socketAddr o.msg )
        ExtUpdate msg -> ( {
                objects = {msg = msg} :: model.objects,
            }, Cmd.none )

{-
Interface functions
-}
