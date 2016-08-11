

import Html exposing (div, button, text, h1, span)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main =
  beginnerProgram { model = 0, view = view, update = update }


view model =
    div [class ""] [ 
        h1 [] [text "OpenAnsible Web Application"],
        div [class "panel panel-default"] [
            div [class "panel-heading"] [text "Button Test"],
            div [class "panel-body"] [
                button [ onClick Decrement, class "btn btn-primary" ] [ text "-" ],
                span [] [ text (toString model) ],
                button [ onClick Increment, class "btn btn-danger" ] [ text "+" ]
            ]
        ]
    ]


type Msg = Increment | Decrement


update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1
