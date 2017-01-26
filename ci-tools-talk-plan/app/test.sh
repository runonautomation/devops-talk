#!/usr/bin/env bash
# Starting the server
nodejs server.js &
SERVER_PID=$!

sleep 1

echo Executing integration test, server reply must contain Hello:
curl localhost:8081 | grep Hello
TEST_RESULT=$?
echo TEST_RESULT: $TEST_RESULT

kill $SERVER_PID

exit $TEST_RESULT