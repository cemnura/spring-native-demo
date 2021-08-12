#!/bin/sh
$@ &
MY_PID=$!
sleep 0.02
psrecord $MY_PID --plot startup-plot.png &
sleep 1
until $(curl --output /dev/null --silent --head --fail localhost:8080/health); do
    printf '.'
    sleep 1
done
sleep 1
curl localhost:8080/health
sleep 1
curl localhost:8080/health
sleep 1

kill -9 $MY_PID

echo "\n"
echo $(pwd)/startup-plot.png