#!/usr/bin/env bats

# XXX: need to test

# Path to your plugin
PLUGIN="./plugins/airdrop"

setup() {
  # Save original state
  original_state="$(defaults read com.apple.NetworkBrowser DisableAirDrop 2>/dev/null || echo "unset")"
}

teardown() {
  # Restore original state
  if [[ "$original_state" == "unset" ]]; then
    defaults delete com.apple.NetworkBrowser DisableAirDrop 2>/dev/null || true
  else
    defaults write com.apple.NetworkBrowser DisableAirDrop -bool "$original_state"
  fi
  killall Finder &>/dev/null || true
}

@test "airdrop --help" {
  run $PLUGIN --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: m airdrop"* ]]
}

@test "airdrop --disable" {
  run $PLUGIN --disable
  status=$(defaults read com.apple.NetworkBrowser DisableAirDrop)
  [ "$status" -eq 1 ]
}

@test "airdrop --enable" {
  run $PLUGIN --enable
  status=$(defaults read com.apple.NetworkBrowser DisableAirDrop)
  [ "$status" -eq 0 ]
}
