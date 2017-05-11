module Msg exposing (..)

import Material

type alias Mdl =
    Material.Model

type Msg = 
      NoOp
    | UpdateCurrentMsg String
    | AddMessage
    | NewMessage String
    | Mdl (Material.Msg Msg)