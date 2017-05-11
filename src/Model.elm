module Model exposing (Model, init)

import Material

-- MODEL
type alias Model = {
      title : String
    , chatMsgs : List String
    , currentMsg : String
    , mdl : Material.Model
}


init : ( Model, Cmd a )
init = ({
          title = "Hello Chat"
        , chatMsgs = []
        , currentMsg = ""
        , mdl = Material.model
    }, Cmd.none)