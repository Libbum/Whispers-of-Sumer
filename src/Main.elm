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


type alias Manifest =
    Dict Int (Html Msg)


loadManifest : () -> ( Manifest, Cmd Msg )
loadManifest _ =
    ( Dict.fromList
        [ ( 0
          , div []
                [ text "All 7 tablets. They each measure 95cm high, 45cm wide."
                , br [] []
                , text "They're not mounted yet and the lights I had on them when these photos were taken are not ideal—so some are a bit blurry. I'll get better images when I've made their mount and lighting rig."
                , br [] []
                , text "Each block on each tablet represents a major occurrence from the relevant original tablet. I'll briefly describe each block in the close-ups and attempt to fill in the gaps of the story line, but reading the epic itself will help you appreciate the piece more. Fell free to get in contact if you'd like to know more."
                ]
          )

        -- Full Tablet Images
        , ( 1, text "" )
        , ( 2, text "" )
        , ( 3, text "" )
        , ( 4, text "" )
        , ( 5, text "" )
        , ( 6, text "" )
        , ( 7, text "" )

        -- TODO: Should use some <p> elements when we need larger breaks
        -- Individual Panels
        , ( 11
          , div []
                [ text "“When skies above were not yet named,"
                , br [] []
                , text "Nor earth below pronounced by name,"
                , br [] []
                , text "Apsu, the first one, their begetter"
                , br [] []
                , text "And maker Tiamat, who bore them all,"
                , br [] []
                , text "Had mixed their waters together,"
                , br [] []
                , text "But had not formed pastures, nor discovered reed-beds;"
                , br [] []
                , text "When yet no gods were manifest,"
                , br [] []
                , text "Nor names pronounced, nor destinies decreed,"
                , br [] []
                , text "Then gods were born within them.”"
                ]
          )
        , ( 12
          , div []
                [ text "Apsu became mad at the gods for making a din and together with his vizier Mummu sat in front of Tiamat to discuss the issue."
                , br [] []
                , text "“I shall abolish their ways and disperse them!”"
                ]
          )
        , ( 13
          , div []
                [ text "Ea found out about this and put a sleeping spell upon Apsu and Mummu."
                , br [] []
                , text "“He held Apsu down and slew him."
                , br [] []
                , text "…"
                , br [] []
                , text "Then he rested very quietly inside his private quarters.”"
                ]
          )
        , ( 14
          , div []
                [ text "With his consort Daminka, Ea begot Marduk (Left)."
                , br [] []
                , text "“Elevated far above them, he was superior in every way.”"
                , br [] []
                , text "Meanwhile, Tiamat was pissed Apsu had been slain. Mother Huber, who fashions all things, created unfaceable weapons for her (Right). A horned serpent, a mušhššu dragon, a lahmu hero, an ugallu daemon, a rabid dog, a scorpion man etc."
                ]
          )
        , ( 21
          , div []
                [ text "It was reported to Ea that Tiamat had prepared for war, he approached Anšar and relayed the news."
                , br [] []
                , text "Anšar commanded Ea to confront Tiamat."
                ]
          )
        , ( 22
          , div []
                [ text "That didn't go very well."
                , br [] []
                , text "“Her strength is mighty, she is completely terrifying."
                , br [] []
                , text "Her crowd is too powerful, nobody could defy her."
                , br [] []
                , text "Her noise never lessens, it was too loud for me."
                , br [] []
                , text "I feared her shout, and I turned back.”"
                , br [] []
                , text "Text reads:"
                , br [] []
                , text "Tiamat, Ea"
                ]
          )
        , ( 23
          , div []
                [ text "Tiamat needed to be silenced."
                , br [] []
                , text "Marduk approaches Anšar and accepts the task."
                ]
          )
        , ( 24
          , div []
                [ text "Marduk is praised and labelled a Hero."
                ]
          )
        , ( 25
          , div []
                [ text "Marduk sets out in the storm chariot to challenge Tiamat."
                ]
          )
        , ( 31
          , div []
                [ text "Anšar speaks to Kakka, his vizier; charging him with setting up a meeting of the gods."
                , br [] []
                , text "Text reads:"
                , br [] []
                , text "Anšar"
                ]
          )
        , ( 32
          , div []
                [ text "Kakka approaches Laḫmu and Laḫamu, advising them of Tiamat's imminent wrath and Marduk's mission to stop her."
                , br [] []
                , text "Text reads:"
                , br [] []
                , text "Laḫmu,"
                , br [] []
                , text "Laḫamu"
                ]
          )
        , ( 33
          , div []
                [ text "All the great gods who fix the fates meet."
                , br [] []
                , text "“They decreed destiny for Marduk their champion.”"
                ]
          )
        , ( 34
          , div []
                [ text "“They founded a princely shrine for him.”"
                ]
          )
        , ( 35
          , div []
                [ text "“O Marduk, you are our champion!"
                , br [] []
                , text "We hereby give you sovereignty over all of the whole universe.”"
                ]
          )
        , ( 41
          , div []
                [ text "Tablet IV is a depiction of how Marduk gets ready for battle and how great he is. Not that he's actually done anything yet. This block represents many ideas that will take too long to get into here. Suffice to say it is a depiction of battle preparations. The twin snakes are a fairly well known symbol, but not for the original reasons. The cutter of Ninharsag is also represented."
                ]
          )
        , ( 42
          , div []
                [ text "The battle itself."
                , br [] []
                , text "“Tiamat screamed aloud in passion,"
                , br [] []
                , text "Her lower parts shook together from the depths."
                , br [] []
                , text "She recited the incantation and kept casting her spell."
                , br [] []
                , text "Meanwhile, the gods of battle were sharpening their weapons."
                , br [] []
                , text "Face to face they came, Tiamat and Marduk, sage of the gods.<Paste>"
                , br [] []
                , text "They engaged in combat, they closed for battle.”"
                ]
          )
        , ( 43
          , div []
                [ text "“He shot an arrow which pierced her belly,"
                , br [] []
                , text "Split her down the middle and slit her heart,"
                , br [] []
                , text "Vanquished her and extinguished her life."
                , br [] []
                , text "He threw down her corpse and stood on top of her.”"
                ]
          )
        , ( 51
          , div []
                [ text "After beating the snot out of everyone helping her, Marduk took to desecrating the body of Tiamat."
                , br [] []
                , text "“The Lord trampled the lower part of Tiamat,"
                , br [] []
                , text "With his unsparing mace smashed her skull,"
                , br [] []
                , text "Severed the arteries of her blood,"
                , br [] []
                , text "And made the north wind carry it off as good news.”"
                ]
          )
        , ( 52
          , div []
                [ text "“He sliced her in half like a fish for drying:"
                , br [] []
                , text "Half of her he put up to roof the sky,”"
                , br [] []
                , text "He then starts his long list of decrees:"
                , br [] []
                , text "“As for the stars, he set up constellations corresponding to them."
                , br [] []
                , text "…"
                , br [] []
                , text "Apportioned three stars to each of the 12 months."
                , br [] []
                , text "…"
                , br [] []
                , text "With her liver he located the heights."
                , br [] []
                , text "He made the crescent moon appear, entrusted night to it.”"
                ]
          )
        , ( 53
          , div []
                [ text "“He opened the Euphrates and the Tigris from her eyes,"
                , br [] []
                , text "…"
                , br [] []
                , text "He piled up clear-cut mountains from her udder,”"
                , br [] []
                , text "Text reads:"
                , br [] []
                , text "Euphrates,"
                , br [] []
                , text "Tigris"
                ]
          )
        , ( 54
          , div []
                [ text "The gods praise Marduk for his deeds."
                ]
          )
        , ( 55
          , div []
                [ text "Mešhuššu dragon at his feet, the gods exalt him."
                , br [] []
                , text "Marduk wants a city created for him."
                , br [] []
                , text "“I shall make a house to be a luxurious dwelling for myself"
                , br [] []
                , text "And shall found his cult centre within it,"
                , br [] []
                , text "…"
                , br [] []
                , text "I hear-by name it Babylon, home of the great gods.”"
                , br [] []
                , text "Text reads:"
                , br [] []
                , text "Babylon"
                ]
          )
        , ( 61
          , div []
                [ text "Marduk talks to Ea:"
                , br [] []
                , text "“Let me put blood together, and make bones too."
                , br [] []
                , text "Let me set up a primeval man: Man shall be his name."
                , br [] []
                , text "…"
                , br [] []
                , text "The work of the gods shall be imposed on him, and so they shall be at leisure.”"
                ]
          )
        , ( 62
          , div []
                [ text "They needed blood for this plan too work. The gods agreed that Qingu should be the one to be sacrificed as:"
                , br [] []
                , text "“It was Qingu who started the war, He who incited Tiamat and gathered an army!”"
                , br [] []
                , text "“They bound him and held him in front of Ea,"
                , br [] []
                , text "Imposed the penalty on him and cut off his blood, He created mankind from his blood,”"
                ]
          )
        , ( 63
          , div []
                [ text "This is a very famous scene from Babylonian history. It shows Ea and Ninharsag creating humans."
                ]
          )
        , ( 64
          , div []
                [ text "Men were created to toil for the gods."
                ]
          )
        , ( 65
          , div []
                [ text "Babylon was built by these slaves as the gods watched on."
                ]
          )
        , ( 71
          , div []
                [ text "The end of Tablet VI and all of Tablet VII are dedicated to Marduk's 50 names. Names that were bestowed upon him for his greatness. Other texts such as Adapa, Anzu & Atrahasis have more to say about the end of the epic—as well as analyses from other, more contemporary scholars. Instead of finishing the piece off with 50 names, it was decided to attempt to finish the story as considered in these connected texts:"
                , br [] []
                , text "The gods raised man in their image, but immortality they did not give man. For only the gods have that power."
                , br [] []
                , text "Text reads:"
                , br [] []
                , text "Enkidu"
                , br [] []
                , text "Enkidu was half man half ape, quite wild and is supposedly one of the first beings created by Ea that represented Man. There are a number of weird half man half lion etc creatures depicted in the art of the Babylonians in reference to Ea's experiments. Enkidu was used in this context as a synonym for evolution, as this concept wasn't invented until Lamarck and Darwin."
                ]
          )
        , ( 72
          , div []
                [ text "The gods gave man the gift of farming, city building, and much much more. But not everything can just be handed to you."
                ]
          )
        , ( 73
          , div []
                [ text "The gods left, retuning to their own home; leaving man to his own devices. Perhaps to return one day when we have evolved to a certain state."
                ]
          )
        , ( 74
          , div []
                [ text "The gift of immortality may be within our grasp, knowledge may be the tool to we can use to reach that end, but which path are we to take to become gods ourselves?"
                , br [] []
                , text "Text reads:"
                , br [] []
                , text "May you live forever. Well, it would if there wasn't a spelling mistake!"
                ]
          )
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
            [ div [ class "all" ] [ viewImageThumb 0 ]
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
            , panelThumbs manifest
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


isPanel : Int -> Html Msg -> Bool
isPanel id _ =
    id > 7


panelThumbs : Manifest -> Html Msg
panelThumbs manifest =
    div [ class "panels" ]
        (manifest
            |> Dict.filter isPanel
            |> Dict.keys
            |> List.map viewImageThumb
        )


viewImage : Int -> Manifest -> Html Msg
viewImage id manifest =
    let
        description =
            Dict.get id manifest
    in
    case description of
        Just desc ->
            img [ src (imageFile id) ] []

        Nothing ->
            text ""


imageFile : Int -> String
imageFile id =
    "/images/" ++ String.padLeft 2 '0' (String.fromInt id) ++ ".jpg"


viewImageThumb : Int -> Html Msg
viewImageThumb id =
    button [ onClick (ShowImage id) ] [ img [ src (imageThumbnail id) ] [] ]


imageThumbnail : Int -> String
imageThumbnail id =
    "/images/" ++ String.padLeft 2 '0' (String.fromInt id) ++ "_thumb.jpg"


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
