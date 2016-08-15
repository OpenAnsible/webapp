module Main exposing (..)

import Html exposing (node, div, button, text, h1, span, p, nav, footer, ul, li, a, input)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (class, style, href, type', rel, placeholder)
import Html.Events exposing (onClick)

import Debug
import Navigation
import Hop exposing (matcherToPath, matchUrl, makeUrl, makeUrlFromLocation, 
    clearQuery, removeQuery, setQuery, addQuery)
import Hop.Matchers exposing (match1, match2, match3, match4, nested1, nested2)
import Hop.Types exposing (Config, Location, Query, Router, PathMatcher, newLocation, newQuery)

import Views.Nav
import Views.Footer
import Views.Home
import Views.About
import Views.Notfound

import Models exposing (AppModel, init)

--import Routes exposing (Route, config, reverse, matchers)
--import Messages exposing (Msg)
import Routes exposing (..)
import Messages exposing (..)

urlParser : Navigation.Parser ( Route, Hop.Types.Location )
urlParser = Navigation.makeParser (.href >> matchUrl config)

urlUpdate : ( Route, Hop.Types.Location ) -> AppModel -> ( AppModel, Cmd Msg )
urlUpdate ( route, location ) model =
    let _ = Debug.log "urlUpdate location" location in 
            ( { model | route = route, location = location }, Cmd.none )


main : Program Never
main = Navigation.program urlParser { init = init,
                                      view = view,
                                      update = update,
                                      subscriptions = ( always Sub.none ),
                                      urlUpdate = urlUpdate }


--main = beginnerProgram { model = 100, view = view, update = update }

view : AppModel -> Html.Html Msg
view model =
    div [] [
        --node "link" [rel "stylesheet", type' "text/css", href "/assets/css/bootstrap.min.css"] [],
        --node "link" [rel "stylesheet", type' "text/css", href "/assets/css/bootstrap-theme.min.css"] [],
        --node "link" [rel "stylesheet", type' "text/css", href "/assets/css/common.css"] [],
        --node "link" [rel "stylesheet", type' "text/css", href "/assets/css/main.css"] [],
        Views.Nav.view model,
        case model.route of
            HomeRoute -> 
                Views.Home.view model
            AboutRoute ->
                Views.About.view model
            NotFoundRoute ->
                Views.Notfound.view model
        , Views.Footer.view model
    ]


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case Debug.log "msg" msg of
        ShowNotFound -> 
            let path = reverse NotFoundRoute in 
                ( model, Navigation.newUrl (makeUrl config path) )
        ShowHome ->
            let path = reverse HomeRoute in 
                ( model, Navigation.newUrl (makeUrl config path) )
        ShowAbout ->
            let path =  reverse AboutRoute in 
                ( model, Navigation.newUrl (makeUrl config path) )

