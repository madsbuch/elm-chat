module Layout exposing (layout)

import Html exposing (..)
import Material.Layout as Layout
import Material.Scheme
import Material
import Material.Grid as G

import Msg exposing (..)
import Model exposing (..)

import View.InputForm exposing (..)
import View.ListMessages exposing (..)

layout model =
    Layout.render Mdl model.mdl
      [ Layout.fixedHeader ]
      { header = [ Layout.title [] [(Layout.row [] [h3 [] [text model.title]])]]
      , drawer = []
      , tabs = ([], [])
      , main = (top model)
      } |> Material.Scheme.top

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