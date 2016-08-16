module Update exposing (urlUpdate, stateUpdate)

import Navigation
import Hop
import Hop.Types
import Models
import Routes   exposing (Route(HomeRoute, AboutRoute, NotFoundRoute))
import Messages exposing (Msg(ShowHome, ShowAbout, ShowNotFound))

urlUpdate : ( Routes.Route, Hop.Types.Location ) 
                -> Models.Model -> ( Models.Model, Cmd Messages.Msg )
urlUpdate ( route, location ) model =
    let _ = Debug.log "urlUpdate location" location in 
            ( { model | route = route, location = location }, Cmd.none )


stateUpdate : Msg -> Models.Model -> ( Models.Model, Cmd Messages.Msg )
stateUpdate msg model =
    case Debug.log "msg" msg of
        ShowNotFound -> 
            let path = Routes.reverse NotFoundRoute in 
                ( model, Navigation.newUrl (Hop.makeUrl Routes.config path) )
        ShowHome ->
            let path = Routes.reverse HomeRoute in 
                ( model, Navigation.newUrl (Hop.makeUrl Routes.config path) )
        ShowAbout ->
            let path = Routes.reverse AboutRoute in 
                ( model, Navigation.newUrl (Hop.makeUrl Routes.config path) )

