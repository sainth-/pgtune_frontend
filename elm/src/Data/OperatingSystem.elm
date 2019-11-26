{-
   pgtune
   A service to generate some optimized configuration parameters for PostgreSQL based on best practices.

   The version of the OpenAPI document: 1.0
   Contact: sainth@sainth.de

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.OperatingSystem exposing (OperatingSystem(..), decoder, encode)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode


type OperatingSystem
    = Linux
    | MacOsX
    | Windows


decoder : Decoder OperatingSystem
decoder =
    Decode.string
        |> Decode.andThen
            (\str ->
                case str of
                    "Linux" ->
                        Decode.succeed Linux

                    "MacOsX" ->
                        Decode.succeed MacOsX

                    "Windows" ->
                        Decode.succeed Windows

                    other ->
                        Decode.fail <| "Unknown type: " ++ other
            )


encode : OperatingSystem -> Encode.Value
encode model =
    case model of
        Linux ->
            Encode.string "Linux"

        MacOsX ->
            Encode.string "MacOsX"

        Windows ->
            Encode.string "Windows"
