#!/bin/sh
/etc/rc.d/rc.inet1  ${LXNM_IFNAME}_stop
/etc/rc.d/rc.inet1  ${LXNM_IFNAME}_start
