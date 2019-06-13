module Main exposing (Msg(..), main, update, view)

import Base64.Decode exposing (decode, string)
import Browser
import Dict exposing (Dict)
import Html exposing (Html, a, br, button, div, footer, h1, header, hr, img, main_, p, section, span, text)
import Html.Attributes exposing (class, href, src)
import Html.Events exposing (onClick)
import List.Extra exposing (unconsLast)


main : Program () Manifest Msg
main =
    Browser.element { init = loadManifest, subscriptions = subscriptions, update = update, view = view }


type alias Image =
    { filename : String
    , description : Html Msg
    }


type alias Manifest =
    Dict Int Image


loadManifest : () -> ( Manifest, Cmd Msg )
loadManifest _ =
    ( Dict.fromList
        [ ( 0
          , { filename = "00.jpg"
            , description =
                div []
                    [ text "All 7 tablets. They each measure 95cm high, 45cm wide."
                    , br [] []
                    , text "They're not mounted yet and the lights I had on them when these photos were taken are not ideal—so some are a bit blurry. I'll get better images when I've made their mount and lighting rig."
                    , br [] []
                    , text "Each block on each tablet represents a major occurrence from the relevant original tablet. I'll briefly describe each block in the close-ups and attempt to fill in the gaps of the story line, but reading the epic itself will help you appreciate the piece more. Fell free to get in contact if you'd like to know more."
                    ]
            }
          )
        , ( 1, { filename = "01.jpg", description = text "" } )
        , ( 2, { filename = "02.jpg", description = text "" } )
        , ( 3, { filename = "03.jpg", description = text "" } )
        , ( 4, { filename = "04.jpg", description = text "" } )
        , ( 5, { filename = "05.jpg", description = text "" } )
        , ( 6, { filename = "06.jpg", description = text "" } )
        , ( 7, { filename = "07.jpg", description = text "" } )
        ]
    , Cmd.none
    )


type Msg
    = ShowImage Int


subscriptions : Manifest -> Sub Msg
subscriptions _ =
    Sub.none


update : Msg -> Manifest -> ( Manifest, Cmd Msg )
update msg manifest =
    case msg of
        ShowImage image ->
            ( manifest, Cmd.none )


view : Manifest -> Html Msg
view manifest =
    let
        ( info, link ) =
            getContact
    in
    main_ []
        [ header []
            [ h1 []
                [ text "Šumeru liḫšu "
                , span [ class "avoid-break" ] [ text "(Whispers of Sumer)" ]
                ]
            , p [] [ text "The Enûma Eliš is one of the oldest creation myths that have survived into modern times. In this piece, Jerry and I have attempted to portray the Epic with a multiplicity of interpretations. Capturing and transforming the Sumero–Babylonian style into a form that will awe the contemporary viewer; if not for the instant recognition of similitude with relics of the ancient world, then most certainly for the scale of the tablets—standing as colossus and testaments to the human condition." ]
            , hr [] []
            ]
        , section []
            [ viewImage <| Dict.get 0 manifest
            , div [ class "tablets" ]
                [ button [ onClick (ShowImage 1) ] [ text "Tablet I" ]
                , button [ onClick (ShowImage 2) ] [ text "Tablet II" ]
                , button [ onClick (ShowImage 3) ] [ text "Tablet III" ]
                , button [ onClick (ShowImage 4) ] [ text "Tablet IV" ]
                , button [ onClick (ShowImage 5) ] [ text "Tablet V" ]
                , button [ onClick (ShowImage 6) ] [ text "Tablet VI" ]
                , button [ onClick (ShowImage 7) ] [ text "Tablet VII" ]
                ]
            , hr [] []
            ]
        , footer []
            [ text "Design and text by "
            , a [ href "https://axiomatic.neophilus.net/about/" ] [ text "Tim DuBois" ]
            , text ", craftsmanship by Jerardo Lindh. For more details contact "
            , a [ href link ] [ text info ]
            , text "."
            ]
        ]


viewImage : Maybe Image -> Html Msg
viewImage image =
    case image of
        Just photo ->
            img [ src ("/images/" ++ imageThumbnail photo) ] []

        Nothing ->
            text ""


imageThumbnail : Image -> String
imageThumbnail image =
    let
        -- We split here and then join the name later to catch `file.name.jpg` conventions (if they are used)
        splitFile =
            unconsLast <| String.split "." image.filename
    in
    case splitFile of
        Just ( ext, splitName ) ->
            let
                name =
                    String.join "." splitName
            in
            String.join "_thumb." [ name, ext ]

        Nothing ->
            image.filename


getContact : ( String, String )
getContact =
    let
        info =
            "dGltQG5lb3BoaWx1cy5uZXQ="

        link =
            "bWFpbHRvOnRpbUBuZW9waGlsdXMubmV0P3N1YmplY3Q9V2hpc3BlcnMgb2YgU3VtZXI="

        realInfo =
            case decode string info of
                Ok res ->
                    res

                Err _ ->
                    ""

        realLink =
            case decode string link of
                Ok res ->
                    res

                Err _ ->
                    ""
    in
    ( realInfo, realLink )
