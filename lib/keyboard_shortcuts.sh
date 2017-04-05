_mcli_keyboard_shortcut_toggle(){
  local path_to_plistbuddy="/usr/libexec/PlistBuddy"
  local keyboard_shortcut_id="$1"
  local enabled="$2"
  local plist_path="/Users/$(whoami)/Library/Preferences/com.apple.symbolichotkeys.plist"

  ${path_to_plistbuddy} -c "Delete :AppleSymbolicHotKeys:${keyboard_shortcut_id}:enabled" ${plist_path} 2> /dev/null
  ${path_to_plistbuddy} -c "Add :AppleSymbolicHotKeys:${keyboard_shortcut_id}:enabled bool ${enabled}" ${plist_path} 2> /dev/null
}
