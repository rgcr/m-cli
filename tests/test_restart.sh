#!/usr/bin/env bats

PLUGIN="./plugins/restart"

@test "restart --help exits 0" {
  run $PLUGIN --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: m restart"* ]]
}

@test "restart --help documents --auth" {
  run $PLUGIN --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"--auth"* ]]
}

@test "restart --help documents --force" {
  run $PLUGIN --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"--force"* ]]
}
