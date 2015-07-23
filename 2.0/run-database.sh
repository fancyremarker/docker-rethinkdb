#!/bin/bash

. /usr/bin/utilities.sh

start_server() {
  rethinkdb --bind all --directory "$DATA_DIRECTORY" $@
}

if [[ "$1" == "--initialize" ]]; then
  start_server --daemon
  python - << PYTHON
import time, rethinkdb
# Server may take several seconds to start...
while True:
  try:
    conn = rethinkdb.connect(host='localhost', port=28015)
  except rethinkdb.errors.RqlDriverError:
    print 'Waiting for server...'
    time.sleep(1)
    continue
  break
auth = rethinkdb.db('rethinkdb').table('cluster_config').get('auth')
auth.update({'auth_key': 'foobar'}).run(conn)
PYTHON

elif [[ "$1" == "--client" ]]; then
  echo "This image does not support the --client option. Use curl instead."
  exit 1

elif [[ "$1" == "--readonly" ]]; then
  # https://github.com/rethinkdb/rethinkdb/issues/1805
  echo "This image does not support read-only mode. Starting database normally."
  start_server

else
  start_server

fi
