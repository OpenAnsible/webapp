module Views.About exposing ( view )


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
                h1 [] [text "About OpenAnsible Web Application"]
            ],
            p [] [text "Page About"],
            div [class "btn-group"] [
                button [ class "btn btn-primary" ] [ text "More" ]
            ]
        ]
    ]