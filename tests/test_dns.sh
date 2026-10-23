#!/usr/bin/env bats

setup() {
    mkdir -p "${BATS_TEST_TMPDIR}/bin"
    export PATH="${BATS_TEST_TMPDIR}/bin:${PATH}"
    export M_TEST_CALLS="${BATS_TEST_TMPDIR}/calls"

    cat > "${BATS_TEST_TMPDIR}/bin/scutil" <<'EOF'
#!/bin/sh
if [ "$1" = --dns ]; then
    printf 'resolver #1\n  nameserver[0] : 198.51.100.53\nresolver #2\n  nameserver[0] : 2001:db8::53\n'
else
    read -r command
    case "$command" in
        'get State:/Network/Global/IPv4') printf '  PrimaryService : TEST-UUID\n' ;;
        'get Setup:/Network/Service/TEST-UUID') printf '  UserDefinedName : Office Wi-Fi\n' ;;
    esac
fi
EOF
    cat > "${BATS_TEST_TMPDIR}/bin/networksetup" <<'EOF'
#!/bin/sh
if [ "$1" = -getdnsservers ]; then
    if [ "$M_TEST_AUTO" = 1 ]; then
        printf "There aren't any DNS Servers set on %s.\n" "$2"
    else
        printf '192.0.2.1\n'
    fi
else
    printf 'networksetup %s\n' "$*" >> "$M_TEST_CALLS"
fi
EOF
    cat > "${BATS_TEST_TMPDIR}/bin/sudo" <<'EOF'
#!/bin/sh
printf 'sudo\n' >> "$M_TEST_CALLS"
printf 'arg:%s\n' "$@" >> "$M_TEST_CALLS"
EOF
    chmod +x "${BATS_TEST_TMPDIR}/bin/"*
}

@test "dns list includes scoped resolvers from scutil" {
    run ./plugins/dns --list
    [ "$status" -eq 0 ]
    [[ "$output" == *"198.51.100.53"* ]]
    [[ "$output" == *"2001:db8::53"* ]]
}

@test "dns add appends to the selected service's configured servers" {
    run ./plugins/dns --add 198.51.100.53 'Office Wi-Fi'
    [ "$status" -eq 0 ]
    grep -Fx 'arg:-setdnsservers' "$M_TEST_CALLS"
    grep -Fx 'arg:Office Wi-Fi' "$M_TEST_CALLS"
    grep -Fx 'arg:192.0.2.1' "$M_TEST_CALLS"
    grep -Fx 'arg:198.51.100.53' "$M_TEST_CALLS"
}

@test "dns add uses the primary service when none is named" {
    run ./plugins/dns --add 198.51.100.53
    [ "$status" -eq 0 ]
    grep -Fx 'arg:Office Wi-Fi' "$M_TEST_CALLS"
}

@test "dns add creates an explicit list when a service uses automatic DNS" {
    export M_TEST_AUTO=1
    run ./plugins/dns --add 198.51.100.53 'Office Wi-Fi'
    [ "$status" -eq 0 ]
    grep -Fx 'arg:198.51.100.53' "$M_TEST_CALLS"
    [ "$(grep -c '^arg:' "$M_TEST_CALLS")" -eq 4 ]
}
