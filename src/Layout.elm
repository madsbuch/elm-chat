module Layout exposing (..)

import Html exposing (..)
import Material.Layout as Layout
import Material.Scheme
import Msg exposing (..)

makePage main model =
    Layout.render Mdl model.mdl
      [ Layout.fixedHeader ]
      { header = [ Layout.title [] [(Layout.row [] [h3 [] [text model.title]])]]
      , drawer = []
      , tabs = ([], [])
      , main = main
      } |> Material.Scheme.top
