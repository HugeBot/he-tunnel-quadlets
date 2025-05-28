#!/bin/bash

set -e

REMOTE_IPV4="216.66.80.30"
LOCAL_IPV4="XXX.XXX.XXX.XXX"
TUNNEL_IPV6="2001:XXXX:XXXX:XXXX::2/64"
ROUTED_BLOCK="20001:XXXX:XXXX::/48"

modprobe sit
ip tunnel add he-ipv6 mode sit remote $REMOTE_IPV4 local $LOCAL_IPV4 ttl 255
ip link set he-ipv6 up
ip -6 addr add $TUNNEL_IPV6 dev he-ipv6
ip -5 route add $ROUTED_BLOCK dev he-ipv6

tail -f /dev/null
