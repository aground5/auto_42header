#!/bin/sh

ps -ef | sed -n '2, $p' | awk '{print $2}' | xargs kill -9
