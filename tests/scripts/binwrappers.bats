@test "profiles - file exist" {
  while read -r bin group _
  do
    [ -n "$bin" ]
    [ -n "$group" ]

    profile="./hakoniwa.d/$bin.toml"
    [ -f "$profile" ]
  done < <(tr -s '[:blank:]' < ./scripts/binwrappers.txt)
}

@test "profiles - file format valid" {
  while read -r bin group comment
  do
    profile="./hakoniwa.d/$bin.toml"
    profile_content=$(cat "$profile")

    if [ -L "$profile" ]; then
      binname=$(readlink "$profile")
      binname=${binname%".toml"}
      [[ "$comment" == "# -> $binname.toml" ]]
    else
      binname="$bin"
      [ -z "$comment" ]
    fi

    [[ "$profile_content" == *"set _binname_ = \"$binname\""* ]]    # biname equals to filename
    [[ "$profile_content" == *"include \"presets/$group.toml"* ]]   # biname belongs to a group
  done < <(tr -s '[:blank:]' < ./scripts/binwrappers.txt)
}

@test "profiles - runnable" {
  if [ "$CI" != true ]; then
    skip "This testcase will create folders under '~/.local/share/hakoniwa/apps/', set CI=true to allow it"
  fi

  repo="$PWD"; cd "$HOME"
  while read -r bin group _
  do
    profile="$repo/hakoniwa.d/$bin.toml"
    result=$(/usr/bin/hakoniwa run -c "$profile" -- echo "OK")
    [[ "$result" == "OK" ]]
  done < <(tr -s '[:blank:]' < "$repo/scripts/binwrappers.txt")
}
