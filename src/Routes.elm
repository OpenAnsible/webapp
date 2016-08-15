--module Routes exposing (Route, matchers, config, reverse)
module Routes exposing (..)

import Navigation
import Hop.Types
import Hop.Matchers exposing (match1, match2, match3, match4, nested1, nested2)
import Hop exposing (matcherToPath, matchUrl, makeUrl, makeUrlFromLocation, 
    clearQuery, removeQuery, setQuery, addQuery)

type Route = HomeRoute | AboutRoute | NotFoundRoute

matchers : List (Hop.Types.PathMatcher Route)
matchers = [ match1 HomeRoute "", match1 AboutRoute "/about" ]


config : Hop.Types.Config Route
config = { basePath = "", hash = False, matchers = matchers, notFound = NotFoundRoute }

reverse : Route -> String
reverse route =
    case route of
        HomeRoute ->
            matcherToPath (match1 HomeRoute "/") []

        AboutRoute ->
            matcherToPath (match1 AboutRoute "/about") []

        NotFoundRoute ->
            "/404"


