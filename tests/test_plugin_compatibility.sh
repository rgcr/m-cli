#!/usr/bin/env bats

setup() {
    mkdir -p "${BATS_TEST_TMPDIR}/bin"
    export PATH="${BATS_TEST_TMPDIR}/bin:${PATH}"
    export M_TEST_CALLS="${BATS_TEST_TMPDIR}/calls"
    cat > "${BATS_TEST_TMPDIR}/bin/osascript" <<'EOF'
#!/bin/sh
printf 'osascript\n' >> "$M_TEST_CALLS"
EOF
    cat > "${BATS_TEST_TMPDIR}/bin/sudo" <<'EOF'
#!/bin/sh
printf 'sudo %s\n' "$*" >> "$M_TEST_CALLS"
if [ "$1" = cp ] && [ "$3" = "$M_TEST_HOSTS_FILE" ]; then
    exec cp "$2" "$3"
fi
EOF
    cat > "${BATS_TEST_TMPDIR}/bin/diskutil" <<'EOF'
#!/bin/sh
printf 'diskutil %s\n' "$*" >> "$M_TEST_CALLS"
EOF
    cat > "${BATS_TEST_TMPDIR}/bin/lpstat" <<'EOF'
#!/bin/sh
printf 'printer office is idle\n'
EOF
    cat > "${BATS_TEST_TMPDIR}/bin/launchctl" <<'EOF'
#!/bin/sh
printf 'launchctl %s\n' "$*" >> "$M_TEST_CALLS"
EOF
    cat > "${BATS_TEST_TMPDIR}/bin/m" <<'EOF'
#!/bin/sh
printf 'm %s\n' "$*" >> "$M_TEST_CALLS"
EOF
    chmod +x "${BATS_TEST_TMPDIR}/bin/"*
}

@test "shutdown help and unknown options never request shutdown" {
    run ./plugins/shutdown --help
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage:"* ]]

    run ./plugins/shutdown --unknown
    [ "$status" -ne 0 ]
    [ ! -e "$M_TEST_CALLS" ]
}

@test "shutdown without an option still requests the normal shutdown" {
    run ./plugins/shutdown
    [ "$status" -eq 0 ]
    [ "$(cat "$M_TEST_CALLS")" = 'osascript' ]
}

@test "printer documented names option lists printer names" {
    run ./plugins/printer --names
    [ "$status" -eq 0 ]
    [ "$output" = "office" ]
}

@test "hosts documented list option does not need sudo" {
    run ./plugins/hosts --ls
    [ "$status" -eq 0 ]
    [[ "$output" == *"IP"*"DOMAIN"* ]]
    [ ! -e "$M_TEST_CALLS" ]
}

@test "hosts add accepts the documented option and rejects a missing hostname" {
    run ./plugins/hosts --add 127.0.0.1
    [ "$status" -ne 0 ]
    [ ! -e "$M_TEST_CALLS" ]

    run ./plugins/hosts --add 127.0.0.1 example.test
    [ "$status" -eq 0 ]
    grep -F 'sudo /usr/bin/tee -a' "$M_TEST_CALLS"
}

@test "hosts remove only removes a matching hostname" {
    export M_TEST_HOSTS_FILE="${BATS_TEST_TMPDIR}/hosts"
    export HOSTS_FILE="$M_TEST_HOSTS_FILE"
    printf '127.0.0.1 example.test keep.test\n127.0.0.2 other.example.test\n' > "$HOSTS_FILE"

    run ./plugins/hosts --remove example.test
    [ "$status" -eq 0 ]
    [ "$(cat "$HOSTS_FILE")" = "$(printf '127.0.0.1\tkeep.test\n127.0.0.2 other.example.test')" ]
}

@test "service load accepts the documented plist path" {
    touch "${BATS_TEST_TMPDIR}/example.plist"
    run ./plugins/service --load "${BATS_TEST_TMPDIR}/example.plist"
    [ "$status" -eq 0 ]
    grep -Fx "sudo launchctl load -w ${BATS_TEST_TMPDIR}/example.plist" "$M_TEST_CALLS"

    run ./plugins/service --unload "${BATS_TEST_TMPDIR}/example.plist"
    [ "$status" -eq 0 ]
    grep -Fx "sudo launchctl unload -w ${BATS_TEST_TMPDIR}/example.plist" "$M_TEST_CALLS"
}

@test "service loads a user's LaunchAgent without sudo" {
    export HOME="${BATS_TEST_TMPDIR}/home"
    mkdir -p "$HOME/Library/LaunchAgents"
    touch "$HOME/Library/LaunchAgents/example.plist"

    run ./plugins/service --load "$HOME/Library/LaunchAgents/example.plist"
    [ "$status" -eq 0 ]
    grep -Fx "launchctl load -w $HOME/Library/LaunchAgents/example.plist" "$M_TEST_CALLS"
    ! grep -q '^sudo ' "$M_TEST_CALLS"
}

@test "disk format uses the diskutil eraseDisk verb" {
    run ./plugins/disk --format disk APFS test disk99
    [ "$status" -eq 0 ]
    grep -Fx 'diskutil eraseDisk APFS test disk99' "$M_TEST_CALLS"
}

@test "permissions lists services with the macOS system Bash" {
    run /bin/bash ./plugins/permissions --services
    [ "$status" -eq 0 ]
    [[ "$output" == *"camera"* ]]
    [[ "$output" != *"invalid option"* ]]
}

@test "user confirmation accepts yes with the macOS system Bash" {
    run /bin/bash -c 'source ./plugins/user --help >/dev/null; confirm "Delete?" <<< "YES"'
    [ "$status" -eq 0 ]
}
