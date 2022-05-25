#!/usr/bin/env bash

SIM_DIR=$1
START=1
END=$2
RESULTS=$3
PAYMENTS=$4
FEERATES=$5

pushd $SIM_DIR
./autogen.sh && ./configure --disable-tests --disable-bench && make -j "$(($(nproc)+1))"
for (( c=$START; c<=$END; c++ ))
do
    nohup ./test/functional/sim_coinselect.py $RESULTS --payments $PAYMENTS --feerates $FEERATES > /dev/null 2>&1 &
done
popd
