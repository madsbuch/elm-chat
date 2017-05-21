module View.ListMessages exposing (listMessages)

import Material.List as L
import Material.Options as Options exposing (css)
import Html exposing (text)

import Model exposing (..)

listMessages model = L.ul [] (showAllMessages model.chatMsgs)

showAllMessages msgs = case msgs of
    []      -> []
    (x::xs) -> (L.li [] [text x]) :: showAllMessages xs