

import Html exposing (div, button, text, h1, span, p, nav, footer, ul, li, a, input)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (class, href, type', placeholder)
import Html.Events exposing (onClick)


main =
    beginnerProgram { model = 100, view = view, update = update }


view model =
    div [] [
        nav [class "navbar navbar-default navbar-fixed-top"] [
            div [class "container"] [
                div [class "navbar-header"] [ a [class "navbar-brand", href "javascript:;"] [text "OpenAnsible"]],
                ul [class "nav navbar-nav"] [
                    li [class "active"] [ a [] [text "探索"] ],
                    li [] [ a [] [text "热门"] ],
                    li [] [ a [] [text "分类"] ]
                    
                ],
                div [class "navbar-form navbar-right"] [
                    div [class "form-group"] [input [type' "text", placeholder "Email", class "form-control"] []],
                    div [class "form-group"] [input [type' "password", placeholder "Password", class "form-control"] []],
                    button [type' "submit", class "btn btn-success"] [text "登录"]
                ]
                --ul [class "nav navbar-nav navbar-right"] [
                --    li [] [ a [] [text "登记"] ],
                --    li [] [ a [] [text "登入"] ],
                --    li [] [ a [] [text "登出"] ]
                --]
            ]
        ],
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
                    button [ onClick Decrement, class "btn btn-primary" ] [ text "-" ],
                    button [ class "btn btn-info" ] [ text (toString model) ],
                    button [ onClick Increment, class "btn btn-danger" ] [ text "+" ]
                ]
            ]
        ],
        footer [class "footer"] [
            div [class "container"] [
                p [class "text-muted"] [text """Designed and built with all the love 
                            in the world by @mdo and @fat. Maintained by the core team 
                            with the help of our contributors. Code licensed MIT, docs CC BY 3.0."""
                ]
            ]
        ]
    ]

type Msg = Increment | Decrement


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1
