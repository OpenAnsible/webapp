module Views.Footer exposing ( view )


import Html exposing (node, div, button, text, h1, span, p, nav, footer, ul, li, a, input)
import Html.Attributes exposing (class, style, href, type', rel, placeholder)
import Html.Events exposing (onClick)

import Models exposing (AppModel)
--import Messages exposing (Msg)
import Messages exposing (..)

view : AppModel -> Html.Html Msg
view model =
        footer [class "footer"] [
            div [class "container"] [
                p [class "text-muted"] [text """Designed and built with all the love 
                            in the world by @mdo and @fat. Maintained by the core team 
                            with the help of our contributors. Code licensed MIT, docs CC BY 3.0."""
                ]
            ]
        ]