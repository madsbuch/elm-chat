module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


import Material
import Material.Scheme
import Material.Button as Button
import Material.Textfield as Textfield
import Material.Options as Options exposing (css)
import Material.Grid as G
import Material.List as L

import Model exposing (..)
import Msg exposing (..)
import Update exposing (..)
import Subscriptions exposing (..)


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

-- MAIN

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }