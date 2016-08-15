

import Html exposing (node, div, button, text, h1, span, p, nav, footer, ul, li, a, input)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (class, style, href, type', rel, placeholder)
import Html.Events exposing (onClick)

import Debug
import Navigation
import Hop exposing (matcherToPath, matchUrl, makeUrl, makeUrlFromLocation, clearQuery, removeQuery, setQuery, addQuery)
import Hop.Matchers exposing (match1, match2, match3, match4, nested1, nested2)
import Hop.Types exposing (Config, Location, Query, Router, PathMatcher, newLocation, newQuery)


matchers : List (PathMatcher Route)
matchers = [ match1 HomeRoute "", match1 AboutRoute "/about" ]


config : Config Route
config = { basePath = "", hash = False, matchers = matchers, notFound = NotFoundRoute }

reverse : Route -> String
reverse route =
    case route of
        HomeRoute ->
            matcherToPath (match1 HomeRoute "/") []

        AboutRoute ->
            matcherToPath (match1 AboutRoute "/about") []

        NotFoundRoute ->
            "404"

urlParser : Navigation.Parser ( Route, Hop.Types.Location )
urlParser = Navigation.makeParser (.href >> matchUrl config)

urlUpdate : ( Route, Hop.Types.Location ) -> AppModel -> ( AppModel, Cmd Msg )
urlUpdate ( route, location ) model =
    let
        _ =
            Debug.log "urlUpdate location" location
    in
        ( { model | route = route, location = location }, Cmd.none )



type alias AppModel = { 
    --languages : List Language
    location : Location, 
    route : Route 
    --, selectedLanguage : Maybe Language
}


newAppModel : Route -> Hop.Types.Location -> AppModel
newAppModel route location = { location = location, route = route }

init : ( Route, Hop.Types.Location ) -> ( AppModel, Cmd Msg )
init ( location, route ) = ( newAppModel location route, Cmd.none )

main : Program Never
main = Navigation.program urlParser { init = init,
    view = view,
    update = update,
    urlUpdate = urlUpdate,
    subscriptions = ( always Sub.none ) }


--main = beginnerProgram { model = 100, view = view, update = update }

--node "link" [rel "stylesheet", type' "text/css", href "/assets/css/bootstrap.min.css"] [],
--node "link" [rel "stylesheet", type' "text/css", href "/assets/css/bootstrap-theme.min.css"] [],
--node "link" [rel "stylesheet", type' "text/css", href "/assets/css/common.css"] [],
--node "link" [rel "stylesheet", type' "text/css", href "/assets/css/main.css"] [],

view : AppModel -> Html.Html Msg
view model =
    div [] [
        --node "link" [rel "stylesheet", type' "text/css", href "/assets/css/bootstrap.min.css"] [],
        --node "link" [rel "stylesheet", type' "text/css", href "/assets/css/bootstrap-theme.min.css"] [],
        --node "link" [rel "stylesheet", type' "text/css", href "/assets/css/common.css"] [],
        --node "link" [rel "stylesheet", type' "text/css", href "/assets/css/main.css"] [],
        nav [class "navbar navbar-default navbar-fixed-top"] [
            div [class "container"] [
                div [class "navbar-header"] [ a [class "navbar-brand", href "javascript:;"] [text "OpenAnsible"]],
                ul [class "nav navbar-nav"] [
                    li [class "active"] [ a [] [text "探索"] ],
                    li [] [ a [class "hehe", href "javascript:;", onClick ShowHome] [text "热门"] ],
                    li [] [ a [class "hehe", href "javascript:;", onClick ShowAbout] [text "分类"] ],
                    li [] [ a [class "hehe", href "javascript:;", onClick ShowNotFound] [text "NotFound"] ]
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
                case model.route of
                    HomeRoute ->
                        div [] [
                        div [class "page-header"] [
                            h1 [] [text "OpenAnsible Web Application"]
                        ],
                        p [] [text """This is a simple hero unit, 
                                    a simple jumbotron-style component for calling extra attention 
                                    to featured content or information. Learn more"""
                        ],
                        div [class "btn-group"] [
                            --button [ onClick Decrement, class "btn btn-primary" ] [ text "-" ],
                            --button [ class "btn btn-info" ] [ text (toString model) ],
                            --button [ onClick Increment, class "btn btn-danger" ] [ text "+" ]
                        ]
                        ]
                    AboutRoute ->
                        div [] [
                        div [class "page-header"] [
                            h1 [] [text "Page About"]
                        ],
                        p [] [text """This is a simple hero unit, 
                                    a simple jumbotron-style component for calling extra attention 
                                    to featured content or information. Learn more"""
                        ],
                        div [class "btn-group"] [
                            --button [ onClick Decrement, class "btn btn-primary" ] [ text "-" ],
                            --button [ class "btn btn-info" ] [ text (toString model) ],
                            --button [ onClick Increment, class "btn btn-danger" ] [ text "+" ]
                        ]
                        ]
                    NotFoundRoute ->
                        div [] [
                        div [class "page-header"] [
                            h1 [] [text "Page NotFound"]
                        ],
                        p [] [text """NotFound"""
                        ],
                        div [class "btn-group"] [
                            --button [ onClick Decrement, class "btn btn-primary" ] [ text "-" ],
                            --button [ class "btn btn-info" ] [ text (toString model) ],
                            --button [ onClick Increment, class "btn btn-danger" ] [ text "+" ]
                        ]
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

type Route = HomeRoute | AboutRoute | NotFoundRoute
--type Msg   = Increment | Decrement  | ShowHome | ShowAbout
type Msg   = ShowHome | ShowAbout | ShowNotFound

navigationCmd : String -> Cmd a
navigationCmd path = Navigation.newUrl (makeUrl config path)

update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case Debug.log "msg: " msg of
        --Increment ->
        --    model + 1

        --Decrement ->
        --    model - 1
        ShowNotFound -> 
            let path = reverse NotFoundRoute in ( model, navigationCmd path )
        ShowHome ->
            let path = 
                reverse HomeRoute 
            in 
                ( model, navigationCmd path )

        ShowAbout ->
            let path = 
                reverse AboutRoute 
            in 
                ( model, navigationCmd path )

