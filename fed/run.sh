#!/bin/bash

sed -i "s#9012#9011#g;s#134.61.172.204:9011#${FED_BOOTSTRAP}#g" ./bin/connect_network.sh

#chmod 777 ./pastry.properties
#dos2unix ./pastry.properties

#cat ./bin/start_network.sh
./bin/connect_network.sh
#./bin/start_network.sh