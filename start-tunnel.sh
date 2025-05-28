#!/bin/bash

set -e

modprobe sit
ip tunnel add he-ipv6 mode sit remote $REMOTE_IPV4 local $LOCAL_IPV4 ttl 255
ip link set he-ipv6 up
ip -6 addr add $TUNNEL_IPV6 dev he-ipv6
ip -5 route add $ROUTED_BLOCK dev he-ipv6

tail -f /dev/null
