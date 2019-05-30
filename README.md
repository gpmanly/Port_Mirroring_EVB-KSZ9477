# Port_Mirroring_EVB-KSZ9477

Setup
######
Port 5 is connected to a Raspberry Pi DHCP server
Port 1 is connected to PC1 pinging the DHCP server
Port 3 is connected to PC2 running Wireshark

Port 1 will be set as the port to be mirrored
Port 3 will be the sniffer port

DHCP server (RPi) has IP address 192.168.1.4
PC (Linux) on port 1 has IP address 192.168.1.2
PC (Windows) on port 3 has IP address 192.168.1.3

Monitor Wireshark traffic prior to mirroring 
Compare with traffic after mirroring enabled
#######



Observable Results:
#######
PC2 should only see its own traffic prior to mirroring (to/from 192.168.100.7 plus broadcasts from others)
Subsequently traffic to/from 192.168.0.9 should be seen on the port

sw/mirror_mode
sw6/6_mirror_rx
sw6/6_mirror_tx
sw6/6_mirror_port
sw6/6_member

echo 1 > sw2/2_mirror_port --- sniffer port Port 3
echo 1 > sw0/0_mirror_rx --- Receive Port
echo 1 > sw0/0_mirror_tx --- Transmit Port
#######