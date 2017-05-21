module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


import Material
import Material.Grid as G

import Model exposing (..)
import Msg exposing (..)
import Update exposing (..)
import Subscriptions exposing (..)
import Layout exposing (..)

import View.InputForm exposing (..)
import View.ListMessages exposing (..)


-- VIEW
view : Model -> Html Msg
view model = makePage (top model) model

top : Model -> List (Html Msg)
top model =
  [G.grid []
       [ G.cell [ G.size G.Tablet 2, G.size G.Desktop 3, G.size G.Phone 0 ]
           []
       , G.cell [ G.size G.Tablet 8, G.size G.Desktop 6, G.size G.Phone 12 ]
           [ div []
             (    (inputForm model)
               ++ [listMessages model])
           ]
       ]]

-- MAIN

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
