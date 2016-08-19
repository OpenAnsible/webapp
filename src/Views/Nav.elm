module Views.Nav exposing ( view )

import Debug
import Html exposing (node, div, button, text, h1, span, p, nav, footer, ul, li, a, input)
import Html.Attributes exposing (class, style, href, type', rel, placeholder)
import Html.Events exposing (onClick)

import Models exposing (Model)
import Messages exposing ( Msg(..) )
import Routes exposing ( Route(..) )


view : Model -> Html.Html Msg
view model =
    nav [class "navbar navbar-default navbar-fixed-top"] [
        div [class "container"] [
            div [class "navbar-header"] [ a [class "navbar-brand", href "javascript:;", onClick Messages.ShowHome] [text "OpenAnsible"]],
            ul [class "nav navbar-nav"] [
                li [class (if model.route == Routes.HomeRoute then "active" else "")] [ a [href "javascript:;", onClick Messages.ShowHome] [text "探索"] ],
                li [class (if model.route == Routes.AboutRoute then "active" else "")] [ a [href "javascript:;", onClick Messages.ShowAbout] [text "热门"] ],
                li [class (if model.route == Routes.NotFoundRoute then "active" else "")] [ a [href "javascript:;", onClick Messages.ShowNotFound] [text "分类"] ],
                li [class (if model.route == Routes.NotFoundRoute then "active" else "")] [ a [href "javascript:;", onClick Messages.ShowNotFound] [text "NotFound"] ]
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
    ]