# convert_id

CLI tool that detects a UUID or ULID and converts between those types.

## Examples

    > ./convert_id 0189d0ae-9b6c-64e8-8379-e9b2480d443a
    01H78AX6VCCKM86YF9P940TH1T

    > ./convert_id 01H78AX6VCCKM86YF9P940TH1T
    0189d0ae-9b6c-64e8-8379-e9b2480d443a

    > ./convert_id abc123
    Cannot detect type

## Installation

This is a command line tool. The easiest way to install it is to clone this repo and copy or link the `./convert_id` executable to somewhere in your path.

If you'd like to develop on it the executable can be built with `mix escript.build`.