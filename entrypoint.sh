#!/bin/bash

set -e


rm -f /digital_bank/tmp/pids/server.pid


exec "$@"
