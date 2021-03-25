#!/bin/bash

APP_DIR=/apps/

$APP_DIR/cresset/CEBroker2/bin/CEBroker2 -v -p 9000 -P 9001 -e -m 40 -M 10 -g 20 -s $APP_DIR/cresset/start-SLURM-engine.sh < /dev/null > $APP_DIR/cresset/cebroker2.log 2>&1 &