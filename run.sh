#!/bin/sh

set -e

OPTIONS="-logtostderr -m"

if [ "X${OPENTSDB_HOST}" == "X" ]; then
    echo "Env variable 'OPENTSDB_HOST' missing - OpenTSDB / Bosun host not configured"
    exit 1
fi

if echo "${DEBUG}" | grep -i "^true$" >/dev/null; then
    OPTIONS="${OPTIONS} -d"
fi

exec /go/bin/scollector ${OPTIONS} -h ${OPENTSDB_HOST}
