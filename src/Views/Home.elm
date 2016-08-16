module Views.Home exposing ( view )


import Html exposing (node, div, button, text, h1, span, p, nav, footer, ul, li, a, input)
import Html.Attributes exposing (class, style, href, type', rel, placeholder)
import Html.Events exposing (onClick)

import Models exposing (Model)
import Messages exposing (Msg)

view : Model -> Html.Html Msg
view model =
    div [class "jumbotron"] [
        div [class "container"] [
            div [class "page-header"] [
                h1 [] [text "OpenAnsible Web Application"]
            ],
            p [] [text """This is a simple hero unit, 
                        a simple jumbotron-style component for calling extra attention 
                        to featured content or information. Learn more"""
            ],
            div [class "btn-group"] [
                button [ class "btn btn-primary" ] [ text "More" ]
            ]
        ]
    ]