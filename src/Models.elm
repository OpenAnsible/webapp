module Models exposing ( AppModel, init )

import Hop.Types
import Routes exposing (Route)
import Messages exposing (Msg)

type alias AppModel = { location : Hop.Types.Location, route : Route }


newAppModel : Route -> Hop.Types.Location -> AppModel
newAppModel route location = { route = route, location = location }

init : ( Route, Hop.Types.Location ) -> ( AppModel, Cmd Msg )
init ( route, location ) = ( newAppModel route location, Cmd.none )