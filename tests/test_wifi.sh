#!/usr/bin/env bats

# Tests for plugins/wifi

PLUGIN="./plugins/wifi"

@test "wifi --help displays menu bar options" {
  run $PLUGIN --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: m wifi"* ]]
  [[ "$output" == *"--showmenu"* ]]
  [[ "$output" == *"--hidemenu"* ]]
  [[ "$output" == *"--menustatus"* ]]
}

@test "wifi --menustatus outputs visibility" {
  run $PLUGIN --menustatus
  [ "$status" -eq 0 ]
  [[ "$output" == *"Wi-Fi menu bar icon:"* ]]
}
