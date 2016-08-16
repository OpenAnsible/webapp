module Main exposing (..)

import Debug
import Html exposing (node, div, button, text, h1, span, p, nav, footer, ul, li, a, input)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (class, style, href, type', rel, placeholder)
import Html.Events exposing (onClick)

import Navigation

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

