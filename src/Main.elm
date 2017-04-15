module Main exposing (..)

import Html exposing (Html, div, text, program)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- MODEL


type alias Model = {
      title : String
    , chatMsgs : List String
    , currentMsg : String
}


init : ( Model, Cmd Msg )
init = ({
          title = "Hello Chat"
        , chatMsgs = ["hej", "med", "dig"]
        , currentMsg = ""
    }, Cmd.none)



-- MESSAGES

type Msg = 
      NoOp
    | UpdateCurrentMsg String
    | AddMessage

-- VIEW

view : Model -> Html Msg
view model =
    div []
        (      [ text model.title ] 
            ++ (showAllMessages model.chatMsgs)
            ++ inputForm)

showAllMessages msgs = case msgs of
    []      -> []
    (x::xs) -> (div [] [text x]) :: showAllMessages xs

inputForm = [
    Html.input [ placeholder "Chat message", onInput UpdateCurrentMsg ] [],
    Html.button [onClick AddMessage] [text "Send Message"]]

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp -> ( model, Cmd.none )
        AddMessage -> ( {
                title    = model.title,
                chatMsgs = model.currentMsg :: model.chatMsgs,
                currentMsg = ""
            }, Cmd.none )
        UpdateCurrentMsg msg ->( {
                title    = model.title,
                chatMsgs = model.chatMsgs,
                currentMsg = msg
            }, Cmd.none )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- MAIN

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }