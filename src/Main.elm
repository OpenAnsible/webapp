module Main exposing (..)

import Debug

import Navigation
import Html.App exposing (beginnerProgram)

import Models
import Routes
import Messages
import Update

import Views.Layout

--main = beginnerProgram { model = 100, view = view, update = update }

model = { init = Models.init
        ,view = Views.Layout.layout
        ,update = Update.stateUpdate
        ,subscriptions = ( always Sub.none )
        ,urlUpdate = Update.urlUpdate }

main : Program Never
main = Navigation.program Routes.urlParser model

