#!/bin/bash
set -e

if [ "${USE_CONFD}" == "**False**" ]; then
	unset USE_CONFD
fi

CONFD_BACKEND=${CONFD_BACKEND:-etcd}
CONFD_PREFIX=${CONFD_PREFIX:-/}
CONFD_NODE=${CONFD_NODE:-127.0.0.1:4001}

if [ -d /app/etc/confd ] && [ -n "${USE_CONFD}" ] ; then
	echo "Confd confdir found, generate env"
	confd -confdir="/app/etc/confd" -onetime=true -backend="${CONFD_BACKEND}" -node="${CONFD_NODE}" -prefix="${CONFD_PREFIX}"
	echo "Generate env done"
fi
