#!/usr/bin/env bats

# XXX: Need to test

setup() {
  SCRIPT="./appearance"

  # Guardar configuraciones originales
  ORIGINAL_ANTIALIAS=$(defaults read NSGlobalDomain AppleAntiAliasingThreshold 2>/dev/null || echo 0)
  ORIGINAL_DARKMODE=$(defaults read NSGlobalDomain AppleInterfaceStyle 2>/dev/null || echo "Light")
  ORIGINAL_TRANSPARENCY=$(defaults read com.apple.universalaccess ReduceTransparency 2>/dev/null || echo false)
  ORIGINAL_MAINCOLOR=$(defaults read NSGlobalDomain AppleAquaColorVariant 2>/dev/null || echo 1)
  ORIGINAL_HIGHLIGHTCOLOR=$(defaults read NSGlobalDomain AppleHighlightColor 2>/dev/null || echo "0.709800 0.835300 1.000000")
  ORIGINAL_SIDEBAR_SIZE=$(defaults read NSGlobalDomain NSTableViewDefaultSizeMode 2>/dev/null || echo 2)
  ORIGINAL_DOCK_SIZE=$(defaults read com.apple.dock tilesize 2>/dev/null || echo 48)
}

teardown() {
  # Restaurar configuraciones originales
  defaults write NSGlobalDomain AppleAntiAliasingThreshold -int "$ORIGINAL_ANTIALIAS"

  if [[ "$ORIGINAL_DARKMODE" == "Dark" ]]; then
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
  else
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'
  fi

  if [[ "$ORIGINAL_TRANSPARENCY" == "1" || "$ORIGINAL_TRANSPARENCY" == "true" ]]; then
    defaults write com.apple.universalaccess ReduceTransparency -bool true
  else
    defaults write com.apple.universalaccess ReduceTransparency -bool false
  fi

  defaults write NSGlobalDomain AppleAquaColorVariant -int "$ORIGINAL_MAINCOLOR"
  defaults write NSGlobalDomain AppleHighlightColor -string "$ORIGINAL_HIGHLIGHTCOLOR"
  defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int "$ORIGINAL_SIDEBAR_SIZE"
  defaults write com.apple.dock tilesize -int "$ORIGINAL_DOCK_SIZE"

  killall Dock Finder SystemUIServer 2>/dev/null
}

@test "Show help message" {
  run "$SCRIPT" --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: m appearance"* ]]
}

@test "Unknown option falls back to help" {
  run "$SCRIPT" --unknown
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage: m appearance"* ]]
}

@test "Check antialiasthreshold without value shows current" {
  run "$SCRIPT" --antialiasthreshold
  [ "$status" -eq 0 ]
  [[ "$output" == Antialiasing:* ]]
}

@test "Set antialiasthreshold to 4" {
  run "$SCRIPT" --antialiasthreshold 4
  [ "$status" -eq 0 ]
  [[ "$output" == *"Antialiasing set to 4"* ]]
}

@test "Check darkmode shows current status" {
  run "$SCRIPT" --darkmode
  [ "$status" -eq 0 ]
  [[ "$output" == Appearance:* ]]
}

@test "Enable darkmode" {
  run "$SCRIPT" --darkmode enable
  [ "$status" -eq 0 ]
}

@test "Disable darkmode" {
  run "$SCRIPT" --darkmode disable
  [ "$status" -eq 0 ]
}

@test "Set transparency to enable" {
  run "$SCRIPT" --transparency enable
  [ "$status" -eq 0 ]
}

@test "Set transparency to disable" {
  run "$SCRIPT" --transparency disable
  [ "$status" -eq 0 ]
}

@test "Set maincolor to blue" {
  run "$SCRIPT" --maincolor blue
  [ "$status" -eq 0 ]
}

@test "Set maincolor to graphite" {
  run "$SCRIPT" --maincolor graphite
  [ "$status" -eq 0 ]
}

@test "Set highlightcolor to lavender" {
  run "$SCRIPT" --highlightcolor lavender
  [ "$status" -eq 0 ]
  [[ "$output" == "Highlight color set to lavender" ]]
}

@test "Set iconsize to medium" {
  run "$SCRIPT" --iconsize medium
  [ "$status" -eq 0 ]
}

@test "Set iconsize to large" {
  run "$SCRIPT" --iconsize large
  [ "$status" -eq 0 ]
}
