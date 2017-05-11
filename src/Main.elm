module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import WebSocket
import Json.Decode as Json

import Material
import Material.Scheme
import Material.Button as Button
import Material.Textfield as Textfield
import Material.Options as Options exposing (css)
import Material.Grid as G
import Material.List as L

-- MODEL
type alias Model = {
      title : String
    , chatMsgs : List String
    , currentMsg : String
    , mdl : Material.Model
}


init : ( Model, Cmd Msg )
init = ({
          title = "Hello Chat"
        , chatMsgs = []
        , currentMsg = ""
        , mdl = Material.model
    }, Cmd.none)


--socketAddr = "ws://localhost:9160"
socketAddr = "ws://echo.websocket.org"

-- Auxiliary
onEnter : Msg -> Attribute Msg
onEnter msg =
    let
        isEnter code =
            if code == 13 then
                Json.succeed msg
            else
                Json.fail "not ENTER"
    in
        on "keydown" (Json.andThen isEnter keyCode)

-- MESSAGES
type Msg = 
      NoOp
    | UpdateCurrentMsg String
    | AddMessage
    | NewMessage String
    | Mdl (Material.Msg Msg)

type alias Mdl =
    Material.Model

-- VIEW
view : Model -> Html Msg
view = top 

top : Model -> Html Msg
top model =
  G.grid []
    [ G.cell [ G.size G.Tablet 2, G.size G.Desktop 3, G.size G.Phone 0 ]
        []
    , G.cell [ G.size G.Tablet 8, G.size G.Desktop 6, G.size G.Phone 12 ]
        [ div []
          ( [h1 [] [ text model.title ]]
            ++ (inputForm model)
            ++ [(L.ul [] (showAllMessages model.chatMsgs))])
        ]
    ] |> Material.Scheme.top

showAllMessages msgs = case msgs of
    []      -> []
    (x::xs) -> (L.li [] [text x]) :: showAllMessages xs

inputForm model = 
       [  {-Html.input [ 
              placeholder "Chat message"
            , onInput UpdateCurrentMsg
            , value model.currentMsg
            , onEnter AddMessage ] [],-}
            Textfield.render Mdl [2] model.mdl
          [ Textfield.label "Floating label"
          , Textfield.floatingLabel
          , Textfield.text_
          , Options.onInput UpdateCurrentMsg
          , Textfield.value model.currentMsg
          ]
          [],
        Button.render Mdl [0] model.mdl
          [ Button.raised
          , Button.ripple
          , Options.onClick AddMessage
          ]
          [ text "Send Msg"]]

-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp -> ( model, Cmd.none )
        AddMessage -> ( { model | currentMsg = ""}, WebSocket.send socketAddr model.currentMsg )
        UpdateCurrentMsg msg -> ( { model | currentMsg = msg }, Cmd.none )
        NewMessage msg -> ( { model | chatMsgs = msg :: model.chatMsgs}, Cmd.none )
        Mdl msg_ -> Material.update Mdl msg_ model

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = WebSocket.listen socketAddr NewMessage

-- MAIN

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }