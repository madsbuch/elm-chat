module View.InputForm exposing (inputForm)

import Material.Grid as G
import Material.Button as Button
import Material.Textfield as Textfield
import Material.Options as Options exposing (css)
import Html exposing (text, Html)

import Msg exposing (..)
import Model exposing (Model)

inputForm : Model -> List (Html Msg)
inputForm model = 
    [G.grid [] 
       [G.cell [G.size G.Desktop 10, G.size G.Tablet 6, G.size G.Phone 3]
          [Textfield.render Mdl [0] model.mdl
                    [ Textfield.label "Write your message"
                    , Textfield.textarea
                    , Textfield.floatingLabel
                    , Options.onInput UpdateCurrentMsg
                    , Textfield.value model.currentMsg
                    , Options.css "width" "100%"
                    ][]],
        G.cell [G.size G.All 1]
        [Button.render Mdl [0] model.mdl
                  [ Button.raised
                  , Button.ripple
                  , Options.onClick AddMessage
                  ]
                  [ text "Send Msg"]]]]