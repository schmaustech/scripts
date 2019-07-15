#!/bin/bash
for interface in $(curl -s https://172.22.0.152/redfish/v1/Systems/System.Embedded.1/EthernetInterfaces -k -u root:100Mgmt-|jq . |grep data.id|cut -d: -f2| sed 's/"//g'|grep NIC); do
    macaddress=$(curl -s https://172.22.0.152$interface  -k -u root:100Mgmt-|jq '.Description + .PermanentMACAddress')
    echo $macaddress
done
