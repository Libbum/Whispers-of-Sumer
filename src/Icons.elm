module Icons exposing (chevronLeft, chevronRight, info, x)

import Html exposing (Html)
import Html.Attributes
import TypedSvg exposing (circle, line, polyline, svg)
import TypedSvg.Attributes exposing (class, cx, cy, points, r, viewBox, x1, x2, y1, y2)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Types exposing (px)


svgIcon : String -> List (Svg msg) -> Html msg
svgIcon className =
    svg
        [ class [ "icon ", className ]
        , viewBox 0 0 24 24
        ]


chevronLeft : Html msg
chevronLeft =
    svgIcon "chevron-left"
        [ polyline [ points [ ( 15, 18 ), ( 9, 12 ), ( 15, 6 ) ] ] []
        ]


chevronRight : Html msg
chevronRight =
    svgIcon "chevron-right"
        [ polyline [ points [ ( 9, 18 ), ( 15, 12 ), ( 9, 6 ) ] ] []
        ]


info : Html msg
info =
    svgIcon "info"
        [ circle [ cx (px 12), cy (px 12), r (px 10) ] []
        , line [ x1 (px 12), y1 (px 16), x2 (px 12), y2 (px 12) ] []
        , line [ x1 (px 12), y1 (px 8), x2 (px 12), y2 (px 8) ] []
        ]


x : Html msg
x =
    svgIcon "x"
        [ line [ x1 (px 18), y1 (px 6), x2 (px 6), y2 (px 18) ] []
        , line [ x1 (px 6), y1 (px 6), x2 (px 18), y2 (px 18) ] []
        ]
