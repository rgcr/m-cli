#!/usr/bin/env bats

setup() {
    mkdir -p "${BATS_TEST_TMPDIR}/bin"
    export PATH="${BATS_TEST_TMPDIR}/bin:${PATH}"
    export M_TEST_CALLS="${BATS_TEST_TMPDIR}/calls"
    export M_TEST_VERSION=26.6.2

    cat > "${BATS_TEST_TMPDIR}/bin/sw_vers" <<'EOF'
#!/bin/sh
printf '%s\n' "$M_TEST_VERSION"
EOF
    cat > "${BATS_TEST_TMPDIR}/bin/sudo" <<'EOF'
#!/bin/sh
printf 'sudo %s\n' "$*" >> "$M_TEST_CALLS"
EOF
    cat > "${BATS_TEST_TMPDIR}/bin/spctl" <<'EOF'
#!/bin/sh
printf 'spctl %s\n' "$*" >> "$M_TEST_CALLS"
EOF
    chmod +x "${BATS_TEST_TMPDIR}/bin/"*
}

@test "gatekeeper disable on macOS 15+ reveals the Settings control" {
    run ./plugins/gatekeeper --disable
    [ "$status" -ne 0 ]
    grep -Fx 'sudo spctl --global-disable' "$M_TEST_CALLS"
    [[ "$output" == *'System Settings'* ]]
}

@test "gatekeeper enable on macOS 15+ uses the supported global command" {
    run ./plugins/gatekeeper --enable
    [ "$status" -eq 0 ]
    grep -Fx 'sudo spctl --global-enable' "$M_TEST_CALLS"
}

@test "gatekeeper uses the older toggle on macOS 14" {
    export M_TEST_VERSION=14.7.8
    run ./plugins/gatekeeper --disable
    [ "$status" -eq 0 ]
    grep -Fx 'sudo spctl --master-disable' "$M_TEST_CALLS"
}

@test "gatekeeper rule changes request administrator privileges" {
    run ./plugins/gatekeeper --enable-rule trusted
    [ "$status" -eq 0 ]
    grep -Fx 'sudo spctl --enable --label trusted' "$M_TEST_CALLS"
}
