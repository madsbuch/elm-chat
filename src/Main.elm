module Main exposing (..)

import Html exposing (..)

import Model exposing (..)
import Msg exposing (..)
import Update exposing (..)
import Subscriptions exposing (..)
import Layout exposing (..)

main : Program Never Model Msg
main =
    program
        { init = init
        , view = layout
        , update = update
        , subscriptions = subscriptions
        }
