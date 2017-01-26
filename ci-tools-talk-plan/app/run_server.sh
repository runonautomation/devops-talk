#!/usr/bin/env bash
pkill -f nodejs
nodejs server.js &> server.log & disown