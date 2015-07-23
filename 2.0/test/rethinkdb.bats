#!/usr/bin/env bats

@test "It should install RethinkDB 2.0.4" {
  run rethinkdb --version
  [[ "$output" =~ "rethinkdb 2.0.4" ]]
}

@test "It should install the RethinkDB Python library" {
  echo "import rethinkdb" | python -
}
