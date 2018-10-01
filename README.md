# Elm Chat
Yet another Elm example application.

[DEMO](http://madsbuch.com/elm-chat/)

This application showcases:

* Basic Elm architecture
* Layout
    - Grid
    - Input
* Websockets

_This is work-in-progress_

## Structure
This app presents a generic application architecture which can be adopted
for all smaller applications. First, what constitutes a little application?

* Small model: The application state should be representable in a little set
  of types. Thumb rule: They should all fit in one file such that the reader
  of the code can get an overview.
* Small number of messages: They should all fit en one file.
* Only one logical component in the application.

The structure is as follows:

* Layout.elm
* Main.elm
* Model.elm
* Msg.elm
* Subscriptions.elm
* Update.elm 
* Views folder containing all views. A view is responsible for firing Msg's
  and/or translating the model into HTML.
