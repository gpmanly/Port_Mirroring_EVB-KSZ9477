#!/bin/sh

HOME=/sys/class/net/eth0/
cd $HOME

start(){
        echo 1 > sw2/2_mirror_port
        echo 1 > sw0/0_mirror_rx
        echo 1 > sw0/0_mirror_tx

        echo 1 > sw1/1_mirror_rx
        echo 1 > sw1/1_mirror_tx

#       echo 1 > sw4/4_mirror_rx
#       echo 1 > sw4/4_mirror_tx

#       echo 1 > sw5/5_mirror_rx
#       echo 1 > sw5/5_mirror_tx

        echo 0 >sw/mirror_mode

        exit 0
}

stop(){
        echo 0 > sw2/2_mirror_port
        echo 0 > sw0/0_mirror_rx
        echo 0 > sw0/0_mirror_tx

        echo 0 > sw1/1_mirror_rx
        echo 0 > sw1/1_mirror_tx

        echo 0 > sw4/4_mirror_rx
        echo 0 > sw4/4_mirror_tx

        echo 0 > sw5/5_mirror_rx
        echo 0 > sw5/5_mirror_tx

        exit 0
}

case "$1" in
start)
        start
        ;;
stop)
        stop
        ;;
*)
        echo "Usage: $0 {start|stop}"
        echo "Mirror all ports and forwards to Port 3"
        echo
        exit 1
        ;;
esac

exit $?
