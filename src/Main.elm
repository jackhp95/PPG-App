module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    main_ [ class "overflow-hidden flex flex-column justify-center items-center" ]
        [ header
            [ class "tc-ns pv5 ph4 self-stretch flex flex-column items-center"
            , style "background-position" "top"
            , style "background-image" "url('https://images.unsplash.com/photo-1456139333202-745e9029f0ef')"
            ]
            [ h1 [ class "relative fw7 orange f-headline-ns f1" ]
                [ text "SafeSkies"
                , span [ class "white relative" ]
                    [ text ".co"
                    , img
                        [ src "https://icongr.am/clarity/beta.svg?color=ffffff"
                        , alt "beta tag"
                        , class "absolute top--1 right-0 h3-ns w3-ns h2 w2"
                        ]
                        []
                    ]
                ]
            , p [ class "tc relative measure-narrow o-60 f3-ns f0 mb5" ]
                [ text "Leave your email for an invite to our a beta" ]
            , Html.form [ class "mt4 hover--bg-white bg-white-90 ba b--white bw1 br-pill relative flex overflow-hidden" ]
                [ input
                    [ type_ "email"
                    , placeholder "email@example.com"
                    , class "br0 pl2"
                    ]
                    []
                , button [ class "bg-orange white grow nr2 pr4 pl3" ] [ text "Send" ]
                ]
            , p [ class "glow relative mt2 mb4 measure black o-40 f7 tc bg-white pv1 ph3 br-pill" ]
                [ text "You will not be spammed." ]
            ]
        , cards
            |> List.map toCard
            |> (\x -> x ++ [ div [ class "pa3" ] [] ])
            |> ul [ class "flex overflow-x-auto relative nt5 pv4 w-100" ]
        ]


toCard : Card -> Html Msg
toCard { features, city, phrase } =
    article
        [ class "flex-none bg-blue br4 ml4 shadow-4 overflow-hidden grow white ba"
        , style "max-width" "80vw"
        , style "background-image" "url('windmap.png')"
        ]
        [ header [ class "flex justify-between ph3 pv2" ]
            [ h1 [ class "f5 fw7" ]
                [ text <| city ++ ", Missouri"
                ]
            , address [ class "dn ml5 f7 nr1 flex-ns items-center" ]
                [ text "38.9515, -92.3285"
                , img
                    [ src "https://icongr.am/clarity/crosshairs.svg?color=ffffff"
                    , alt "Location tag"
                    , class "ml1"
                    , style "height" "1.5em"
                    , style "width" "1.5em"
                    ]
                    []
                ]
            ]
        , section
            [ class "pa2"
            ]
            [ h2 [ class "f1 fw7 mw5 lh-solid pt5 pr4 pa2" ] [ text phrase ]
            , features
                |> List.map
                    (\( title, emoji, measure ) ->
                        li
                            [ class "hover-bg-orange white ma1 ma2-ns pv2 ph3 br3 ba b--white-60"
                            , class "flex-auto flex flex-column-ns items-center"
                            ]
                            [ img
                                [ src <| "https://icongr.am/clarity/" ++ emoji ++ ".svg?color=ffffff"
                                , alt "Location tag"
                                , class "ml1"
                                , style "height" "1.5em"
                                , style "width" "1.5em"
                                ]
                                []
                            , h3 [ class "dn-ns flex-auto mh2 mh0-ns" ] [ text title ]
                            , p [ class "" ] [ text measure ]
                            ]
                    )
                |> ul [ class "flex flex-row-ns flex-column flex-wrap-ns" ]
            ]
        ]


type alias Card =
    { city : String
    , phrase : String
    , features : List ( String, String, String )
    }


cards : List Card
cards =
    [ { city = "Columbia"
      , phrase = "It's Cold, but Safe"
      , features =
            [ ( "wind", "radar", "3mph" )
            , ( "storm", "bolt", "0%" )
            , ( "turbulance", "nvme", "none" )
            , ( "temp", "thermometer", "52f" )
            ]
      }
    , { city = "Kansas City"
      , phrase = "It's Turbulant."
      , features =
            [ ( "wind", "radar", "25mph" )
            , ( "storm", "bolt", "10%" )
            , ( "turbulance", "nvme", "8tke" )
            , ( "temp", "thermometer", "83f" )
            ]
      }
    , { city = "Lake of the Ozarks"
      , phrase = "It's Safe to Fly"
      , features =
            [ ( "wind", "radar", "3mph" )
            , ( "storm", "bolt", "2%" )
            , ( "turbulance", "nvme", "1tke" )
            , ( "temp", "thermometer", "71f" )
            ]
      }
    ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
