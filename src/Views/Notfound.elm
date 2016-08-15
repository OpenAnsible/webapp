module Views.Notfound exposing ( view )


import Html exposing (node, div, button, text, h1, span, p, nav, footer, ul, li, a, input)
import Html.Attributes exposing (class, style, href, type', rel, placeholder)
import Html.Events exposing (onClick)

import Models exposing (AppModel)
--import Messages exposing (Msg)
import Messages exposing (..)

view : AppModel -> Html.Html Msg
view model =
    div [class "jumbotron"] [
        div [class "container"] [
            div [class "page-header"] [
                h1 [] [text "NotFound"]
            ],
            p [] [text "404"]
        ]
    ]