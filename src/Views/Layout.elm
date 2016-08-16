module Views.Layout exposing ( layout )

import Debug

import Html exposing (node, div, button, text, h1, 
        span, p, nav, footer, ul, li, a, input)
import Html.Attributes exposing (class, style, href, 
        type', rel, placeholder)
import Html.Events exposing (onClick)

import Models
import Routes
import Messages

import Views.Nav
import Views.Footer
import Views.Home
import Views.About
import Views.Notfound

layout : Models.Model -> Html.Html Messages.Msg
layout model =
    div [] [
        
        node "link" [rel "stylesheet", type' "text/css", href "/assets/css/bootstrap.min.css"] [],
        node "link" [rel "stylesheet", type' "text/css", href "/assets/css/bootstrap-theme.min.css"] [],
        node "link" [rel "stylesheet", type' "text/css", href "/assets/css/common.css"] [],
        node "link" [rel "stylesheet", type' "text/css", href "/assets/css/main.css"] [],

        Views.Nav.view model,
        case model.route of
            Routes.HomeRoute -> 
                Views.Home.view model
            Routes.AboutRoute ->
                Views.About.view model
            Routes.NotFoundRoute ->
                Views.Notfound.view model
        , Views.Footer.view model
    ]
