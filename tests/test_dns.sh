#!/usr/bin/env bats

# Tests for plugins/dns

PLUGIN="./plugins/dns"

@test "dns --help displays help and options" {
  run $PLUGIN --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: m dns"* ]]
  [[ "$output" == *"--list"* ]]
  [[ "$output" == *"--add"* ]]
  [[ "$output" == *"--remove"* ]]
  [[ "$output" == *"--clear"* ]]
  [[ "$output" == *"--flush"* ]]
}

@test "dns --list displays network service DNS" {
  run $PLUGIN --list
  [ "$status" -eq 0 ]
  [[ "$output" == *"DNS servers for network service:"* ]]
}
