#!/usr/bin/env bats

# Tests for plugins/itunes (and plugins/music symlink)

PLUGIN="./plugins/itunes"
MUSIC_PLUGIN="./plugins/music"

@test "itunes --help displays --toggle option" {
  run $PLUGIN --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: m Music"* ]] || [[ "$output" == *"Usage: m iTunes"* ]]
  [[ "$output" == *"--toggle"* ]]
  [[ "$output" == *"--playpause"* ]]
  [[ "$output" == *"--unmute"* ]]
}

@test "music --help displays --toggle option" {
  run $MUSIC_PLUGIN --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"--toggle"* ]]
}

@test "itunes toggle option handling" {
  run $PLUGIN --help
  [ "$status" -eq 0 ]
}
