@test "os/linux - rootfs" {
  result="$(./tests/fixtures/bin/ruby -e 'print %x{ ls / }')"
  [[ "$result" =~ "bin"   ]]
  [[ "$result" =~ "etc"   ]]
  [[ "$result" =~ "lib"   ]]
  [[ "$result" =~ "lib64" ]]
  [[ "$result" =~ "sbin"  ]]
  [[ "$result" =~ "usr"   ]]
  [[ "$result" =~ "opt"   ]]
  [[ "$result" =~ "sys"   ]]
  [[ "$result" =~ "dev"   ]]
  [[ "$result" =~ "run"   ]]
  [[ "$result" =~ "tmp"   ]]
  [[ "$result" =~ "home"  ]]
  [[ "$result" =~ "proc"  ]]
  [[ ! "$result" =~ "boot"  ]]
  [[ ! "$result" =~ "mnt"   ]]
  [[ ! "$result" =~ "root"  ]]
  [[ ! "$result" =~ "var"   ]]
}

@test "os/linux - envs" {
  result="$(MYENV=123 ./tests/fixtures/bin/ruby -e 'print %x{ env }')"
  [[ "$result" =~ "HAKONIWAD_CONTAINER=default" ]]
  [[ "$result" =~ "HOME=" ]]
  [[ "$result" =~ "LANG=" ]]
  [[ "$result" =~ "PATH=" ]]
  [[ "$result" =~ "XDG_RUNTIME_DIR=" ]]
  [[ ! "$result" =~ "MYENV=" ]]
}

@test "os/linux - landlock.fs" {
  result="$(./tests/fixtures/bin/ruby -e 'print %x{ cp -p /usr/bin/true ~/true && stat -c "%a" ~/true }')"
  [[ "$result" =~ "755" ]]

  result="$(./tests/fixtures/bin/ruby -e 'print %x{ cp -p /usr/bin/true ~/true && ~/true 2>&1 }')"
  [[ "$result" =~ "Permission denied" ]]
}

@test "os/linux - landlock.net" {
  result="$(./tests/fixtures/bin/ruby -e 'print %x{ aria2c https://www.example.com --dry-run }')"
  [[ "$result" =~ "(OK):download completed." ]]

  result="$(./tests/fixtures/bin/ruby -e 'print %x{ aria2c https://www.example.com --dry-run --all-proxy=http://127.0.0.1:403 }')"
  [[ "$result" =~ "Permission denied" ]]
}

@test "network/mode/host" {
  [ true ]
}

@test "network/mode/autoproxy" {
  result="$(ALL_PROXY=http://127.0.0.1:403 ./tests/fixtures/bin/ruby -e 'print %x{ aria2c https://www.example.com --dry-run --all-proxy=http://127.0.0.1:403 }')"
  [[ "$result" =~ "Connection refused" ]]
}

@test "network/mode/http" {
  result="$(./tests/fixtures/bin/ruby -e 'print %x{ aria2c  http://www.example.com --dry-run }')"
  [[ "$result" =~ "(OK):download completed." ]]
}

@test "network/mode/https" {
  result="$(./tests/fixtures/bin/ruby -e 'print %x{ aria2c https://www.example.com --dry-run }')"
  [[ "$result" =~ "(OK):download completed." ]]
}

@test "filesystem/xdg-code" {
  result="$(./tests/fixtures/bin/ruby -e 'print %x{ ls ~ }')"
  [[ "$result" =~ "Code"   ]]
}
