module Models exposing ( Model, init )

import Hop.Types
import Routes exposing (Route)
import Messages exposing (Msg)

type alias Model = { location : Hop.Types.Location, route : Route }

init : ( Route, Hop.Types.Location ) -> ( Model, Cmd Msg )
init ( route, location ) = ( { route = route, location = location }, Cmd.none )