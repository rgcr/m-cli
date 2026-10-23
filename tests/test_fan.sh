#!/usr/bin/env bats

setup() {
    test_bin="$(mktemp -d)"
    export TEST_BIN="$test_bin"
    export PATH="$test_bin:$PATH"

    cat >"$test_bin/powermetrics" <<'EOF'
#!/usr/bin/env bash
if [[ "$1" == --help ]]; then
    printf 'Supported samplers: thermal, cpu_power\n'
else
    printf 'powermetrics: unrecognized sampler: smc\n' >&2
    exit 1
fi
EOF
    cat >"$test_bin/sudo" <<'EOF'
#!/usr/bin/env bash
"$@"
EOF
    cat >"$test_bin/pmset" <<'EOF'
#!/usr/bin/env bash
printf 'wattage\n'
EOF
    cat >"$test_bin/iSMC" <<'EOF'
#!/usr/bin/env bash
if [[ -e "$TEST_BIN/read-once" ]]; then
    exit 1
fi
touch "$TEST_BIN/read-once"
printf 'Fan 1 Current Speed  1200 rpm\nFan 2 Current Speed  1300 rpm\n'
EOF
    chmod +x "$test_bin"/*
}

teardown() {
    rm -rf "$test_bin"
}

@test "fan --speed reads both fans when powermetrics has no smc sampler" {
    run ./plugins/fan --speed
    [ "$status" -eq 0 ]
    [[ "$output" == *'Fan 1 Current Speed  1200 rpm'* ]]
    [[ "$output" == *'Fan 2 Current Speed  1300 rpm'* ]]
}

@test "fan --monitor displays fan readings and stops when the reader fails" {
    run ./plugins/fan --monitor
    [ "$status" -ne 0 ]
    [[ "$output" == *'Fan 1 Current Speed  1200 rpm'* ]]
}
